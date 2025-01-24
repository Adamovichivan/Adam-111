-- Active: 1735986021010@@127.0.0.1@5432@planing@public
CREATE DATABASE planing

---- Створення таблиці "Operations"
CREATE TABLE Operations (
    Operation_ID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Start_Date DATE NOT NULL,
    End_Date DATE
);

-- Створення таблиці "Goals"
CREATE TABLE Goals (
    Goal_ID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    Priority INT NOT NULL
);

-- Створення таблиці "Resources"
CREATE TABLE Resources (
    Resource_ID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Type VARCHAR(100),
    Quantity INT NOT NULL
);

-- Проміжна таблиця "Operation_Goal" для зв'язку між операціями та цілями (багато до багатьох)
CREATE TABLE Operation_Goal (
    Operation_ID INT,
    Goal_ID INT,
    FOREIGN KEY (Operation_ID) REFERENCES Operations(Operation_ID) ON DELETE CASCADE,
    FOREIGN KEY (Goal_ID) REFERENCES Goals(Goal_ID) ON DELETE CASCADE,
    PRIMARY KEY (Operation_ID, Goal_ID)
);

-- Проміжна таблиця "Operation_Resource" для зв'язку між операціями та ресурсами (багато до багатьох)
CREATE TABLE Operation_Resource (
    Operation_ID INT,
    Resource_ID INT,
    Used_Quantity INT NOT NULL,
    FOREIGN KEY (Operation_ID) REFERENCES Operations(Operation_ID) ON DELETE CASCADE,
    FOREIGN KEY (Resource_ID) REFERENCES Resources(Resource_ID) ON DELETE CASCADE,
    PRIMARY KEY (Operation_ID, Resource_ID)
);

-- Вставка даних в таблицю "Operations"
INSERT INTO Operations (Name, Start_Date, End_Date) VALUES
('Operation Sunrise', '2025-02-01', '2025-02-10'),
('Operation Shield', '2025-03-05', '2025-03-20'),
('Operation Thunder', '2025-04-15', '2025-04-25'),
('Operation Storm', '2025-05-10', '2025-05-18'),
('Operation Eagle', '2025-06-01', '2025-06-12');

-- Вставка даних в таблицю "Goals"
INSERT INTO Goals (Name, Description, Priority) VALUES
('Secure the border', 'Ensure the security of the northern border', 1),
('Destroy enemy artillery', 'Neutralize all enemy artillery positions', 2),
('Protect civilian areas', 'Safeguard key civilian infrastructure', 1),
('Capture enemy HQ', 'Take control of the enemy headquarters', 3),
('Supply reinforcements', 'Ensure timely reinforcements to front lines', 2);

-- Вставка даних в таблицю "Resources"
INSERT INTO Resources (resource_id, Name, Type, Quantity) VALUES
(1, 'Tanks', 'Heavy equipment', 50),
(2,'Ammunition', 'Supplies', 10000),
(3, 'Fuel', 'Supplies', 5000),
(4,'Medical Kits', 'Medical', 200),
(5,'Helicopters', 'Air support', 10);

-- Вставка даних в таблицю "Operation_Goal"
INSERT INTO Operation_Goal (Operation_ID, Goal_ID) VALUES
(1, 1),
(1, 3),
(2, 2),
(3, 4),
(4, 5);

-- Вставка даних в таблицю "Operation_Resource"
INSERT INTO Operation_Resource (Operation_ID, Resource_ID, Used_Quantity) VALUES
(1, 1, 20),
(1, 2, 5000),
(2, 3, 2000),
(3, 4, 100),
(4, 5, 5);

SELECT * from resources;
