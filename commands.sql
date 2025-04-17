psql --username=freecodecamp --dbname=periodic_table

ALTER TABLE properties RENAME COLUMN weight TO atomic_mass;
ALTER TABLE properties RENAME COLUMN melting_point TO melting_point_celsius;
ALTER TABLE properties RENAME COLUMN boiling_point TO boiling_point_celsius;
ALTER TABLE properties ALTER COLUMN melting_point_celsius SET NOT NULL;
ALTER TABLE properties ALTER COLUMN boiling_point_celsius SET NOT NULL;
ALTER TABLE elements ADD CONSTRAINT unique_name UNIQUE (name);
ALTER TABLE elements ADD CONSTRAINT unique_symbol UNIQUE (symbol);
ALTER TABLE elements ALTER COLUMN name SET NOT NULL;
ALTER TABLE elements ALTER COLUMN symbol SET NOT NULL;
ALTER TABLE properties ADD CONSTRAINT fk_properties_elements FOREIGN KEY (atomic_number) REFERENCES elements (atomic_number);
CREATE TABLE types();
ALTER TABLE types ADD COLUMN type_id SERIAL PRIMARY KEY;
ALTER TABLE types ADD COLUMN type VARCHAR(255) NOT NULL;
INSERT INTO types (type) VALUES ('metal'), ('metalloid'), ('nonmetal');
-- BE CAREFUL AT THIS POINT - CHECK THAT TYPE_ID EXISTS IF IT DOES NOT TAKE PRECAUTIONS
-- ALTER TABLE properties ADD CONSTRAINT fk_type_id FOREIGN KEY (type_id) REFERENCES types (type_id);
ALTER TABLE properties RENAME COLUMN type TO type_id;
ALTER table properties ADD COLUMN temp_type INT NULL;
UPDATE properties SET temp_type = 1 WHERE type_id = 'metal';
UPDATE properties SET temp_type = 2 WHERE type_id = 'nonmetal';
UPDATE properties SET temp_type = 3 WHERE type_id = 'metalloid';
ALTER TABLE properties DROP COLUMN type_id;
ALTER TABLE properties RENAME COLUMN temp_type TO type_id;
SELECT * FROM properties;
ALTER TABLE properties ALTER COLUMN type_id SET NOT NULL;
ALTER TABLE properties ADD CONSTRAINT fk_properties_types FOREIGN KEY (type_id) REFERENCES types (type_id);
-- Careful at this point too
UPDATE elements SET symbol = INITCAP(symbol);
ALTER TABLE properties ALTER COLUMN atomic_mass TYPE DECIMAL(10, 5);
UPDATE properties SET atomic_mass = ROUND(atomic_mass, 5);
SELECT * FROM properties;
INSERT INTO elements (symbol, name, atomic_number) VALUES ('F', 'Fluorine', 9);
INSERT INTO properties (atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES (9, 18.998, -220, -188.1, 2);
INSERT INTO elements (symbol, name, atomic_number) VALUES ('Ne', 'Neon', 10);
INSERT INTO properties (atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES (10, 20.18, -248.6, -246.1, 2);
DELETE FROM properties WHERE atomic_number = 1000;
DELETE FROM elements WHERE atomic_number = 1000;

