class FavoritesController < ApplicationController
  def index
    @q = Favorite.ransack(params[:q])
    @favorites = @q.result(:distinct => true).includes(:venue, :dishes, :cuisines).page(params[:page]).per(10)

    render("favorites/index.html.erb")
  end

  def show
    @dish = Dish.new
    @favorite = Favorite.find(params[:id])

    render("favorites/show.html.erb")
  end

  def new
    @favorite = Favorite.new

    render("favorites/new.html.erb")
  end

  def create
    @favorite = Favorite.new

    @favorite.venue_id = params[:venue_id]

    save_status = @favorite.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/favorites/new", "/create_favorite"
        redirect_to("/favorites")
      else
        redirect_back(:fallback_location => "/", :notice => "Favorite created successfully.")
      end
    else
      render("favorites/new.html.erb")
    end
  end

  def edit
    @favorite = Favorite.find(params[:id])

    render("favorites/edit.html.erb")
  end

  def update
    @favorite = Favorite.find(params[:id])

    @favorite.venue_id = params[:venue_id]

    save_status = @favorite.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/favorites/#{@favorite.id}/edit", "/update_favorite"
        redirect_to("/favorites/#{@favorite.id}", :notice => "Favorite updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Favorite updated successfully.")
      end
    else
      render("favorites/edit.html.erb")
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])

    @favorite.destroy

    if URI(request.referer).path == "/favorites/#{@favorite.id}"
      redirect_to("/", :notice => "Favorite deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Favorite deleted.")
    end
  end
end
