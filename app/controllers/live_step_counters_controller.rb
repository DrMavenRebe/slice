class LiveStepCountersController < ApplicationController

  def index
    @user_summaries = User.all.map{|u| Summary::RunningTotal.new(u).call }.sort { |x,y| y.net_total <=> x.net_total }
  end
end
