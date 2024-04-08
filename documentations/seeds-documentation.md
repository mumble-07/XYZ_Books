# Seed Files Documentation

## Overview

This documentation outlines the seed files and associated services used to populate the database with initial data for publishers, authors, books, and their relationships.

## seeds.rb

The `seeds.rb` file orchestrates the seeding process by invoking various service classes to create publishers, authors, books, and their associations.

## create_publishers.rb

This service creates publishers in the database.

## create_books.rb

This service creates books associated with specific publishers.

## create_authors.rb

This service creates authors in the database.

## create_book_authors.rb

This service associates authors with books.

## Error Handling

The seed files handle errors gracefully using `ActiveRecord::RecordInvalid`.

## Usage

To seed the database, run `rails db:seed`.

## Notes

- The seed files utilize a service-oriented approach for better code organization and maintainability.
- Each service class encapsulates specific functionality, promoting separation of concerns.
- The seed data includes publishers, authors, books, and their associations, providing a comprehensive initial dataset for the application.

---

(c) mumble-dev
