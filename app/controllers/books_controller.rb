class BooksController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user, only: :destroy
    # before_action :set_cancelled_at_to_now, only: :create

    
    def index
        if params[:category].blank?
         @books = Book.all
        else
          @category = Category.find_by(name: params[:category])  
          @category_id = Category.find_by(name: params[:category]).id
          @books = current_user.books.where(category_id: @category_id)
        end
    end
    def show

    end
    
    def create
        @book = current_user.books.build(book_params)
        @book.start!
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

    def finish
        @book = Book.find(params[:id])
        @book.update_attributes(status: 2)
        @book.update_attributes(finished_at: Time.now)
        flash[:success] = "Book finished!"
        redirect_to root_path
    end

    def cancel
        @book = Book.find(params[:id])
        @book.update_attributes(status: 3)
        @book.update_attributes(cancelled_at: Time.now)
        flash[:success] = "Book not finished :("
        redirect_to root_path
    end
    def info
        @book = Book.find(params[:id])
    end

    private
    def book_params
        params.require(:book).permit(:title, :author, :category_id, :status, :cover)        
    end

    def correct_user
        @book = current_user.books.find_by(id: params[:id])
    end
    # def set_cancelled_at_to_now 
    #     @book.params(:cancelled_at).Time.now         
    # end
end
