CREATE SCHEMA IF NOT EXISTS salon_db;
USE salon_db;

DROP TABLE IF EXISTS salon;
CREATE TABLE IF NOT EXISTS salon (
  salon_id VARCHAR(10) NOT NULL,
  name TEXT,
  address TEXT,
  location TEXT,
  contact_number VARCHAR(20),
  open_days TEXT,
  open_hour_start TIME,
  open_hour_end TIME,
  rush_hour_start TIME,
  rush_hour_end TIME,
  PRIMARY KEY (salon_id)
);

DROP TABLE IF EXISTS accessibility;
CREATE TABLE IF NOT EXISTS accessibility (
  accessibility_id VARCHAR(10) NOT NULL,
  salon_id VARCHAR(10),
  wheelchair_access TINYINT(1),
  PRIMARY KEY (accessibility_id),
  FOREIGN KEY (salon_id) REFERENCES salon (salon_id)
);

DROP TABLE IF EXISTS appointmentmethods;
CREATE TABLE IF NOT EXISTS appointmentmethods (
  method_id VARCHAR(10) NOT NULL,
  salon_id VARCHAR(10),
  method_name TEXT,
  PRIMARY KEY (method_id),
  FOREIGN KEY (salon_id) REFERENCES salon (salon_id)
);

DROP TABLE IF EXISTS appointments;
CREATE TABLE IF NOT EXISTS appointments (
  appointment_id VARCHAR(10) NOT NULL,
  salon_id VARCHAR(10),
  appointment_reminders TINYINT(1),
  service_access_type TEXT,
  PRIMARY KEY (appointment_id),
  FOREIGN KEY (salon_id) REFERENCES salon (salon_id)
);

DROP TABLE IF EXISTS commonservices;
CREATE TABLE IF NOT EXISTS commonservices (
  service_id VARCHAR(10) NOT NULL,
  salon_id VARCHAR(10),
  service_name TEXT,
  PRIMARY KEY (service_id),
  FOREIGN KEY (salon_id) REFERENCES salon (salon_id)
);

DROP TABLE IF EXISTS complimentaryitems;
CREATE TABLE IF NOT EXISTS complimentaryitems (
  item_id VARCHAR(10) NOT NULL,
  salon_id VARCHAR(10),
  item_name TEXT,
  PRIMARY KEY (item_id),
  FOREIGN KEY (salon_id) REFERENCES salon (salon_id)
);

DROP TABLE IF EXISTS facilities;
CREATE TABLE IF NOT EXISTS facilities (
  facility_id VARCHAR(10) NOT NULL,
  salon_id VARCHAR(10),
  wifi_available TINYINT(1),
  air_conditioned TINYINT(1),
  tv_available TINYINT(1),
  charging_ports TINYINT(1),
  PRIMARY KEY (facility_id),
  FOREIGN KEY (salon_id) REFERENCES salon (salon_id)
);

DROP TABLE IF EXISTS mirror;
CREATE TABLE IF NOT EXISTS mirror (
  mirror_id VARCHAR(10) NOT NULL,
  salon_id VARCHAR(10),
  mirror_type TEXT,
  mirror_shape TEXT,
  mirror_size TEXT,
  PRIMARY KEY (mirror_id),
  FOREIGN KEY (salon_id) REFERENCES salon (salon_id)
);

DROP TABLE IF EXISTS offers;
CREATE TABLE IF NOT EXISTS offers (
  offer_id VARCHAR(10) NOT NULL,
  salon_id VARCHAR(10),
  discount_policy TINYINT(1),
  ongoing_offers TINYINT(1),
  PRIMARY KEY (offer_id),
  FOREIGN KEY (salon_id) REFERENCES salon (salon_id)
);

DROP TABLE IF EXISTS parkingtype;
CREATE TABLE IF NOT EXISTS parkingtype (
  parking_type_id VARCHAR(10) NOT NULL,
  type_name TEXT,
  is_covered TINYINT(1),
  PRIMARY KEY (parking_type_id)
);

DROP TABLE IF EXISTS parkingarea;
CREATE TABLE IF NOT EXISTS parkingarea (
  parking_area_id VARCHAR(10) NOT NULL,
  salon_id VARCHAR(10),
  parking_capacity INT,
  parking_type_id VARCHAR(10),
  PRIMARY KEY (parking_area_id),
  FOREIGN KEY (salon_id) REFERENCES salon (salon_id),
  FOREIGN KEY (parking_type_id) REFERENCES parkingtype (parking_type_id)
);

DROP TABLE IF EXISTS paymentmethods;
CREATE TABLE IF NOT EXISTS paymentmethods (
  payment_id VARCHAR(10) NOT NULL,
  salon_id VARCHAR(10),
  method TEXT,
  PRIMARY KEY (payment_id),
  FOREIGN KEY (salon_id) REFERENCES salon (salon_id)
);

DROP TABLE IF EXISTS pricing;
CREATE TABLE IF NOT EXISTS pricing (
  pricing_id VARCHAR(10) NOT NULL,
  salon_id VARCHAR(10),
  min_price INT,
  max_price INT,
  price_range TEXT,
  PRIMARY KEY (pricing_id),
  FOREIGN KEY (salon_id) REFERENCES salon (salon_id)
);

DROP TABLE IF EXISTS rushdays;
CREATE TABLE IF NOT EXISTS rushdays (
  rush_day_id VARCHAR(10) NOT NULL,
  salon_id VARCHAR(10),
  day_name TEXT,
  PRIMARY KEY (rush_day_id),
  FOREIGN KEY (salon_id) REFERENCES salon (salon_id)
);

DROP TABLE IF EXISTS salonequipments;
CREATE TABLE IF NOT EXISTS salonequipments (
  equipment_id VARCHAR(10) NOT NULL,
  salon_id VARCHAR(10),
  equipment_name TEXT,
  equipment_count INT,
  PRIMARY KEY (equipment_id),
  FOREIGN KEY (salon_id) REFERENCES salon (salon_id)
);

DROP TABLE IF EXISTS seats;
CREATE TABLE IF NOT EXISTS seats (
  seat_id VARCHAR(10) NOT NULL,
  salon_id VARCHAR(10),
  seat_count INT,
  seat_brand TEXT,
  seat_color TEXT,
  seat_material TEXT,
  has_footrest TINYINT(1),
  has_headrest TINYINT(1),
  adjustable TINYINT(1),
  PRIMARY KEY (seat_id),
  FOREIGN KEY (salon_id) REFERENCES salon (salon_id)
);

DROP TABLE IF EXISTS tvsetup;
CREATE TABLE IF NOT EXISTS tvsetup (
  tv_id VARCHAR(10) NOT NULL,
  salon_id VARCHAR(10),
  brand TEXT,
  count INT,
  PRIMARY KEY (tv_id),
  FOREIGN KEY (salon_id) REFERENCES salon (salon_id)
);

DROP TABLE IF EXISTS waitingseats;
CREATE TABLE IF NOT EXISTS waitingseats (
  waiting_id VARCHAR(10) NOT NULL,
  salon_id VARCHAR(10),
  seat_count INT,
  seat_type TEXT,
  PRIMARY KEY (waiting_id),
  FOREIGN KEY (salon_id) REFERENCES salon (salon_id)
);

DROP TABLE IF EXISTS washroom;
CREATE TABLE IF NOT EXISTS washroom (
  washroom_id VARCHAR(10) NOT NULL,
  salon_id VARCHAR(10),
  gender_type TEXT,
  trash_bins TINYINT(1),
  air_freshener TINYINT(1),
  hand_dryer TINYINT(1),
  PRIMARY KEY (washroom_id),
  FOREIGN KEY (salon_id) REFERENCES salon (salon_id)
);
