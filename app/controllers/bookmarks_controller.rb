class BookmarksController < ApplicationController

  # def index
  #   @bookmarks = Bookmark.all
  # end

  # def show
  # end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id]) # Needed because movie_id is the reference in this table
    @bookmark.list = @list # Setting the movie ID using new @movie instance
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render 'lists/show', status: :unprocessable_entity
    end



  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    @list = List.find(params[:list_id]) # Needed because movie_id is the reference in this table
    redirect_to list_path(@list), status: :see_other # Not sure what see_other part is
  end

  private

  def set_bookmark
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
