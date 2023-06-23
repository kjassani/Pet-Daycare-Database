USE Pet_Daycare_lab4;
CREATE TABLE Owner (
  id INT PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  address VARCHAR(255)
);

CREATE TABLE Pet (
  pet_name VARCHAR(255),
  owner_id INT,
  age INT,
  description VARCHAR(255),
  FOREIGN KEY (owner_id) REFERENCES Owner(id),
  PRIMARY KEY (pet_name, owner_id)
);

CREATE TABLE Cat (
  pet_name VARCHAR(255),
  owner_id INT,
  has_claws BOOLEAN,
  is_social BOOLEAN,
  FOREIGN KEY (pet_name, owner_id) REFERENCES Pet(pet_name, owner_id),
  PRIMARY KEY (pet_name, owner_id)
);

CREATE TABLE Dog (
  pet_name VARCHAR(255),
  owner_id INT,
  size VARCHAR(20),
  is_barker BOOLEAN,
  FOREIGN KEY (pet_name, owner_id) REFERENCES Pet(pet_name, owner_id),
  PRIMARY KEY (pet_name, owner_id)
);

CREATE TABLE Building (
  id INT PRIMARY KEY,
  building_name VARCHAR(255),
  year_built YEAR
);

CREATE TABLE Room (
  room_number INT,
  building_id INT,
  size DECIMAL(10, 2),
  FOREIGN KEY (building_id) REFERENCES Building(id),
  PRIMARY KEY (number, building_id)
);

CREATE TABLE Stay (
  pet_name VARCHAR(255),
  owner_id INT,
  room_number INT,
  building_id INT,
  start_date DATE,
  end_date DATE,
  cost DECIMAL(10, 2),
  FOREIGN KEY (pet_name, owner_id) REFERENCES Pet(pet_name, owner_id),
  FOREIGN KEY (room_number, building_id) REFERENCES Room(room_number, building_id),
  PRIMARY KEY (pet_name, owner_id, start_date)
);
