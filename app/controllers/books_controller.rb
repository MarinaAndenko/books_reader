class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @books = Book.where("draft = false").where("created_at >= ?", 1.week.ago.utc)
  end

  def drafts
    @books = Book.where("draft = true AND user_id = #{current_user.id}")
    render 'index'
  end 

  def user_books
    @books = Book.where("user_id = #{current_user.id}")
    render 'index'
  end 

  def show
    @book_genres = @book.genres
  end

  def new
    @user = current_user
    @book = @user.books.new
    @genres = Genre.all
  end

  def create
    @user = current_user
    @book = @user.books.new(book_params)
    @genres = Genre.all
    if @book.save
      @genres.each do |genre|
        if params['genres-yes']!=nil 
          if params['genres-yes'].include? genre.id.to_s
            b_genre = @book.book_genres.new(genre_id: genre.id)
            b_genre.save
          end
        end 
      end 
      redirect_to book_path(@book)
    else
      render "new"
    end
  end

  def edit
    @genres = Genre.all
  end

  def update
    @genres = Genre.all
    if params['remove_image']=='true'
      @book.remove_image!
    end
    if @book.update(book_params)
      @genres.each do |genre| 
        if params['genres-yes']!=nil 
          if params['genres-yes'].include? genre.id.to_s
            b_genre = @book.genres.where("genre_id = #{genre.id}")
            if b_genre == []
              b_genre = @book.book_genres.new(genre_id: genre.id)
              b_genre.save
            end
          else 
           b_genre = @book.book_genres.where("genre_id = #{genre.id}")
           b_genre.destroy_all 
          end
        else
          @book.book_genres.destroy_all 
        end 
      end 
      redirect_to book_path(@book)
    else
      render "edit"
    end
  end

  def destroy
    if @book.destroy
      redirect_to books_path
    end
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:name, :author, :image, :description, :draft)
    end
end
