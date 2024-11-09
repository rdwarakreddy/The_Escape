CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    is_email_verified BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

select * from users;


ALTER TABLE users
ADD COLUMN otp VARCHAR(6),
ADD COLUMN otp_expiry TIMESTAMP;

ALTER TABLE users
ADD COLUMN last_login_time TIMESTAMP DEFAULT NULL,
ADD COLUMN last_logout_time TIMESTAMP DEFAULT NULL,
ADD COLUMN user_status VARCHAR(10) ;


CREATE TABLE posts (
    post_id SERIAL PRIMARY KEY,
    user_email VARCHAR(255) NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    photo BYTEA, -- Store the image in binary format
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_email) REFERENCES users(email)
);
select * from posts;