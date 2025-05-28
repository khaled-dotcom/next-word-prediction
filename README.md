

# 📘 Next Word Prediction Using N-gram Language Models in R

## 🔍 Project Overview

This project implements a **Next Word Prediction system** using R, designed to suggest the most probable word following a given text input. The solution is built on **n-gram language modeling**, leveraging a clean, tokenized text corpus to predict upcoming words. A user-friendly **Shiny web application** is developed to enable real-time interaction with the model.

---

## 🎯 Objectives

* Develop a robust text preprocessing pipeline.
* Construct frequency-based n-gram models (unigram, bigram, trigram).
* Implement a predictive algorithm with backoff logic to handle incomplete n-grams.
* Deliver an interactive prediction tool through a responsive Shiny web interface.

---

## 🧠 Methodology

### 1. **Text Preprocessing**

* Remove punctuation, numbers, and stopwords.
* Convert all text to lowercase.
* Tokenize text into words for n-gram modeling.
* Employ R packages: `tm`, `stringr`, `dplyr`.

### 2. **N-gram Model Construction**

* Generate frequency tables for unigrams, bigrams, and trigrams.
* Store and manage n-gram models for efficient lookup during prediction.

### 3. **Prediction Algorithm**

* Accept partial sentence input.
* Search trigram table for matches; if not found, backoff to bigrams or unigrams.
* Rank predictions based on frequency/probability.

### 4. **Web Application (Shiny)**

* Allow users to enter custom text input.
* Display most probable next word predictions dynamically.
* Enable review of all prediction candidates.

---

## ✨ Key Features

* 🔄 **Automated Text Cleaning**: Modular, reusable functions for data preprocessing.
* 📚 **N-gram Frequency Models**: Efficient trigram-to-unigram lookup for contextual prediction.
* 📈 **Prediction Ranking**: Frequency-based ordering of suggested words.
* 🖥️ **Interactive UI**: Real-time prediction using the Shiny web framework.

---

## 🛠️ Technology Stack

| Category        | Tools / Packages                 |
| --------------- | -------------------------------- |
| Programming     | R                                |
| Text Mining     | `tm`, `stringr`, `dplyr`         |
| N-gram Modeling | Base R, `tidytext`, `tokenizers` |
| Web Framework   | `shiny`                          |

---

## 🚀 How to Use

1. **Load and preprocess** your dataset using the provided cleaning functions.
2. **Generate n-gram models** by running the model builder script.
3. **Launch the Shiny app**:

   ```r
   shiny::runApp("app.R")
   ```
4. **Input your sentence** in the app and view the top predicted next word(s).

---

## 📁 Project Structure

```
next-word-prediction/
│
├── data/                     # Raw and cleaned corpus files
├── scripts/
│   ├── clean_text.R          # Text preprocessing logic
│   ├── generate_ngrams.R     # N-gram frequency generation
│   └── predict_word.R        # Word prediction function
├── app.R                     # Shiny web application script
├── README.md                 # Project overview and instructions
└── ngram_models/             # Saved frequency tables
```

---

## ✅ Outcomes

* Functional Next Word Prediction model based on statistical language modeling.
* Fully operational Shiny web application for demonstration and testing.
* Modular, extensible code suitable for larger NLP pipelines.

---

If you'd like, I can also provide a **complete R codebase** including:

* Preprocessing script
* N-gram frequency generator
* Prediction logic
* Shiny web app interface


