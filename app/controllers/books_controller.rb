class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
  if @book.save
    flash[:success] = 'successfully' 
    redirect_to book_path(@book.id)
  else
    @books = Book.all
    render :index
  end
  end
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
  if @book.save
    flash[:notice] = 'successfully'
    redirect_to book_path
  else
    render :edit
  end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end
end