library(shiny)
library(dplyr)
library(tidytext)
library(tidyr)
library(ggplot2)

# Sample corpus
sample_text <- c(
  "The quick brown fox jumps over the lazy dog.",
  "The cat sat on the mat.",
  "A fast blue car sped down the highway.",
  "The dog chased the cat down the street.",
  "The car stopped at the red light."
)

# Create data frame
text_df <- tibble(text = tolower(sample_text))

clean_text <- text_df %>%
  mutate(text = tolower(text)) %>%                              # Lowercase
  mutate(text = str_replace_all(text, "[^a-z\\s]", "")) %>%     # Remove punctuation
  mutate(text = str_replace_all(text, "\\d+", ""))              # Remove numbers

# ===============================
# Tokenization
# ===============================
tokens <- clean_text %>%
  unnest_tokens(word, text)

# ===============================
# Remove Stopwords
# ===============================
data("stop_words")
tokens_clean <- tokens %>%
  anti_join(stop_words, by = "word")

# ===============================
# Word Stemming
# ===============================
tokens_clean <- tokens_clean %>%
  mutate(word = wordStem(word))

# ===============================
# Word Frequency Table
# ===============================
word_freq <- tokens_clean %>%
  count(word, sort = TRUE)

# Show top 10 words
cat("Top 10 Frequent Words:\n")
print(head(word_freq, 10))

# ===============================
# Bar Plot of Top Words
# ===============================
top_words_plot <- word_freq %>%
  top_n(10, n) %>%
  ggplot(aes(x = reorder(word, n), y = n, fill = word)) +
  geom_col(show.legend = FALSE) +
  coord_flip() +
  labs(title = "Top 10 Frequent Words", x = "Word", y = "Frequency") +
  theme_minimal()

print(top_words_plot)

# ===============================
# TF-IDF Calculation
# ===============================
tf_idf <- tokens_clean %>%
  count(doc_id, word, sort = TRUE) %>%
  bind_tf_idf(word, doc_id, n)

cat("\nTop 10 TF-IDF Words:\n")
print(tf_idf %>% arrange(desc(tf_idf)) %>% head(10))

# ===============================
# Word Cloud
# ===============================
set.seed(123)
wordcloud(words = word_freq$word,
          freq = word_freq$n,
          min.freq = 1,
          max.words = 100,
          random.order = FALSE,
          colors = brewer.pal(8, "Dark2"))

# Bigram frequency table
bigrams <- text_df %>%
  unnest_tokens(bigram, text, token = "ngrams", n = 2) %>%
  separate(bigram, into = c("word1", "word2"), sep = " ") %>%
  count(word1, word2, sort = TRUE)
