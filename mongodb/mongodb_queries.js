// NorthStar Urban Mobility and Logistics
// MongoDB query examples

use("northstar_logistics");

// --------------------------------------------------
// 1. Count documents in the main collections
// --------------------------------------------------

db.deliveries.countDocuments({});
db.drivers.countDocuments({});
db.vehicles.countDocuments({});
db.hubs.countDocuments({});
db.customers.countDocuments({});

// --------------------------------------------------
// 2. Retrieve sample delayed deliveries
// --------------------------------------------------

db.deliveries.find(
  { delivery_status: "Delayed" },
  {
    _id: 0,
    delivery_id: 1,
    hub_id: 1,
    driver_id: 1,
    route_distance_km: 1
  }
).limit(5);

// --------------------------------------------------
// 3. Count deliveries by status
// --------------------------------------------------

db.deliveries.aggregate([
  {
    $group: {
      _id: "$delivery_status",
      total_deliveries: { $sum: 1 }
    }
  },
  {
    $sort: { total_deliveries: -1 }
  }
]);

// --------------------------------------------------
// 4. Find deliveries with missing proof of completion
// --------------------------------------------------

db.deliveries.find(
  { proof_of_completion_missing: 1 },
  {
    _id: 0,
    delivery_id: 1,
    delivery_status: 1,
    hub_id: 1,
    proof_of_completion_missing: 1
  }
).limit(5);

// --------------------------------------------------
// 5. Identify high manual route override cases
// --------------------------------------------------

db.deliveries.find(
  { manual_route_override_count: { $gte: 3 } },
  {
    _id: 0,
    delivery_id: 1,
    hub_id: 1,
    delivery_status: 1,
    manual_route_override_count: 1,
    customer_rating_post_delivery: 1
  }
).sort({ manual_route_override_count: -1 }).limit(5);

// --------------------------------------------------
// 6. Summarise hub performance
// --------------------------------------------------

db.deliveries.aggregate([
  {
    $group: {
      _id: "$hub_id",
      total_deliveries: { $sum: 1 },
      delayed_deliveries: {
        $sum: {
          $cond: [{ $eq: ["$delivery_status", "Delayed"] }, 1, 0]
        }
      },
      failed_deliveries: {
        $sum: {
          $cond: [{ $eq: ["$delivery_status", "Failed"] }, 1, 0]
        }
      },
      average_rating: { $avg: "$customer_rating_post_delivery" }
    }
  },
  {
    $sort: { delayed_deliveries: -1 }
  }
]);

// --------------------------------------------------
// 7. Compare performance by delivery status
// --------------------------------------------------

db.deliveries.aggregate([
  {
    $group: {
      _id: "$delivery_status",
      total_deliveries: { $sum: 1 },
      average_customer_rating: { $avg: "$customer_rating_post_delivery" },
      average_route_distance_km: { $avg: "$route_distance_km" },
      average_fuel_or_charge_cost: { $avg: "$fuel_or_charge_cost" }
    }
  },
  {
    $sort: { average_customer_rating: -1 }
  }
]);

// --------------------------------------------------
// 8. Enrich delivery records with driver and vehicle details
// --------------------------------------------------

db.deliveries.aggregate([
  {
    $lookup: {
      from: "drivers",
      localField: "driver_id",
      foreignField: "driver_id",
      as: "driver_details"
    }
  },
  {
    $lookup: {
      from: "vehicles",
      localField: "vehicle_id",
      foreignField: "vehicle_id",
      as: "vehicle_details"
    }
  },
  {
    $unwind: "$driver_details"
  },
  {
    $unwind: "$vehicle_details"
  },
  {
    $project: {
      _id: 0,
      delivery_id: 1,
      delivery_status: 1,
      driver_id: 1,
      driver_rating: "$driver_details.driver_rating",
      years_experience: "$driver_details.years_experience",
      vehicle_id: 1,
      vehicle_type: "$vehicle_details.vehicle_type",
      maintenance_status: "$vehicle_details.maintenance_status"
    }
  },
  {
    $limit: 5
  }
]);

// --------------------------------------------------
// 9. Create indexes for query optimisation
// --------------------------------------------------

db.deliveries.createIndex(
  { delivery_status: 1 },
  { name: "idx_delivery_status" }
);

db.deliveries.createIndex(
  {
    delivery_status: 1,
    manual_route_override_count: 1
  },
  { name: "idx_status_override_count" }
);

// --------------------------------------------------
// 10. Review indexes after optimisation
// --------------------------------------------------

db.deliveries.getIndexes();
