class Fitbit::Step < Fitbit::Data
  attr_accessor :steps, :user, :date

  def initialize(user, date)
    super(user)
    @user = user
    @date = date
  end

  def call
    api_tries ||= 3
    #TODO we can grab 7 days.
    response = user.fitbit_data.activity_time_series(resource: 'steps', start_date: date, period: '1d')
    @steps = response['activities-steps'].first['value'].to_i
  rescue FitgemOauth2::UnauthorizedError => e
    #TODO this is a super shitty way to protect against this. You have to do
    #it everywhere but fitbit doesn't have a pint to check yourself:(
    # I guess I could check the expriation time in the idenity before making a call too.
    # try that when you look at this and you can do it in the initializer.

    api_tries -= 1
    if api_tries > 0
      user.refresh_fitbit_token!
      retry
    else
      Rails.logger.error "Damn: #{e}"
      raise
    end
  end
end
