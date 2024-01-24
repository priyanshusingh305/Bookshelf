class Author < ApplicationRecord
  # Association: Establishes a one-to-many relationship with the Book model.
  has_many :books
end
