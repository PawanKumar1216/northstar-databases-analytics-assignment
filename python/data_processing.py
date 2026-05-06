import pandas as pd


def read_delivery_data(path):
    data = pd.read_csv(path)
    return data


def clean_delivery_data(data):
    cleaned = data.copy()

    cleaned = cleaned.drop_duplicates()
    cleaned["distance_km"] = pd.to_numeric(cleaned["distance_km"], errors="coerce")
    cleaned = cleaned.dropna()

    cleaned["delivery_status"] = cleaned["delivery_status"].str.strip()
    cleaned["start_location"] = cleaned["start_location"].str.strip()
    cleaned["end_location"] = cleaned["end_location"].str.strip()

    return cleaned


def delivery_status_summary(data):
    summary = (
        data.groupby("delivery_status")
        .size()
        .reset_index(name="total_deliveries")
        .sort_values("total_deliveries", ascending=False)
    )

    return summary


def vehicle_usage_summary(data):
    summary = (
        data.groupby("vehicle_id")
        .agg(
            total_deliveries=("trip_id", "count"),
            total_distance_km=("distance_km", "sum"),
            average_distance_km=("distance_km", "mean")
        )
        .reset_index()
        .sort_values("total_deliveries", ascending=False)
    )

    summary["total_distance_km"] = summary["total_distance_km"].round(2)
    summary["average_distance_km"] = summary["average_distance_km"].round(2)

    return summary


def driver_summary(data):
    summary = (
        data.groupby("driver_id")
        .agg(
            total_trips=("trip_id", "count"),
            total_distance_km=("distance_km", "sum"),
            average_distance_km=("distance_km", "mean")
        )
        .reset_index()
        .sort_values("total_trips", ascending=False)
    )

    summary["total_distance_km"] = summary["total_distance_km"].round(2)
    summary["average_distance_km"] = summary["average_distance_km"].round(2)

    return summary


def longest_delivery(data):
    longest = data.loc[data["distance_km"].idxmax()]
    return longest


def save_outputs(cleaned_data, status_summary, vehicle_summary, driver_summary):
    cleaned_data.to_csv("data/cleaned_delivery_data.csv", index=False)
    status_summary.to_csv("data/delivery_status_summary.csv", index=False)
    vehicle_summary.to_csv("data/vehicle_usage_summary.csv", index=False)
    driver_summary.to_csv("data/driver_summary.csv", index=False)


def main():
    file_path = "data/sample_data.csv"

    deliveries = read_delivery_data(file_path)
    cleaned_deliveries = clean_delivery_data(deliveries)

    status_summary = delivery_status_summary(cleaned_deliveries)
    vehicle_summary = vehicle_usage_summary(cleaned_deliveries)
    driver_report = driver_summary(cleaned_deliveries)
    longest_route = longest_delivery(cleaned_deliveries)

    print("Cleaned delivery data")
    print(cleaned_deliveries)

    print("\nDelivery status summary")
    print(status_summary)

    print("\nVehicle usage summary")
    print(vehicle_summary)

    print("\nDriver summary")
    print(driver_report)

    print("\nLongest delivery")
    print(longest_route)

    print("\nAverage distance:", round(cleaned_deliveries["distance_km"].mean(), 2), "km")
    print("Total distance:", round(cleaned_deliveries["distance_km"].sum(), 2), "km")
    print("Total deliveries:", len(cleaned_deliveries))

    save_outputs(cleaned_deliveries, status_summary, vehicle_summary, driver_report)

    print("\nOutput CSV files saved in the data folder")


if __name__ == "__main__":
    main()
