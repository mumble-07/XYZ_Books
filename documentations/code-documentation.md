## StaticPagesController

This is a Ruby on Rails controller named `StaticPagesController` responsible for handling requests related to static pages, book searches, and API interactions.

### Index Action (`index`)

- This action doesn't contain any logic. It typically renders the default view associated with the `index` action.

### Search Action (`search`)

- This action handles search requests for books based on ISBN (International Standard Book Number).
- It retrieves the search parameter from the request parameters.
- It checks if the provided ISBN is valid using a method `ISBN_Tools.is_valid?`.
- If the ISBN is valid, it searches for books in the database that match the provided ISBN (both ISBN-10 and ISBN-13).
- If books are found, it assigns them to `@results` and presumably renders a view to display them.
- If the ISBN is not valid, it renders an error page with status code 400.

### API Book Action (`api_book`)

- This action is designed to serve book information in JSON format for API consumption.
- It retrieves the ISBN parameter from the request parameters.
- It searches for books in the database that match the provided ISBN (both ISBN-10 and ISBN-13).
- If the ISBN is valid and is a valid ISBN-13, and if books are found, it constructs a JSON response containing book details such as ID, title, author, edition, price, ISBN-10, ISBN-13, and publisher.
- If the ISBN is not valid or if no books are found, it renders an error page with the appropriate status code (400 for invalid ISBN, 404 for not found).

### Private Methods

- `author_full_name`: Formats the author's full name from first name, middle name, and last name.
- `convert_isbn`: Converts an ISBN to either ISBN-10 or ISBN-13 format.
- `render_error_page`: Renders an error page with a given status code.
- `map_book_results`: Maps book objects to a hash containing specific book details.
- `hyphenate_isbn`: Hyphenates an ISBN, formatting it with hyphens for better readability.

The controller follows typical Rails conventions for actions, parameter handling, and rendering responses. It interacts with a model named `Book` to perform database queries for book information. Additionally, it utilizes `ISBN_Tools` library to validate and manipulate ISBNs.
