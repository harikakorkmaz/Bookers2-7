class BookCommentsController < ApplicationController
    
    def create
        @book = Book.find(params[:book_id])   
        book = Book.find(params[:book_id])
        @new_comment = BookComment.new
        comment = current_user.book_comments.new(book_comment_params)
        comment.book_id = book.id
        comment.save
    end
    
    def destroy
        @book = Book.find(params[:book_id])
        @new_comment = BookComment.new
        BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    end
    
    private
    def book_comment_params
        params.require(:book_comment).permit(:comment)
    end 
end