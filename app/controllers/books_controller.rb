class BooksController < ApplicationController
 def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
   @book = Book.new
 end

 def edit
  @book = Book.find(params[:id])

 end

 def update
  book = Book.find(params[:id])
  if book.update(book_params)
   flash[:notice] = "Book was successfully updated."
  else
   flash[:notice] = "error"
  end
  redirect_to book_path(book.id)
 end

 def create
   @book = Book.new(book_params)
   if @book.save
    redirect_to book_path(@book.id)
    flash[:notice] = "Book was successfully updated."
   else
    @books = Book.all
    render :new
   end
 end

 def index
   @books = Book.all
   @book = Book.new
 end

 def show
    @book = Book.find(params[:id])
 end

 def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
 end

 private
 def book_params
   params.require(:book).permit(:title, :body)
 end


end