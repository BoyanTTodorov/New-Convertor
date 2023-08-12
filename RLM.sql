
CREATE TABLE "1OM" (
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

INSERT INTO  "1OM"(ship_to_location, ship_from_location, customer_item_number, schedule_type, action_item, start_date, action_date, qty, uom, action_qty, production_seq_number, model_serial_number, job_number, cust_po_number, intmtd_ship_to, detail_type, actions, exception_type, exception_message)
VALUES
    ('New York', 'Los Angeles', '20920708', 'Express', 'Receive', '2023-08-24', '2023-08-23', 45, 'units', 'RecvQty', 'ProdSeq15', 'MS890', 'Job234', 'PO567', 'Primary', 'DetailE', 'Action5', 'ExceptionTypeE', 'Received damaged'),
    ('Dallas', 'Miami', '7421065784', 'Standard', 'Pack', '2023-08-25', '2023-08-24', 30, 'boxes', 'PackQty', 'ProdSeq16', 'MS567', 'Job345', 'PO890', 'Primary', 'DetailF', 'Action6', 'ExceptionTypeF', 'Packaging delay'),
    ('San Francisco', 'Chicago', '20920600', 'Express', 'Ship', '2023-08-26', '2023-08-25', 50, 'pcs', 'ShipQty', 'ProdSeq17', 'MS234', 'Job567', 'PO123', 'Primary', 'DetailG', 'Action7', 'ExceptionTypeG', 'Shipping error'),
    ('Denver', 'Seattle', '20920728', 'Standard', 'Receive', '2023-08-27', '2023-08-26', 95, 'units', 'RecvQty', 'ProdSeq18', 'MS123', 'Job890', 'PO456', 'Primary', 'DetailH', 'Action8', 'ExceptionTypeH', 'Received incomplete'),
    ('Atlanta', 'Boston', '7420920724', 'Express', 'Pack', '2023-08-28', '2023-08-27', 60, 'boxes', 'PackQty', 'ProdSeq19', 'MS456', 'Job123', 'PO789', 'Primary', 'DetailA', 'Action1', 'ExceptionTypeA', 'Packaging error'),
    ('New York', 'Los Angeles', '21178115', 'Standard', 'Ship', '2023-08-29', '2023-08-28', 75, 'pcs', 'ShipQty', 'ProdSeq20', 'MS789', 'Job456', 'PO012', 'Primary', 'DetailB', 'Action2', 'ExceptionTypeB', 'Shipping delay'),
    ('Chicago', 'San Francisco', '20920728', 'Express', 'Receive', '2023-08-30', '2023-08-29', 40, 'units', 'RecvQty', 'ProdSeq21', 'MS012', 'Job789', 'PO345', 'Primary', 'DetailC', 'Action3', 'ExceptionTypeC', 'Received damaged'),
    ('San Francisco', 'Chicago', '20920619', 'Standard', 'Pack', '2023-08-31', '2023-08-30', 85, 'boxes', 'PackQty', 'ProdSeq22', 'MS345', 'Job012', 'PO678', 'Primary', 'DetailD', 'Action4', 'ExceptionTypeD', 'Packaging error'),
    ('Los Angeles', 'New York', '20920729', 'Express', 'Ship', '2023-09-01', '2023-08-31', 55, 'pcs', 'ShipQty', 'ProdSeq23', 'MS678', 'Job234', 'PO901', 'Primary', 'DetailI', 'Action9', 'ExceptionTypeI', 'Shipping issue'),
    ('Seattle', 'Denver', '7420920722', 'Standard', 'Receive', '2023-09-02', '2023-09-01', 70, 'units', 'RecvQty', 'ProdSeq24', 'MS901', 'Job567', 'PO012', 'Primary', 'DetailJ', 'Action0', 'ExceptionTypeJ', 'Received incomplete')
    -- ... add more rows as needed
    ;


--Creating Basic demo RML table
CREATE TABLE IF NOT EXISTS "RLM" (
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
INSERT INTO "RLM" (ship_to_location, ship_from_location, customer_item_number, schedule_type, action_item, start_date, action_date, qty, uom, action_qty, production_seq_number, model_serial_number, job_number, cust_po_number, intmtd_ship_to, detail_type, actions, exception_type, exception_message)
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


CREATE TABLE IF NOT EXISTS "Plant" (
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


INSERT INTO "Plant" (ship_to_location, ship_from_location, customer_item_number, schedule_type, action_item, start_date, action_date, qty, uom, action_qty, production_seq_number, model_serial_number, job_number, cust_po_number, intmtd_ship_to, detail_type, actions, exception_type, exception_message)
VALUES
    ('Chicago', 'Miami', '20920708', 'Standard', 'Pack', '2023-08-24', '2023-08-23', 50, 'boxes', 'PackQty', 'ProdSeq25', 'MS111', 'Job111', 'PO111', 'Secondary', 'DetailA', 'Action1', 'ExceptionTypeA', 'Packaging error'),
    ('Los Angeles', 'Boston', '7421065784', 'Express', 'Ship', '2023-08-25', '2023-08-24', 60, 'pcs', 'ShipQty', 'ProdSeq26', 'MS222', 'Job222', 'PO222', 'Secondary', 'DetailB', 'Action2', 'ExceptionTypeB', 'Shipping delay'),
    ('Seattle', 'New York', '20920600', 'Standard', 'Receive', '2023-08-26', '2023-08-25', 35, 'units', 'RecvQty', 'ProdSeq27', 'MS333', 'Job333', 'PO333', 'Secondary', 'DetailC', 'Action3', 'ExceptionTypeC', 'Received damaged'),
    ('San Francisco', 'Atlanta', '20920728', 'Express', 'Pack', '2023-08-27', '2023-08-26', 70, 'boxes', 'PackQty', 'ProdSeq28', 'MS444', 'Job444', 'PO444', 'Secondary', 'DetailD', 'Action4', 'ExceptionTypeD', 'Packaging error'),
    ('Dallas', 'Chicago', '7420920724', 'Standard', 'Ship', '2023-08-28', '2023-08-27', 75, 'pcs', 'ShipQty', 'ProdSeq29', 'MS555', 'Job555', 'PO555', 'Secondary', 'DetailE', 'Action5', 'ExceptionTypeE', 'Shipping issue'),
    ('Denver', 'San Francisco', '21178115', 'Express', 'Receive', '2023-08-29', '2023-08-28', 40, 'units', 'RecvQty', 'ProdSeq30', 'MS666', 'Job666', 'PO666', 'Secondary', 'DetailF', 'Action6', 'ExceptionTypeF', 'Received incomplete'),
    ('Boston', 'Los Angeles', '20920728', 'Standard', 'Pack', '2023-08-30', '2023-08-29', 55, 'boxes', 'PackQty', 'ProdSeq31', 'MS777', 'Job777', 'PO777', 'Secondary', 'DetailG', 'Action7', 'ExceptionTypeG', 'Packaging delay'),
    ('Miami', 'New York', '20920619', 'Express', 'Ship', '2023-08-31', '2023-08-30', 80, 'pcs', 'ShipQty', 'ProdSeq32', 'MS888', 'Job888', 'PO888', 'Secondary', 'DetailH', 'Action8', 'ExceptionTypeH', 'Shipping error'),
    ('Chicago', 'Dallas', '20920729', 'Standard', 'Receive', '2023-09-01', '2023-08-31', 45, 'units', 'RecvQty', 'ProdSeq33', 'MS999', 'Job999', 'PO999', 'Secondary', 'DetailI', 'Action9', 'ExceptionTypeI', 'Received damaged'),
    ('Los Angeles', 'Seattle', '7420920722', 'Express', 'Pack', '2023-09-02', '2023-09-01', 90, 'boxes', 'PackQty', 'ProdSeq34', 'MS000', 'Job000', 'PO000', 'Secondary', 'DetailJ', 'Action0', 'ExceptionTypeJ', 'Packaging error')
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
