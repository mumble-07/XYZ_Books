require "test_helper"

class AuthorTest < ActiveSupport::TestCase
  test "this test should not save because there is no author first name" do
    author = Author.new
    # author.first_name = "Joel"
    author.last_name = "Hartse"

    assert_not author.save, "Saved the author without the author first name"
  end

  test "this test should not save because there is no author last name" do
    author = Author.new
    author.first_name = "Joel"
    # author.last_name = "Hartse"

    assert_not author.save, "Saved the author without the author last name"
  end

end
