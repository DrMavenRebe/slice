# == Schema Information
#
# Table name: podium_podium_day_totals
#
#  created_at       :datetime         not null
#  id               :integer          not null, primary key
#  podium_placer_id :integer
#  total            :integer
#  updated_at       :datetime         not null
#

class Podium::PodiumDayTotalsController < ApplicationController
  before_action :set_podium_podium_day_total, only: [:show, :edit, :update, :destroy]

  # GET /podium/podium_day_totals
  def index
    @podium_podium_day_totals = Podium::PodiumDayTotal.all
  end

  # GET /podium/podium_day_totals/1
  def show
  end

  # GET /podium/podium_day_totals/new
  def new
    @podium_podium_day_total = Podium::PodiumDayTotal.new
  end

  # GET /podium/podium_day_totals/1/edit
  def edit
  end

  # POST /podium/podium_day_totals
  def create
    @podium_podium_day_total = Podium::PodiumDayTotal.new(podium_podium_day_total_params)

    if @podium_podium_day_total.save
      redirect_to @podium_podium_day_total, notice: 'Podium day total was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /podium/podium_day_totals/1
  def update
    if @podium_podium_day_total.update(podium_podium_day_total_params)
      redirect_to @podium_podium_day_total, notice: 'Podium day total was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /podium/podium_day_totals/1
  def destroy
    @podium_podium_day_total.destroy
    redirect_to podium_podium_day_totals_url, notice: 'Podium day total was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_podium_podium_day_total
      @podium_podium_day_total = Podium::PodiumDayTotal.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def podium_podium_day_total_params
      params.require(:podium_podium_day_total).permit(:podium_placer_id, :total)
    end
end
