class BooksController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user, only: :destroy

    
    def index
        if params[:category].blank?
         @books = Book.all
        else
          @category = Category.find_by(name: params[:category])  
          @category_id = Category.find_by(name: params[:category]).id
          @books = current_user.books.where(category_id: @category_id)    
        end
    end
    
    def create
        @book = current_user.books.build(book_params) 
        if @book.save
            flash[:success] = "Book added!"
            redirect_to root_url
        else
            @feed_items = []
           render 'static_pages/home' 
        end
    end

    def edit
         @book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
        if @book.update_attributes(book_params)
            flash[:success] = "Book updated!"
            redirect_to root_url
        else
            render 'edit'
        end
        
    end

    def destroy
        @book.destroy
        flash[:success] = "Book deleted"
        redirect_to request.referrer || root_url
    end

    private
    def book_params
        params.require(:book).permit(:title, :author, :category_id)        
    end

    def correct_user
        @book = current_user.books.find_by(id: params[:id])
        
    end

end
