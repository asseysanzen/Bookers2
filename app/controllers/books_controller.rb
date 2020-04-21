class BooksController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :index, :show, :edit, :update, :destroy]
	before_action :correct_user, only: [:edit, :update]

	def home
	end
	def about
	end
	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			redirect_to book_path(@book.id), flash:{create: "You have created book successfully."}
		else
			@books = Book.all
			render :index
		end
	end
	def index
		@books = Book.all
		@book = Book.new

	end
	def show
		@book = Book.find(params[:id])
		@newbook = Book.new
	end
	def edit
		@book = Book.find(params[:id])
	end
	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
    	   redirect_to book_path(@book.id), flash:{update: "You have updated book successfully."}
  		else
      		render :edit
      	end
  	end
	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	def correct_user
		@book = Book.find(params[:id])
  		if @book.user.id !=  current_user.id
		redirect_to books_path
		end
    end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
