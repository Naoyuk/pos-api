# Kinjo cafe POS API

Kinjo cafe POS API is a system including order receiving, ordering, registering recipes, management of stock, management of attendance, culculate salary.

## APIs

### Category
- `GET /api/v1/categories` returns all categories
- `GET /api/v1/categories/:id` returns the category you specify
- `POST /api/v1/categories` creates a category and returns the category
- `PUT /api/v1/categories/:id` updates a category and returns the category
- `DELETE /api/v1/categories/:id` deletes a category and returns the category

### Product
- `GET /api/v1/products` returns all products
- `GET /api/v1/products/:id` returns the product you specify
- `POST /api/v1/products` creates a product and returns the product
- `PUT /api/v1/products/:id` updates a product and returns the product
- `DELETE /api/v1/products/:id` deletes a product and returns the product
