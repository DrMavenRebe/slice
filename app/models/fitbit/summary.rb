class Fitbit::Summary < Fitbit::Data
  attr_accessor  :activeScore, :activityCalories, :caloriesBMR, :caloriesOut,
    :description, :distance_total, :steps, :fairlyActiveMinutes,
    :lightlyActiveMinutes, :marginalCalories, :sedentaryMinutes,
    :veryActiveMinutes

    #TODO OAUTH2
    # this shouuld look like this now that you have to request all your resources:
    # summary['activities-steps'].first['value']

  def initialize(user, date)
    super(user)

    summary = user.fitbit_data.activity_time_series(resource: 'steps', start_date: date, period: '1d')
    if data_available? && summary
      @activeScore = summary['activeScore']
      @activityCalories = summary['activityCalories']
      @caloriesBMR = summary['caloriesOut']
      @caloriesOut = summary['calories']
      @description = summary['description']
      @distance_total = "#{summary['distance']['total']} #{user.unit_measurement_mappings[:distance]}" if (summary['distance'] && summary['distance']['total'])
      @steps = summary['steps']
      @fairlyActiveMinutes = summary['fairlyActiveMinutes']
      @lightlyActiveMinutes = summary['lightlyActiveMinutes']
      @marginalCalories = summary['marginalCalories']
      @sedentaryMinutes = summary['sedentaryMinutes']
      @veryActiveMinutes = summary['veryActiveMinutes']
    end

    # Uncomment to view the data that is returned by the Fitbit service
    # ActiveRecord::Base.logger.info activity_data
  end
end
