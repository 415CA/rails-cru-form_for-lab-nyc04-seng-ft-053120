class GenresController < ApplicationController
  before_action :find_genre, except: %i[index new create]

  def index
    @genres = Genre.all
  end

  def show; end

  def new
    @genre = Genre.new
  end

  def edit; end

  def create
    @genre = Genre.new(genre_params(:name))
    @genre.save
    redirect_to genre_path(@genre)
  end

  def update
    @genre.update(genre_params(:name))
    @genre.save
    redirect_to genre_path(@genre)
  end

  private

  def genre_params(*args)
    params.require(:genre).permit(*args)
  end

  def find_genre
    @genre = Genre.find(params[:id])
  end
end