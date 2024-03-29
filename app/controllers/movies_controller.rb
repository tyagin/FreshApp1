class MoviesController < ActionController::Base
 def index
    @movies= Movie.all
 end
 def show
  id = params[:id]
 @movie = Movie.find(id)
 end
def new
  @movie = Movie.new
end
def create
    //#debugger
    
    @movie = Movie.create!(movie_params)
    flash[:notice] = "Movie \"#{@movie.title}\" was successfully created."
    #instead of create a create view, we'd like to go to the movie list page after created a movie
    redirect_to movies_path
end
def edit
  @movie = Movie.find (params[:id])
end
def update
  @movie = Movie.find (params[:id])
  @movie.update_attributes!(movie_params)
  flash[:notice] = "#{@movie.title} was successfully updated."
  redirect_to movies_path(@movie)
end
def destroy
  @movie = Movie.find(params[:id])
  @movie.destroy
  flash[:notice] = "Movie '#{@movie.title}' deleted."
  redirect_to movies_path
end
private
  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end
end


























































    
