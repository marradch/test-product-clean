CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TYPE product_status AS ENUM ('available', 'out_of_stock', 'archived');

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    category_id INT REFERENCES categories(id) ON DELETE SET NULL,
    status product_status NOT NULL DEFAULT 'available'
);

CREATE TABLE attributes (
    id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(id) ON DELETE CASCADE,
    key VARCHAR(100) NOT NULL,
    value VARCHAR(255) NOT NULL
);

INSERT INTO categories (name) VALUES
    ('electronics'),
    ('clothing'),
    ('home_appliances')
ON CONFLICT (name) DO NOTHING;