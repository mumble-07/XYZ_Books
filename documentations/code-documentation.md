# StaticPagesController Documentation

## Overview

The `StaticPagesController` is a controller in a Ruby on Rails (RoR) application responsible for handling static pages and certain ISBN-related functionalities.

## Methods

### `index`

- **Description**: Renders the index page.
- **URL**: `/`
- **HTTP Method**: GET

### `convert_isbn`

- **Description**: Converts ISBN-10 to ISBN-13 or vice versa and returns the hyphenated version of the converted ISBN.
- **URL**: `/convert/:isbn`
- **HTTP Method**: POST
- **Parameters**:
  - `isbn` (String): ISBN to be converted.
- **Returns**: Hyphenated version of the converted ISBN.
- **Error Handling**:
  - Returns 400 Bad Request if the provided ISBN is invalid.

### `search`

- **Description**: Searches for books by ISBN and returns the matching results.
- **URL**: `/search`
- **HTTP Method**: GET
- **Parameters**:
  - `search` (String): ISBN to search for.
- **Returns**: JSON object containing information about the matched books.
- **Error Handling**:
  - Returns 404 Not Found if no matching books are found.
  - Returns 400 Bad Request if the provided ISBN is invalid.

### `api_book`

- **Description**: Returns book information in JSON format based on the provided ISBN.
- **URL**: `/books/:isbn`
- **HTTP Method**: GET
- **Parameters**:
  - `isbn` (String): ISBN of the book to retrieve information for.
- **Returns**: JSON object containing information about the book.
- **Error Handling**:
  - Returns 404 Not Found if no book is found for the provided ISBN.
  - Returns 400 Bad Request if the provided ISBN is invalid.

## Private Methods

### `author_full_name`

- **Description**: Formats author's full name.
- **Parameters**:
  - `author` (Author): Author object containing first name, middle name, and last name.
- **Returns**: Formatted full name of the author.

### `render_error_page`

- **Description**: Renders an error page based on the provided status code.
- **Parameters**:
  - `status` (Integer): HTTP status code.

---

(c) mumble-dev
