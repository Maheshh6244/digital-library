-- Create database
CREATE DATABASE IF NOT EXISTS digital_library;
USE digital_library;

-- Users table
CREATE TABLE users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Books table
CREATE TABLE books (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(100) NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    genre VARCHAR(50) NOT NULL,
    publication_year INT,
    total_copies INT DEFAULT 1,
    available_copies INT DEFAULT 1,
    description TEXT,
    cover_image_url VARCHAR(500),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Borrowing records table
CREATE TABLE borrowing_records (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    book_id BIGINT NOT NULL,
    borrow_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE NULL,
    status ENUM('BORROWED', 'RETURNED', 'OVERDUE') DEFAULT 'BORROWED',
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (book_id) REFERENCES books(id)
);

-- User reading history (for recommendations)
CREATE TABLE reading_history (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    book_id BIGINT NOT NULL,
    read_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (book_id) REFERENCES books(id)
);

-- Insert sample data
INSERT INTO users (name, email, password) VALUES 
('John Doe', 'john@example.com', '$2a$10$exampleHashedPassword'),
('Jane Smith', 'jane@example.com', '$2a$10$exampleHashedPassword2');

INSERT INTO books (title, author, isbn, genre, publication_year, total_copies, available_copies, description, cover_image_url) VALUES 
('The Silent Patient', 'Alex Michaelides', '978-1250301697', 'Thriller', 2019, 5, 5, 'A psychological thriller about a woman who shoots her husband and then stops speaking.', 'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80'),
('Where the Crawdads Sing', 'Delia Owens', '978-0735219090', 'Fiction', 2018, 3, 3, 'A novel about an abandoned girl who raises herself in the marshes of North Carolina.', 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80'),
('Educated', 'Tara Westover', '978-0399590504', 'Memoir', 2018, 4, 4, 'A memoir about a woman who grows up in a survivalist family and eventually goes to college.', 'https://images.unsplash.com/photo-1551029506-0807df4e2031?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80'),
('Sapiens', 'Yuval Noah Harari', '978-0062316097', 'Non-Fiction', 2014, 6, 6, 'A brief history of humankind.', 'https://images.unsplash.com/photo-1463320726281-696a485928c7?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80');
