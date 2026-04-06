# --- 1. Load Libraries ---
library(jsonlite)
library(dplyr)
library(readr)

# --- 2. Define File Paths ---
raw_json_path <- "data/raw_nvda_data.json"
processed_csv_path <- "data/processed_nvda_data.csv"

# --- 3. Load and Parse Raw JSON Data ---
print(paste("Loading raw JSON from:", raw_json_path))
raw_data <- fromJSON(raw_json_path)

# The actual time series data is nested inside 'Time Series (Daily)'
time_series_data <- raw_data$`Time Series (Daily)`

# --- 4. Process and Clean the Data ---
print("Processing and cleaning data...")

# Convert the nested list into a data frame
df <- data.frame(date = names(time_series_data),
                 do.call(rbind, time_series_data),
                 row.names = NULL)

# Rename columns to be cleaner (R-friendly names)
# This is MODIFIED for the new 5-column API output
df_cleaned <- df %>%
  rename(
    open = `X1..open`,
    high = `X2..high`,
    low = `X3..low`,
    close = `X4..close`,
    volume = `X5..volume`
  )

# Convert columns to the correct data types
df_final <- df_cleaned %>%
  mutate(
    date = as.Date(date),
    open = as.numeric(open),
    high = as.numeric(high),
    low = as.numeric(low),
    close = as.numeric(close),
    volume = as.numeric(volume)
  ) %>%
  # Sort by date (oldest to newest)
  arrange(date)

print("Data cleaning complete.")

# --- 5. Save Processed Data to CSV ---
write_csv(df_final, processed_csv_path)

print(paste("Processed data saved to:", processed_csv_path))

# --- 6. (Optional) View the Clean Data ---
print("Clean data structure:")
str(df_final)
print("First few rows of clean data:")
head(df_final)