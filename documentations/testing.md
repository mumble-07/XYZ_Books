# RSpec Testing Documentation

## Introduction

This document serves as documentation for the RSpec tests written for the models, request specs, and factories in the Rails application. RSpec is a testing tool for Ruby that is widely used in the Rails community to ensure the correctness and reliability of code.

## RSpec Setup

RSpec is a Ruby gem that needs to be included in the `Gemfile` of the Rails application. The gem can be installed by running `bundle install`. Additionally, RSpec requires configuration to work effectively. Configuration files such as `.rspec` and `spec/spec_helper.rb` may need to be set up based on project requirements.

## Factories

### `authors.rb`

- **Purpose**: Defines a factory for creating author records.
- **Attributes**:
  - `first_name`: Defaulted to "Joel".
  - `middle_name`: Defaulted to an empty string.
  - `last_name`: Defaulted to "Hartse".
- **Associations**:
  - Generates a transient attribute to associate authors with books.
  - After creating an author, associates it with books.

### `books_publishers.rb`

- **Purpose**: Defines factories for creating book and publisher records.
- **`publisher` Factory**:
  - Creates a publisher with the name "Paste Magazine".
- **`book` Factory**:
  - Defines attributes such as title, ISBN, list price, publication year, edition, and image URL.
  - Associates the book with a publisher.

## Test Files

### `author_spec.rb`

- **Purpose**: Contains RSpec tests for the `Author` model.
- **Tests**:
  - `must have a first name`: Verifies that an author must have a first name.
  - `can have a middle name`: Verifies that an author can optionally have a middle name.
  - `must have a last name`: Verifies that an author must have a last name.
  - `must have associated books`: Verifies that an author has associated books.

### `book_spec.rb`

- **Purpose**: Contains RSpec tests for the `Book` model.
- **Tests**:
  - `must have a book title`: Verifies that a book must have a title.
  - `can have an ISBN-10 or ISBN-13`: Verifies that a book can have either an ISBN-10 or an ISBN-13.
  - `must have a Price`: Verifies that a book must have a price.
  - `must have a publisher`: Verifies that a book must have a publisher.

### `publisher_spec.rb`

- **Purpose**: Contains RSpec tests for the `Publisher` model.
- **Tests**:
  - `must have associated books`: Verifies that a publisher has associated books.

### `static_pages_controller_spec.rb`

- **Purpose**: Contains RSpec tests for the static pages controller's request specs.
- **Tests**:
  - `GET /index`: Verifies that the root path returns HTTP success.
  - `GET /convert_isbn`: Tests various ISBN conversion scenarios.
  - `GET /search`: Tests search functionality.
  - `GET /api_book`: Tests API book retrieval.

## Running Tests

RSpec tests can be executed by running the `rspec` command in the terminal from the root directory of the Rails application. Individual test files can be run by specifying the file path.

Example:

```
rspec
```

OR

```
rspec spec/models/author_spec.rb
```

