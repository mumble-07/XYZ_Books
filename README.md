# XYZ Books

XYZ Books is planning to develop an application that can get information from students, college
textbooks, and other course material. It has functionalities like displaying applicable product data (e.g.,
authors, publishers, etc) or converting an ISBN (i.e., International Standard Book Number) to and from
different formats.

![XYZ-Books Web Page](documentations/xyz-books-wepage.png)

### Tools

- ruby 3.1.3
- rails 7.0.4
- tailwind 2.3
- isbn-converter 0.1.0
- isbn-tools 0.1.0

### Code Documentation

- [Controller Actions](documentations/code-documentation.md) <br>
- [Seed Services](documentations/seeds-documentation.md)
- [Testing]

### After clone-do:

run

`bundle install` <br>
`./bin/rails tailwindcss:install` <br>
`rails db:create` <br>
`rails db:migrate` <br>
`rails db:seed` <br>

### To start the app:

run
`bin/dev`
