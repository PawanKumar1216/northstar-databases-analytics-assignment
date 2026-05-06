import pandas as pd


def read_delivery_data(path):
    data = pd.read_csv(path)
    return data


def clean_delivery_data(data):
    cleaned = data.copy()

    cleaned = cleaned.drop_duplicates()
    cleaned["distance_km"] = pd.to_numeric(cleaned["distance_km"], errors="coerce")
    cleaned = cleaned.dropna()

    return cleaned


def delivery_status_summary(data):
    summary = (
        data.groupby("delivery_status")
        .size()
        .reset_index(name="total_deliveries")
        .sort_values("total_deliveries", ascending=False)
    )

    return summary


def main():
    file_path = "data/sample_data.csv"

    deliveries = read_delivery_data(file_path)
    cleaned_deliveries = clean_delivery_data(deliveries)
    status_summary = delivery_status_summary(cleaned_deliveries)

    print("Cleaned delivery data")
    print(cleaned_deliveries)

    print("\nDelivery status summary")
    print(status_summary)

    print("\nAverage distance:", round(cleaned_deliveries["distance_km"].mean(), 2), "km")


if __name__ == "__main__":
    main()
