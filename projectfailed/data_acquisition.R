# --- 1. Install and Load Libraries ---
library(httr)
library(jsonlite)
library(dplyr)
library(readr)

# --- 2. Alpha Vantage API Configuration ---
api_key <- "H5NK4W27YQP96S3V"
symbol <- "NVDA"

# MODIFIED: Use the FREE 'TIME_SERIES_DAILY' endpoint
api_url <- paste0("https://www.alphavantage.co/query?function=TIME_SERIES_DAILY",
                  "&symbol=", symbol,
                  "&outputsize=full",
                  "&apikey=", api_key)

# --- 3. API Call and Data Retrieval ---
print("Fetching data from Alpha Vantage API...")
response <- GET(api_url)

# Get the content of the response as text
json_content <- content(response, "text", encoding = "UTF-8")

print("Data retrieval complete.")

# --- 4. Save Raw JSON File ---
raw_json_path <- "data/raw_nvda_data.json"
write_lines(json_content, raw_json_path)

print(paste("Raw JSON data saved to:", raw_json_path))