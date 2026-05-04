# NorthStar Urban Mobility and Logistics
# Python Data Processing Script

import pandas as pd


def load_data(file_path):
    """Load the sample logistics dataset."""
    return pd.read_csv(file_path)


def clean_data(df):
    """Clean and prepare the dataset for analysis."""
    df = df.drop_duplicates()
    df["distance_km"] = pd.to_numeric(df["distance_km"], errors="coerce")
    df = df.dropna()
    return df


def summarise_deliveries(df):
    """Create a simple delivery status summary."""
    return df.groupby("delivery_status").size().reset_index(name="total_deliveries")


def main():
    file_path = "data/sample_data.csv"

    df = load_data(file_path)
    cleaned_df = clean_data(df)
    summary = summarise_deliveries(cleaned_df)

    print("Cleaned Dataset:")
    print(cleaned_df)

    print("\nDelivery Status Summary:")
    print(summary)


if __name__ == "__main__":
    main()
