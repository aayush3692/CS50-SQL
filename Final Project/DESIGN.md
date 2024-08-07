# Design Document

By YOUR NAME HERE
Name: Aayush Singh
Github username: aayush3692
edx username: aayushsingh1239

Video overview: <https://youtu.be/NwN1u-tJLTs>

## Scope
The purpose of this database is to manage and track the inventory, brands, suppliers, and transactions of products within a retail environment. This includes categories of products, various brands, individual products, and their suppliers.
# Included in Scope
Categories: Different product categories like Electronics, Home Appliances, Furniture, etc.
Brands: Various brands associated with each category.
Products: Individual products linked to brands.
Suppliers: Companies supplying products.
Transactions: Records of sales and restocks.
Stores: Linking brands and products to specific stores.
# Outside the Scope
Detailed user management and authentication.
Complex customer relationship management (CRM) functionalities.
Real-time stock management across multiple branches or regions.
Integration with external systems or third-party APIs.
## Functional Requirements

# User Capabilities
Add, update, and delete categories, brands, and products.
Record transactions (sales and restocks) for products.
Track which suppliers provide specific products.
View summary information about products, including stock levels and transaction history.
Search and filter products by category, brand, and supplier.
# Beyond Scope
Automated restocking and supply chain management.
Detailed customer purchase history and analytics.
Advanced reporting and business intelligence features.

## Representation

### Entities

Categories
Attributes:
`id`: INT UNSIGNED, AUTO_INCREMENT, PRIMARY KEY
`category_name`: VARCHAR(64), NOT NULL
Brands
Attributes:
`id`: INT UNSIGNED, AUTO_INCREMENT, PRIMARY KEY
`category_id`: INT UNSIGNED, NOT NULL, FOREIGN KEY
`brand_name`: VARCHAR(64), NOT NULL
`deleted`: TINYINT, DEFAULT 0
Products
Attributes:
`id`: INT UNSIGNED, AUTO_INCREMENT, PRIMARY KEY
`brand_id`: INT UNSIGNED, NOT NULL, FOREIGN KEY
`product_name`: VARCHAR(64), NOT NULL
Suppliers
Attributes:
`id`: INT UNSIGNED, AUTO_INCREMENT, PRIMARY KEY
`supplier_name`: VARCHAR(64), NOT NULL
Products Supplied
Attributes:
`product_id`: INT UNSIGNED, PRIMARY KEY, FOREIGN KEY
`supplier_id`: INT UNSIGNED, PRIMARY KEY, FOREIGN KEY
Transactions
Attributes:
`id`: INT UNSIGNED, AUTO_INCREMENT, PRIMARY KEY
`product_id`: INT UNSIGNED, NOT NULL, FOREIGN KEY`
`quantity`: INT, NOT NULL
`transaction_type`: ENUM('sale', 'restock'), NOT NULL
`date`: DATETIME, NOT NULL, DEFAULT CURRENT_TIMESTAMP
`deleted`: TINYINT, DEFAULT 0
Stores
Attributes:
`id`: INT UNSIGNED, AUTO_INCREMENT, PRIMARY KEY
`brand_id`: INT UNSIGNED, NOT NULL, FOREIGN KEY
`product_id`: INT UNSIGNED, NOT NULL, FOREIGN KEY
### Relationships
Categories have a one-to-many relationship with Brands.
Brands have a one-to-many relationship with Products.
Products have a many-to-many relationship with Suppliers via Products Supplied.
Products have a one-to-many relationship with Transactions.
Stores link Brands and Products.

Categories (1) ---> (M) Brands (1) ---> (M) Products (M) <--- (M) Suppliers
                                       |
                                      (M)
                                       |
                                Transactions
                                       |
                                      (M)
                                       |
                                    Stores

## Optimizations

Indexes: Primary keys are indexed by default. Foreign keys are used for referential integrity and faster joins.
Views: products_info view created to simplify common queries involving brands, products, and transactions.
Stored Procedures: sell procedure to handle the selling process, ensuring the product is marked as deleted and a corresponding transaction is recorded.

## Limitations
Design Limitations:

The database is designed for single-branch inventory management and may not scale efficiently for multi-branch scenarios without significant modifications.
Real-time stock management and supply chain integration are not covered.
Basic user permissions and authentication mechanisms are not implemented.
Representation Limitations:

Complex relationships like product variants and bundles are not represented.
Supplier contracts, delivery schedules, and detailed transaction analytics are not included.
Advanced reporting and data analytics capabilities are limited to basic views and queries.

