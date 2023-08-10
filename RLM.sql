--Creating Basic demo RML table
CREATE TABLE RLM (
    ship_to_location varchar(60) not null, --normalized
    ship_from_location varchar(60) not null, --normalized
    customer_item_number varchar(20) not null, --normilized
    schedule_type varchar(20) not null, --normilized
    action_item varchar(20) not null, --normilized
    start_date date not null, --normilized
    action_date date not null, --normilized
    qty integer noy null, --normilized
    uom varchar(20) not null, --normilized
    action_qty varchar(20) not null, --normilized
    production_seq_number varchar(20) not null, --normilized
    model_serial_number varchar(20) not null,  --normilized
    job_number varchar(20) not null, --normilized
    cust_po_number varchar(20) not null, --normilized
    intmtd_ship_to varchar(20) not null, --normilized
    detail_type varchar(20) not null, --normilized
    actions varchar(20) not null, --normilized
    exception_type varchar(100) not null, --normilized
    exception_message varchar(100) not null --normilized
);

--INSERT SOME VALUES
INSERT INTO RLM (ship_to_location, ship_from_location, customer_item_number, schedule_type, action_item, start_date, action_date, qty, uom, action_qty, production_seq_number, model_serial_number, job_number, cust_po_number, intmtd_ship_to, detail_type, actions, exception_type, exception_message)
VALUES
    ('Miami', 'Dallas', '20920708', 'Standard', 'Ship', '2023-08-14', '2023-08-13', 60, 'pcs', 'ShipQty', 'ProdSeq5', 'MS345', 'Job678', 'PO901', 'Intermediate', 'DetailD', 'Action4', 'ExceptionTypeD', 'Shipping delay'),
    ('Seattle', 'Denver', '7421065784', 'Express', 'Pack', '2023-08-15', '2023-08-14', 25, 'boxes', 'PackQty', 'ProdSeq6', 'MS678', 'Job901', 'PO234', 'Intermediate', 'DetailE', 'Action5', 'ExceptionTypeE', 'Packaging error'),
    ('Boston', 'Atlanta', '20920600', 'Standard', 'Receive', '2023-08-16', '2023-08-15', 40, 'units', 'RecvQty', 'ProdSeq7', 'MS901', 'Job234', 'PO567', 'Intermediate', 'DetailF', 'Action6', 'ExceptionTypeF', 'Received incomplete'),
    ('Chicago', 'San Francisco', '20920728', 'Standard', 'Ship', '2023-08-17', '2023-08-16', 90, 'pcs', 'ShipQty', 'ProdSeq8', 'MS234', 'Job567', 'PO890', 'Intermediate', 'DetailG', 'Action7', 'ExceptionTypeG', 'Shipping error'),
    ('Los Angeles', 'New York', '7420920724', 'Express', 'Pack', '2023-08-18', '2023-08-17', 55, 'boxes', 'PackQty', 'ProdSeq9', 'MS567', 'Job890', 'PO123', 'Intermediate', 'DetailH', 'Action8', 'ExceptionTypeH', 'Packaging delay'),
    ('San Francisco', 'Chicago', '21178115', 'Standard', 'Ship', '2023-08-19', '2023-08-18', 70, 'pcs', 'ShipQty', 'ProdSeq10', 'MS890', 'Job123', 'PO456', 'Intermediate', 'DetailI', 'Action9', 'ExceptionTypeI', 'Shipping issue'),
    ('New York', 'Los Angeles', '20920728', 'Standard', 'Receive', '2023-08-20', '2023-08-19', 35, 'units', 'RecvQty', 'ProdSeq11', 'MS123', 'Job456', 'PO789', 'Intermediate', 'DetailA', 'Action1', 'ExceptionTypeA', 'Received damaged'),
    ('Miami', 'Dallas', '20920619', 'Express', 'Pack', '2023-08-21', '2023-08-20', 80, 'boxes', 'PackQty', 'ProdSeq12', 'MS456', 'Job789', 'PO012', 'Intermediate', 'DetailB', 'Action2', 'ExceptionTypeB', 'Packaging error'),
    ('Chicago', 'San Francisco', '20920729', 'Standard', 'Ship', '2023-08-22', '2023-08-21', 50, 'pcs', 'ShipQty', 'ProdSeq13', 'MS789', 'Job012', 'PO345', 'Intermediate', 'DetailC', 'Action3', 'ExceptionTypeC', 'Shipping delay'),
    ('Los Angeles', 'New York', '7420920722', 'Standard', 'Receive', '2023-08-23', '2023-08-22', 65, 'units', 'RecvQty', 'ProdSeq14', 'MS012', 'Job345', 'PO678', 'Intermediate', 'DetailD', 'Action4', 'ExceptionTypeD', 'Received incomplete')
    -- ... add more rows as needed
    ;

--------------------
--DATA Normalization
--------------------

-- -- Table for Ship Locations
-- CREATE TABLE RLM_ShipLocations (
--     ship_location_id INT PRIMARY KEY,
--     ship_location_name VARCHAR(60) NOT NULL
-- );

-- -- Table for Customer Items
-- CREATE TABLE RLM_CustomerItems (
--     customer_item_id INT PRIMARY KEY,
--     customer_item_number VARCHAR(20) NOT NULL,
--     production_seq_number VARCHAR(20) NOT NULL,
--     model_serial_number VARCHAR(20) NOT NULL
-- );

-- -- Table for Schedule Types
-- CREATE TABLE RLM_ScheduleTypes (
--     schedule_type_id INT PRIMARY KEY,
--     schedule_type VARCHAR(20) NOT NULL
-- );

-- -- Table for Action Items
-- CREATE TABLE RLM_ActionItems (
--     action_item_id INT PRIMARY KEY,
--     action_item VARCHAR(20) NOT NULL
-- );

-- -- Table for Units of Measure
-- CREATE TABLE RLM_UnitsOfMeasure (
--     uom_id INT PRIMARY KEY,
--     uom VARCHAR(20) NOT NULL
-- );

-- -- Table for Exception 
-- CREATE TABLE RLM_Exception_Messages (
--     exception_message_id INT PRIMARY KEY,
--     exception_type varchar(100) NOT NULL,
--     exception_message varchar(100) NOT NULL
-- );
-- -- Main RLM Table
-- CREATE TABLE RLM (
--     entry_id INT PRIMARY KEY,
--     ship_to_location_id INT REFERENCES RLM_ShipLocations(ship_location_id) ON DELETE CASCADE,
--     ship_from_location_id INT REFERENCES RLM_ShipLocations(ship_location_id) ON DELETE CASCADE,
--     customer_item_id INT REFERENCES RLM_CustomerItems(customer_item_id) ON DELETE CASCADE,
--     schedule_type_id INT REFERENCES RLM_ScheduleTypes(schedule_type_id) ON DELETE CASCADE,
--     action_item_id INT REFERENCES RLM_ActionItems(action_item_id) ON DELETE CASCADE,
--     start_date DATE NOT NULL,
--     action_date DATE NOT NULL,
--     qty INT NOT NULL,
--     uom_id INT REFERENCES RLM_UnitsOfMeasure(uom_id) ON DELETE CASCADE,
--     action_qty VARCHAR(20) NOT NULL,
--     job_number VARCHAR(20) NOT NULL,
--     cust_po_number_id INT REFERENCES RLM_CustomerItems(customer_item_id) ON DELETE CASCADE,
--     intmtd_ship_to_id INT REFERENCES RLM_ShipLocations(ship_location_id) ON DELETE CASCADE,
--     detail_type_id INT REFERENCES RLM_CustomerItems(customer_item_id) ON DELETE CASCADE,
--     actions VARCHAR(20) NOT NULL,
--     exception_id INT REFERENCES RLM_Exception_Messages(exception_message_id) ON DELETE CASCADE
-- );
