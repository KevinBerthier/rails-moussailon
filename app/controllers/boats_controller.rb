class BoatsController < ApplicationController
  before_action :set_boat, only: [:show, :edit, :update, :destroy]

  # GET /boats
  def index
    query = params.select do |k,v|
      if v != ""
        k == "gender" || k == "city"
      end
    end
    query_values = query.values

    if params[:capacity] != "" && query_values != []
      @boats = Boat.where(capacity: params[:capacity].to_i..900).search_params(query_values)
    elsif query_values == []
      @boats = Boat.all
    elsif params[:capacity] != "" && query_values == []
      @boats = Boat.where(capacity: params[:capacity].to_i..900)
    else
      @boats = Boat.search_params(query_values)
    end
    # geocoder script
    @bobos = Boat.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@bobos) do |bobo, marker|
      marker.lat bobo.latitude
      marker.lng bobo.longitude
    end
  end

  # GET /boats/1
  def show
    @booking = Booking.new
  end

  # GET /boats/new
  def new
    if current_user
      @boat = Boat.new
    else
      redirect_to new_user_registration_path
    end
  end

  # GET /boats/1/edit
  def edit
  end

  # POST /boats
  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user

    if @boat.save
      redirect_to @boat, notice: 'Votre bateau a bien été enregistré.'
    else
      render :new
    end
  end

  # PATCH/PUT /boats/1
  def update
    if @boat.update(boat_params)
      redirect_to @boat, notice: 'Votre bateau a bien été modifié.'
    else
      render :edit
    end
  end

  # DELETE /boats/1
  def destroy
    @boat.destroy
    redirect_to dashboard_url, notice: 'Votre bateau a bien été retiré'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boat
      @boat = Boat.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def boat_params
      params.require(:boat).permit(
        :name, :address, :capacity, :description,
        :model, :gender, :price, :city, photos: []
      )
    end
end
