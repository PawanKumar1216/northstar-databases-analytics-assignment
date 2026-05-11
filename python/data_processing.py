"""
NorthStar Urban Mobility and Logistics
Python data processing and analysis script

This script loads the main operational datasets, performs basic cleaning,
creates a delivery duration field, and produces concise logistics summaries.
"""

import pandas as pd


def load_data():
    """Load the main operational datasets from the data folder."""
    deliveries = pd.read_csv("data/deliveries.csv")
    drivers = pd.read_csv("data/drivers.csv")
    vehicles = pd.read_csv("data/vehicles.csv")
    hubs = pd.read_csv("data/hubs.csv")

    return deliveries, drivers, vehicles, hubs


def clean_data(deliveries, drivers, vehicles, hubs):
    """Clean and prepare datasets for analysis."""
    deliveries = deliveries.drop_duplicates().copy()
    drivers = drivers.drop_duplicates().copy()
    vehicles = vehicles.drop_duplicates().copy()
    hubs = hubs.drop_duplicates().copy()

    deliveries["dispatch_time"] = pd.to_datetime(
        deliveries["dispatch_time"], errors="coerce"
    )
    deliveries["delivery_completed_at"] = pd.to_datetime(
        deliveries["delivery_completed_at"], errors="coerce"
    )

    numeric_delivery_columns = [
        "route_distance_km",
        "manual_route_override_count",
        "proof_of_completion_missing",
        "customer_rating_post_delivery",
        "fuel_or_charge_cost",
    ]

    for column in numeric_delivery_columns:
        deliveries[column] = pd.to_numeric(deliveries[column], errors="coerce")

    # Standardise inconsistent text formatting where relevant
    drivers["base_zone"] = drivers["base_zone"].str.strip().str.title()
    vehicles["assigned_zone"] = vehicles["assigned_zone"].str.strip().str.title()

    # Create a useful derived measure for completed delivery duration
    deliveries["delivery_duration_minutes"] = (
        deliveries["delivery_completed_at"] - deliveries["dispatch_time"]
    ).dt.total_seconds() / 60

    return deliveries, drivers, vehicles, hubs


def analyse_data(deliveries):
    """Produce concise operational analytics from the delivery dataset."""
    total_deliveries = len(deliveries)
    deliveries_by_status = deliveries["delivery_status"].value_counts()
    average_distance = deliveries["route_distance_km"].mean()
    average_cost = deliveries["fuel_or_charge_cost"].mean()
    average_rating_by_status = deliveries.groupby("delivery_status")[
        "customer_rating_post_delivery"
    ].mean()

    hub_summary = deliveries.groupby("hub_id").agg(
        total_deliveries=("delivery_id", "count"),
        delayed_deliveries=(
            "delivery_status",
            lambda x: (x == "Delayed").sum(),
        ),
        failed_deliveries=(
            "delivery_status",
            lambda x: (x == "Failed").sum(),
        ),
    ).sort_values("delayed_deliveries", ascending=False)

    high_override_deliveries = deliveries[
        deliveries["manual_route_override_count"] >= 3
    ][
        [
            "delivery_id",
            "hub_id",
            "delivery_status",
            "manual_route_override_count",
            "customer_rating_post_delivery",
        ]
    ].sort_values("manual_route_override_count", ascending=False)

    print("NorthStar Delivery Operations Analysis")
    print("--------------------------------------")
    print(f"Total deliveries: {total_deliveries}")
    print(f"Average route distance: {average_distance:.2f} km")
    print(f"Average fuel or charge cost: £{average_cost:.2f}")

    print("\nDeliveries by status:")
    print(deliveries_by_status)

    print("\nAverage customer rating by delivery status:")
    print(average_rating_by_status.round(2))

    print("\nHub performance summary:")
    print(hub_summary)

    print("\nTop deliveries with high manual route override counts:")
    print(high_override_deliveries.head())


def main():
    deliveries, drivers, vehicles, hubs = load_data()
    deliveries, drivers, vehicles, hubs = clean_data(
        deliveries, drivers, vehicles, hubs
    )
    analyse_data(deliveries)


if __name__ == "__main__":
    main()
