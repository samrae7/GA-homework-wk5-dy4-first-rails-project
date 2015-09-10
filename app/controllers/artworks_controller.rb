class ArtworksController < ApplicationController
protect_from_forgery

  def home
   redirect_to '/artworks'
  end

  def index
    @artworks = Artwork.all


  end

  def new
    # render text: 'this is the enpoint of the new route. here youll see a form that you can fill out to submit a new artwork'
    @artwork = Artwork.new
  end

  def create
    params.require(:artwork).permit!
    @artwork = Artwork.new(params[:artwork])

    if @artwork.save

      redirect_to "/artworks/#{@artwork[:id]}"
    else
      redirect_to "/artwork/new"
    end
  end

  def show
    @artwork = Artwork.find(params[:id])
    # render text: 'this page will show one specific item matching the id in the link'
  end


  def edit
    @artwork = Artwork.find(params[:id])
  end

  def update
    params.require(:artwork).permit!
    @artwork = Artwork.find(params[:id])
    if @artwork.update(params[:artwork])
      redirect_to "/artworks/#{@artwork.id}"
    else
      redirect_to "/artworks/#{@artwork.id}/edit"
    end
  end

  def delete
    @artwork = Artwork.find(params[:id])
    if @artwork.destroy
      redirect_to "/artworks"
    else
      redirect_to "/artworks/#{@artwork.id}"
    end
  end


end
