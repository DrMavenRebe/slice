# == Schema Information
#
# Table name: podium_podium_placers
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  name       :string
#  place      :integer
#  podium_id  :integer
#  updated_at :datetime         not null
#  user_id    :integer
#

class Podium::PodiumPlacersController < ApplicationController
  before_action :set_podium_podium_placer, only: [:show, :edit, :update, :destroy]

  # GET /podium/podium_placers
  def index
    @podium_podium_placers = Podium::PodiumPlacer.all
  end

  # GET /podium/podium_placers/1
  def show
  end

  # GET /podium/podium_placers/new
  def new
    @podium_podium_placer = Podium::PodiumPlacer.new
  end

  # GET /podium/podium_placers/1/edit
  def edit
  end

  # POST /podium/podium_placers
  def create
    @podium_podium_placer = Podium::PodiumPlacer.new(podium_podium_placer_params)

    if @podium_podium_placer.save
      redirect_to @podium_podium_placer, notice: 'Podium placer was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /podium/podium_placers/1
  def update
    if @podium_podium_placer.update(podium_podium_placer_params)
      redirect_to @podium_podium_placer, notice: 'Podium placer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /podium/podium_placers/1
  def destroy
    @podium_podium_placer.destroy
    redirect_to podium_podium_placers_url, notice: 'Podium placer was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_podium_podium_placer
      @podium_podium_placer = Podium::PodiumPlacer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def podium_podium_placer_params
      params.require(:podium_podium_placer).permit(:place, :podium_id, :user_id, :name)
    end
end
