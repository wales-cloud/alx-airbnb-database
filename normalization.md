# Normalization Steps

## First Normal Form (1NF)
- Ensured all attributes have atomic values.
- Removed repeating groups from the `Booking` and `Property` tables.

## Second Normal Form (2NF)
- Moved dependent attributes to separate tables.
  - For example, removed user details from `Booking`, keeping only `user_id`.

## Third Normal Form (3NF)
- Removed transitive dependencies.
  - For example, removed derived fields like `total_price` from `Booking`.
- Ensured that each attribute depends only on the primary key of its table.

## Conclusion
All tables have been verified to meet 3NF. Data is well-structured and avoids redundancy, ensuring consistency and scalability.
