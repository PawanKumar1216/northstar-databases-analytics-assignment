use northstar_logistics;

db.deliveries.drop();

db.deliveries.insertMany([
  {
    trip_id: 1,
    vehicle_id: "V001",
    driver_id: "D001",
    start_location: "North Hub",
    end_location: "Central Depot",
    distance_km: 12.5,
    delivery_status: "Completed"
  },
  {
    trip_id: 2,
    vehicle_id: "V002",
    driver_id: "D002",
    start_location: "East Hub",
    end_location: "West Depot",
    distance_km: 18.2,
    delivery_status: "Completed"
  },
  {
    trip_id: 3,
    vehicle_id: "V003",
    driver_id: "D003",
    start_location: "South Hub",
    end_location: "North Depot",
    distance_km: 25.7,
    delivery_status: "Delayed"
  },
  {
    trip_id: 4,
    vehicle_id: "V004",
    driver_id: "D004",
    start_location: "Central Hub",
    end_location: "East Depot",
    distance_km: 9.8,
    delivery_status: "Completed"
  },
  {
    trip_id: 5,
    vehicle_id: "V005",
    driver_id: "D005",
    start_location: "West Hub",
    end_location: "South Depot",
    distance_km: 14.3,
    delivery_status: "Cancelled"
  },
  {
    trip_id: 6,
    vehicle_id: "V002",
    driver_id: "D002",
    start_location: "East Hub",
    end_location: "Central Depot",
    distance_km: 21.6,
    delivery_status: "Completed"
  },
  {
    trip_id: 7,
    vehicle_id: "V003",
    driver_id: "D003",
    start_location: "South Hub",
    end_location: "West Depot",
    distance_km: 19.4,
    delivery_status: "Delayed"
  },
  {
    trip_id: 8,
    vehicle_id: "V001",
    driver_id: "D001",
    start_location: "North Hub",
    end_location: "East Depot",
    distance_km: 11.7,
    delivery_status: "Completed"
  },
  {
    trip_id: 9,
    vehicle_id: "V005",
    driver_id: "D005",
    start_location: "West Hub",
    end_location: "Central Depot",
    distance_km: 16.9,
    delivery_status: "Completed"
  },
  {
    trip_id: 10,
    vehicle_id: "V004",
    driver_id: "D004",
    start_location: "Central Hub",
    end_location: "North Depot",
    distance_km: 23.1,
    delivery_status: "Delayed"
  }
]);

db.deliveries.find();

db.deliveries.find({
  delivery_status: "Completed"
});

db.deliveries.find({
  distance_km: { $gt: 15 }
});

db.deliveries.aggregate([
  {
    $group: {
      _id: "$delivery_status",
      total_deliveries: { $sum: 1 },
      average_distance: { $avg: "$distance_km" }
    }
  },
  {
    $sort: {
      total_deliveries: -1
    }
  }
]);

db.deliveries.find().sort({
  distance_km: -1
});

db.deliveries.createIndex({
  delivery_status: 1
});
