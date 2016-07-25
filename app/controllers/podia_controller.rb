# == Schema Information
#
# Table name: podia
#
#  created_at  :datetime         not null
#  end_date_at :datetime         not null
#  id          :integer          not null, primary key
#  updated_at  :datetime         not null
#

class PodiaController < ApplicationController
  before_action :set_podium, only: [:show, :edit, :update, :destroy]

  # GET /podia
  def index
    @podia = Podium.all
  end

  # GET /podia/1
  def show
  end

  # GET /podia/new
  def new
    @podium = Podium.new
  end

  # GET /podia/1/edit
  def edit
  end

  # POST /podia
  def create
    @podium = Podium.new(podium_params)

    if @podium.save
      redirect_to @podium, notice: 'Podium was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /podia/1
  def update
    if @podium.update(podium_params)
      redirect_to @podium, notice: 'Podium was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /podia/1
  def destroy
    @podium.destroy
    redirect_to podia_url, notice: 'Podium was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_podium
      @podium = Podium.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def podium_params
      params.require(:podium).permit(:end_date_at)
    end
end
