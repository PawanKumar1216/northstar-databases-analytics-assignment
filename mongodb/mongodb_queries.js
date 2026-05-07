// NorthStar Urban Mobility and Logistics
// MongoDB queries for document-based delivery data

db = db.getSiblingDB("northstar_logistics");


// 1. Remove existing records to avoid duplicate data during testing
db.deliveries.deleteMany({});


// 2. Insert sample delivery documents
db.deliveries.insertMany([
  {
    delivery_id: 1,
    customer: {
      name: "Aisha Khan",
      city: "London"
    },
    driver: {
      name: "Raj Singh",
      status: "Active"
    },
    vehicle: {
      registration_number: "NS01 VAN",
      type: "Van"
    },
    route: {
      start_location: "Warehouse A",
      end_location: "London Central",
      distance_km: 12.5
    },
    delivery_date: "2026-04-01",
    delivery_status: "Delivered",
    delivery_cost: 18.50
  },
  {
    delivery_id: 2,
    customer: {
      name: "James Wilson",
      city: "Manchester"
    },
    driver: {
      name: "Tom Evans",
      status: "Active"
    },
    vehicle: {
      registration_number: "NS02 VAN",
      type: "Van"
    },
    route: {
      start_location: "Warehouse B",
      end_location: "Manchester Central",
      distance_km: 15.0
    },
    delivery_date: "2026-04-01",
    delivery_status: "Delivered",
    delivery_cost: 22.00
  },
  {
    delivery_id: 3,
    customer: {
      name: "Priya Patel",
      city: "Birmingham"
    },
    driver: {
      name: "Nadia Ali",
      status: "Active"
    },
    vehicle: {
      registration_number: "NS05 EV",
      type: "Electric Van"
    },
    route: {
      start_location: "Warehouse B",
      end_location: "Birmingham North",
      distance_km: 22.7
    },
    delivery_date: "2026-04-02",
    delivery_status: "Delayed",
    delivery_cost: 31.75
  },
  {
    delivery_id: 4,
    customer: {
      name: "Daniel Brown",
      city: "Leeds"
    },
    driver: {
      name: "Raj Singh",
      status: "Active"
    },
    vehicle: {
      registration_number: "NS01 VAN",
      type: "Van"
    },
    route: {
      start_location: "Warehouse C",
      end_location: "Leeds City Centre",
      distance_km: 10.8
    },
    delivery_date: "2026-04-02",
    delivery_status: "Delivered",
    delivery_cost: 16.40
  },
  {
    delivery_id: 5,
    customer: {
      name: "Sofia Ahmed",
      city: "London"
    },
    driver: {
      name: "Fatima Begum",
      status: "Active"
    },
    vehicle: {
      registration_number: "NS05 EV",
      type: "Electric Van"
    },
    route: {
      start_location: "Warehouse A",
      end_location: "London East",
      distance_km: 18.2
    },
    delivery_date: "2026-04-03",
    delivery_status: "In Transit",
    delivery_cost: 24.90
  },
  {
    delivery_id: 6,
    customer: {
      name: "Michael Green",
      city: "Liverpool"
    },
    driver: {
      name: "Tom Evans",
      status: "Active"
    },
    vehicle: {
      registration_number: "NS04 TRUCK",
      type: "Truck"
    },
    route: {
      start_location: "Warehouse C",
      end_location: "Liverpool South",
      distance_km: 28.4
    },
    delivery_date: "2026-04-03",
    delivery_status: "Delivered",
    delivery_cost: 38.20
  }
]);


// 3. Show all delivery documents
db.deliveries.find();


// 4. Find all delivered orders
db.deliveries.find({
  delivery_status: "Delivered"
});


// 5. Find delayed deliveries
db.deliveries.find({
  delivery_status: "Delayed"
});


// 6. Find deliveries for London customers
db.deliveries.find({
  "customer.city": "London"
});


// 7. Sort deliveries by highest delivery cost
db.deliveries.find().sort({
  delivery_cost: -1
});


// 8. Count deliveries by delivery status
db.deliveries.aggregate([
  {
    $group: {
      _id: "$delivery_status",
      total_deliveries: {
        $sum: 1
      }
    }
  },
  {
    $sort: {
      total_deliveries: -1
    }
  }
]);


// 9. Calculate average delivery cost by city
db.deliveries.aggregate([
  {
    $group: {
      _id: "$customer.city",
      average_delivery_cost: {
        $avg: "$delivery_cost"
      },
      total_deliveries: {
        $sum: 1
      }
    }
  },
  {
    $sort: {
      average_delivery_cost: -1
    }
  }
]);


// 10. Calculate total delivery cost by vehicle type
db.deliveries.aggregate([
  {
    $group: {
      _id: "$vehicle.type",
      total_delivery_cost: {
        $sum: "$delivery_cost"
      },
      total_deliveries: {
        $sum: 1
      }
    }
  },
  {
    $sort: {
      total_delivery_cost: -1
    }
  }
]);


// 11. Create indexes for query optimisation
db.deliveries.createIndex({
  delivery_status: 1
});

db.deliveries.createIndex({
  delivery_date: 1
});

db.deliveries.createIndex({
  "customer.city": 1
});

db.deliveries.createIndex({
  "driver.name": 1
});


// 12. Check query performance using explain
db.deliveries.find({
  delivery_status: "Delivered"
}).explain("executionStats");