class BookmarksController < ApplicationController

  before_action :set_bookmark, only: [:show]

  def index
    @bookmarks = Bookmark.all
  end

  def show
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @movie = Movie.find(params[:movie_id]) # Needed because movie_id is the reference in this table
    @bookmark.movie_id = @movie.id # Setting the movie ID using new @movie instance
    @list = List.find(params[:list_id]) # as above
    @bookmark.list_id = @list.id # as above
    @bookmark.save
    redirect_to bookmarks_path(@bookmark)
  end

  def destroy
    @bookmark.destroy
    redirect_to bookmarks_path, status: :see_other # Not sure what see_other part is 
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
