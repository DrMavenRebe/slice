class Fitbit::Summary < Fitbit::Data
  attr_accessor  :activeScore, :activityCalories, :caloriesBMR, :caloriesOut,
    :description, :distance_total, :steps, :fairlyActiveMinutes,
    :lightlyActiveMinutes, :marginalCalories, :sedentaryMinutes,
    :veryActiveMinutes

  def initialize(user, date)
    super(user)

    summary = user.fitbit_data.activities_on_date(date)['summary']

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
