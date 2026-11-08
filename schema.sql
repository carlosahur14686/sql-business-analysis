DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS products;

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    product_code TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL,
    category TEXT NOT NULL,
    list_price REAL NOT NULL CHECK (list_price >= 0),
    status TEXT NOT NULL CHECK (status IN ('active', 'inactive'))
);

CREATE TABLE sales (
    sale_id INTEGER PRIMARY KEY,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    unit_price REAL NOT NULL CHECK (unit_price >= 0),
    sale_date TEXT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
