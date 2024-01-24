class Book < ApplicationRecord
  # Validation: Ensures that the title is present and has a minimum length of 3 characters.
  validates :title, presence: true, length: { minimum: 3 }

  # Association: Establishes a many-to-one relationship with the Author model.
  belongs_to :author
end
