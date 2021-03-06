class BookmarksController < ApplicationController
  def new
    # this is for the collection
    @movies = Movie.all
    @lists = List.all
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    #need list id
    @list = List.find(params[:list_id])
    #associating the @list with the @bookmark
    @bookmark.list = @list

    ## attempt at select2
    # multiple movies
    @selected_movie = bookmark_params[:movie_id]
    # iterate the movies
    @selected_movie.each do |movie|
        bookmark = Bookmark.new
        bookmark.list = @list
        bookmark.movie = Movie.find(movie)
        bookmark.comment = bookmark_params[:comment]
        bookmark.save
    end
    redirect_to list_path(@list)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :list_id, movie_id: [])
  end
end
