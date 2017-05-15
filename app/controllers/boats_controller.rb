class BoatsController < ApplicationController
  before_action :set_boat, only: [:show, :edit, :update, :destroy]

  # GET /boats
  def index
    if params[:city] != ""
      params[:city].capitalize!
      @boats = Boat.where(city: params[:city])
    else
      @boats = Boat.all
    end
  end

  # GET /boats/1
  def show
    @booking = Booking.new
  end

  # GET /boats/new
  def new
    @boat = Boat.new
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
    redirect_to boats_url, notice: 'Votre bateau a bien été retiré'
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
