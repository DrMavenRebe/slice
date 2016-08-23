class Fitbit::Step < Fitbit::Data
  attr_accessor :steps

  def initialize(user, date)
    super(user)

    response = user.fitbit_data.activity_time_series(resource: 'steps', start_date: date, period: '1d')
    @steps = response['activities-steps'].first['value'].to_i
  end
end
