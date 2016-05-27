class Challenges::Weekly::User
  attr_accessor :user, :monday_steps, :tuesday_steps, :wednesday_steps,
    :thursday_steps, :friday_steps, :name, :market, :team

  def initialize(user)
    @user = user
  end

  def call
    @monday_steps = fetch_steps(user, monday_date)
    @tuesday_steps = fetch_steps(user, tuesday_date)
    @wednesday_steps = fetch_steps(user, wednesday_date)
    @thursday_steps = fetch_steps(user, thursday_date)
    @friday_steps = fetch_steps(user, friday_date)
    @name = user.name
    @market = user.market
    @team = user.team

    self
  end

  def total_steps
    monday_steps + tuesday_steps + wednesday_steps + thursday_steps + friday_steps
  end

 def fetch_steps(user, date)
    Rails.cache.fetch("#{cache_key(user, date)}/steps", expires_in: cache_expiration(date)) do
      Fitbit::Summary.new(user, date).steps || 0
    end
  end

  def cache_key(user, date)
    "summary/event_total/#{user.id}-#{date.beginning_of_day.to_i}"
  end

  def cache_expiration(date)
    if date  < (now - 1.day)
      5.days
    else
      5.minutes
    end
  end

  def now
    @datetime ||= DateTime.now.in_time_zone("Central Time (US & Canada)")
  end

  def monday_date
    now.beginning_of_week
  end

  def tuesday_date
    now.beginning_of_week + 1.day
  end

  def wednesday_date
    now.beginning_of_week + 2.day
  end

  def thursday_date
    now.beginning_of_week + 3.day
  end

  def friday_date
    now.beginning_of_week + 4.day
  end
end
