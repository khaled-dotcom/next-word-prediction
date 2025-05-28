Next Word Prediction Project
Description
This project implements a Next Word Prediction model using R. The model predicts the most probable next word based on the input text, leveraging cleaned and preprocessed textual data. The workflow includes:

Data Cleaning: Raw text data is processed by removing punctuation, numbers, stopwords, and applying lowercasing to ensure quality input.

Next Word Prediction: The model uses n-gram frequency counts from the cleaned data to predict the most likely next word(s).

Result Printing: All prediction results for given inputs can be printed or displayed.

Web Server: A simple web server using the shiny package is created to interactively test the next word prediction functionality through a user-friendly web interface.

Features
Text preprocessing and cleaning pipeline for raw text data.

N-gram based prediction of the next word.

Display of all prediction candidates.

Interactive Shiny web application for real-time prediction.

Usage
Load and clean your dataset.

Train or generate n-gram frequency tables.

Input text to predict the next word(s).

View the predictions on the Shiny web app interface.

Technologies Used
R programming language

Text mining and NLP packages: tm, stringr, dplyr

Web app framework: shiny
