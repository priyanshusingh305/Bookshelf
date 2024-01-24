class BooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :authenticate_user!

  # Constant to define the maximum pagination limit for books.
  MAX_PAGINATION_LIMIT = 100

  # GET books
  # Retrieves a paginated list of books.
  def index
    books = Book.limit(limit).offset(params[:offset])
    render json: BooksRepresenter.new(books).as_json
  end

  # POST books
  # Creates a new book along with its associated author.
  def create
    author = Author.create!(author_params)
    book = Book.new(book_params.merge(author_id: author.id))
    if book.save
      render json: BookRepresenter.new(book).as_json, status: :created
    else
      render json: book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/:id
  # Deletes a book by its ID.
  def destroy
    Book.find(params[:id]).destroy!
    head :no_content
  end

  private

  # Determine the limit for pagination, ensuring it does not exceed the maximum limit.
  def limit
    [
      params.fetch(:limit, MAX_PAGINATION_LIMIT).to_i,
      MAX_PAGINATION_LIMIT
    ].min
  end

  # Strong parameters for author attributes.
  def author_params
    params.require(:author).permit(:first_name, :last_name, :age)
  end

  # Strong parameters for book attributes.
  def book_params
    params.require(:book).permit(:title)
  end
end
