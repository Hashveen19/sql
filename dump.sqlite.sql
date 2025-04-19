-- TABLE
CREATE TABLE Booking (
    booking_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INT,
    show_id INT,
    booking_datetime DATETIME NOT NULL,
    total_cost DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (show_id) REFERENCES Show(show_id)
);
CREATE TABLE demo (ID integer primary key, Name varchar(20), Hint text );
CREATE TABLE FoodItem (
    item_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    is_combo TINYINT NOT NULL DEFAULT 0
);
CREATE TABLE FoodItemSize (
    size_id INTEGER PRIMARY KEY AUTOINCREMENT,
    item_id INT,
    size_name VARCHAR(50) NOT NULL,
    rate DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (item_id) REFERENCES FoodItem(item_id)
);
CREATE TABLE FoodOrder (
    order_id INTEGER PRIMARY KEY AUTOINCREMENT,
    booking_id INT,
    screen_id INT,
    seat_id INT,
    order_datetime DATETIME NOT NULL,
    total_cost DECIMAL(10,2) NOT NULL,
    delivery_method VARCHAR(50) NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id),
    FOREIGN KEY (screen_id) REFERENCES Screen(screen_id),
    FOREIGN KEY (seat_id) REFERENCES Seat(seat_id)
);
CREATE TABLE FoodOrderItem (
    order_item_id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id INT,
    item_id INT,
    size_id INT,
    quantity INT NOT NULL,
    price_at_time DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES FoodOrder(order_id),
    FOREIGN KEY (item_id) REFERENCES FoodItem(item_id),
    FOREIGN KEY (size_id) REFERENCES FoodItemSize(size_id)
);
CREATE TABLE Membership (
    membership_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INT,
    current_points INT NOT NULL DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);
CREATE TABLE Movie (
    movie_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(255) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    rating DECIMAL(3,1) NOT NULL,
    status VARCHAR(20) NOT NULL,
    poster_image_url VARCHAR(255)
);
CREATE TABLE MovieCast (
    cast_id INTEGER PRIMARY KEY AUTOINCREMENT,
    movie_id INT,
    person_name VARCHAR(100) NOT NULL,
    role VARCHAR(100) NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);
CREATE TABLE Payment (
    payment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    booking_id INT,
    gateway_id INT,
    transaction_amount DECIMAL(10,2) NOT NULL,
    transaction_datetime DATETIME NOT NULL,
    status VARCHAR(20) NOT NULL,
    failure_reason TEXT,
    credit_card_name VARCHAR(100),
    credit_card_number VARCHAR(20),
    expiry_date DATE,
    cvv VARCHAR(4),
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id),
    FOREIGN KEY (gateway_id) REFERENCES PaymentGateway(gateway_id)
);
CREATE TABLE PaymentGateway (
    gateway_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100) NOT NULL
);
CREATE TABLE PointsTransaction (
    transaction_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INT,
    amount DECIMAL(10,2) NOT NULL,
    points_earned INT NOT NULL,
    transaction_datetime DATETIME NOT NULL,
    transaction_type VARCHAR(20) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);
CREATE TABLE Review (
    review_id INTEGER PRIMARY KEY AUTOINCREMENT,
    movie_id INT,
    content TEXT NOT NULL,
    review_date DATETIME NOT NULL,
    reviewer_name VARCHAR(100) NOT NULL,
    rating INTEGER,
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);
CREATE TABLE Screen (
    screen_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50) NOT NULL,
    class_type VARCHAR(10) NOT NULL,
    capacity INT NOT NULL
);
CREATE TABLE Seat (
    seat_id INTEGER PRIMARY KEY AUTOINCREMENT,
    screen_id INT,
    seat_number VARCHAR(10) NOT NULL,
    FOREIGN KEY (screen_id) REFERENCES Screen(screen_id)
);
CREATE TABLE Show (
    show_id INTEGER PRIMARY KEY AUTOINCREMENT,
    screen_id INT,
    movie_id INT,
    show_datetime DATETIME NOT NULL,
    FOREIGN KEY (screen_id) REFERENCES Screen(screen_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);
CREATE TABLE ShowSeat (
    show_seat_id INTEGER PRIMARY KEY AUTOINCREMENT,
    show_id INT,
    seat_id INT,
    is_available TINYINT NOT NULL DEFAULT 1,
    FOREIGN KEY (show_id) REFERENCES Show(show_id),
    FOREIGN KEY (seat_id) REFERENCES Seat(seat_id)
);
CREATE TABLE Ticket (
    ticket_id INTEGER PRIMARY KEY AUTOINCREMENT,
    booking_id INT,
    show_seat_id INT,
    qr_code VARCHAR(100) NOT NULL,
    delivery_method VARCHAR(50) NOT NULL,
    is_downloaded TINYINT NOT NULL DEFAULT 0,
    scanned_at DATETIME,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id),
    FOREIGN KEY (show_seat_id) REFERENCES ShowSeat(show_seat_id)
);
CREATE TABLE User (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    phone VARCHAR(15)
);
 
-- INDEX
 
-- TRIGGER
 
-- VIEW
 
