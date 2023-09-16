# app/controllers/flats_controller.rb

class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
  end
  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat = current_user.flats.build(flat_params)

    if @flat.save
      redirect_to @flat, notice: 'El apartamento se ha creado exitosamente.'
    else
      render :new
    end
  end


  def edit
    @flat = Flat.find(params[:id])
  end


  def update
    @flat = Flat.find(params[:id])
    if @flat.update(flat_params)
      redirect_to @flat, notice: 'El apartamento se ha actualizado correctamente.'
    else
      render :edit
    end
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to flats_path, notice: 'El apartamento ha sido eliminado correctamente.'
  end


  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end
end
