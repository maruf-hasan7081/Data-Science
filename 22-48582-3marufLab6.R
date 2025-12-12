needed <- c("tidyverse", "readr", "stringr", "janitor",
            "tidytext", "SnowballC", "wordcloud", "topicmodels")

to_install <- setdiff(needed, rownames(installed.packages()))
if (length(to_install)) install.packages(to_install, dependencies = TRUE)

library(tidyverse)
library(readr)
library(stringr)
library(janitor)
library(tidytext)
library(SnowballC)
library(wordcloud)
library(topicmodels)
install.packages("readr", dependencies = TRUE)

library(readr)
install.packages("tidyverse", dependencies = TRUE)

library(tidyverse) 


csv_path <- "D:\\scraped_articles.csv"

TEXT_COL <- "content"
library(readr)


raw <- read_csv(csv_path, locale = locale(encoding = "UTF-8"), show_col_types = FALSE)

# If the specified TEXT_COL is not present, try to guess a plausible text column
if (!TEXT_COL %in% names(raw)) {
  candidates <- names(raw)[map_lgl(raw, ~ is.character(.x) || is.factor(.x))]
  TEXT_COL <- candidates[which.max(sapply(raw[candidates],
                                          function(x) mean(nchar(as.character(x)), na.rm = TRUE)))]
  message("Guessed text column: ", TEXT_COL)
}

df <- raw %>%
  mutate(doc_id = row_number(),
         text   = as.character(.data[[TEXT_COL]])) %>%
  select(doc_id, everything())

# Normalize encoding
df$text <- iconv(df$text, from = "", to = "UTF-8")

# Basic checks
cat("Rows:", nrow(df), "\n")


cat("NAs in text:", sum(is.na(df$text)), "\n")


# Drop NA/blank and exact duplicate texts
df <- df %>%
  filter(!is.na(text)) %>%
  mutate(text = str_squish(text)) %>%
  filter(text != "") %>%
  distinct(text, .keep_all = TRUE)

# Show a sample
df %>% select(doc_id, !!TEXT_COL := text) %>% head(5)


clean_text <- function(x) {
  x %>%
    str_replace_all("https?://\\S+|www\\.[^\\s]+", " ") %>%  # URLs
    str_replace_all("@\\w+|#\\w+", " ") %>%                 # mentions/hashtags
    str_replace_all("[^\\p{L}\\p{N}\\s']", " ") %>%         # keep letters, numbers, space, '
    str_to_lower() %>%
    str_squish()
}

df <- df %>% mutate(text_clean = clean_text(text))

# Show cleaned sample
df %>% select(doc_id, text, text_clean) %>% head(5)



library(tidytext)
install.packages("tidytext", dependencies = TRUE)


# load stop words
data("stop_words")


df <- df %>% 
  mutate(text_clean = text)  # clean version of text

tokens <- df %>%
  unnest_tokens(word, text_clean, token = "words") %>%
  anti_join(stop_words, by = "word") %>%
  filter(nchar(word) >= 3)


my_sw <- tibble(word = c("said", "also", "new", "one"))
tokens <- tokens %>% anti_join(my_sw, by = "word")

tokens <- tokens %>%
  mutate(stem = SnowballC::wordStem(word, language = "en"))

tokens %>% select(doc_id, word, stem) %>% head(10)

word_freq <- tokens %>%
  count(stem, sort = TRUE)

head(word_freq, 20)

top_n <- 20
p <- word_freq %>%
  slice_max(n, n = top_n) %>%
  ggplot(aes(x = reorder(stem, n), y = n)) +
  geom_col() +
  coord_flip() +
  labs(title = paste("Top", top_n, "words (by frequency)"),
       x = "Word (stem)", y = "Count") +
  theme_minimal()
p

ggplot2::ggsave("top_words_bar.png", p, width = 7, height = 5, dpi = 300)


par(mar = c(1,1,1,1))  # prevent "figure margins too large"
wc_df <- word_freq %>% filter(n > 1)
suppressWarnings(
  wordcloud(words = wc_df$stem, freq = wc_df$n, max.words = 200, random.order = FALSE)
)


# Save as PNG
png("wordcloud.png", width = 1200, height = 900, res = 150)
par(mar = c(1,1,1,1))
wordcloud(words = wc_df$stem, freq = wc_df$n, max.words = 200, random.order = FALSE)
dev.off()

tfidf <- tokens %>%
  count(doc_id, stem, sort = FALSE) %>%
  bind_tf_idf(term = stem, document = doc_id, n = n) %>%
  arrange(desc(tf_idf))

head(tfidf, 15)


# DTM with TF-IDF weights
dtm_tfidf <- tfidf %>%
  cast_dtm(document = doc_id, term = stem, value = tf_idf)

dtm_tfidf

k <- 3
lda_model <- LDA(dtm_tfidf, k = k, control = list(seed = 1234))

library(tidytext)
topic_terms <- tidy(lda_model, matrix = "beta") %>%
  group_by(topic) %>%
  slice_max(beta, n = 10) %>%
  ungroup()

topic_terms


write_csv(df,        "cleaned_text.csv")
write_csv(word_freq, "top_words.csv")
write_csv(tfidf,     "tfidf_by_doc.csv")
cat("Saved files: cleaned_text.csv, top_words.csv, tfidf_by_doc.csv, top_words_bar.png, wordcloud.png\n")
