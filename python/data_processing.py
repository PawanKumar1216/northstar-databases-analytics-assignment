import pandas as pd


def load_data():
    """
    Load sample delivery operations data from the CSV file.
    """
    deliveries = pd.read_csv("data/sample_data.csv")
    return deliveries


def clean_data(deliveries):
    """
    Clean the delivery dataset by handling missing values,
    checking data types, and preparing the data for analysis.
    """
    deliveries = deliveries.drop_duplicates()

    deliveries["delivery_date"] = pd.to_datetime(deliveries["delivery_date"])

    deliveries["delivery_cost"] = pd.to_numeric(
        deliveries["delivery_cost"],
        errors="coerce"
    )

    deliveries["delivery_time_minutes"] = pd.to_numeric(
        deliveries["delivery_time_minutes"],
        errors="coerce"
    )

    deliveries = deliveries.dropna()

    return deliveries


def analyse_data(deliveries):
    """
    Produce basic operational analytics from the cleaned dataset.
    """
    total_deliveries = len(deliveries)

    average_delivery_time = deliveries["delivery_time_minutes"].mean()
    average_delivery_cost = deliveries["delivery_cost"].mean()

    deliveries_by_status = deliveries["delivery_status"].value_counts()
    deliveries_by_zone = deliveries["delivery_zone"].value_counts()

    print("NorthStar Delivery Operations Analysis")
    print("--------------------------------------")
    print(f"Total deliveries: {total_deliveries}")
    print(f"Average delivery time: {average_delivery_time:.2f} minutes")
    print(f"Average delivery cost: £{average_delivery_cost:.2f}")

    print("\nDeliveries by status:")
    print(deliveries_by_status)

    print("\nDeliveries by zone:")
    print(deliveries_by_zone)


def main():
    deliveries = load_data()
    cleaned_deliveries = clean_data(deliveries)
    analyse_data(cleaned_deliveries)


if __name__ == "__main__":
    main()