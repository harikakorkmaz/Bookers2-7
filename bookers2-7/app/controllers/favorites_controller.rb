class FavoritesController < ApplicationController
    
    def create
      @book = Book.find(params[:book_id])
      if !Favorite.find_by(book_id: @book.id, user_id: current_user.id)
        @favorite = current_user.favorites.new(book_id: @book.id)
        @favorite.save
      end
    end

    def destroy
      @book = Book.find(params[:book_id])
      if Favorite.find_by(book_id: @book.id, user_id: current_user.id)
        @favorite = current_user.favorites.find_by(book_id: @book.id)
        @favorite.destroy
      end
      # binding.pry
    end

end
