class Summary::RunningTotal
  attr_accessor :user, :day_totals

  def initialize(user)
    @user = user
    @day_totals = {}
  end

  def call
    populate(5)
  end

  def populate(count)
    count.times.each do |i|
      date = now - i.days
      steps = fetch_steps(user, date)

      day_totals[i] = steps || 0
    end

    return self
  end

  def net_total
    day_totals.values.sum
  end

  def name
    user.try(:name) || ""
  end

  def market
    user.try(:market) || ""
  end

  def team
    user.try(:team) || ""
  end

  private

  def fetch_steps(user, date)
    Fitbit::Summary.new(user, date).steps
  end

  def now
    @datetime ||= DateTime.now.in_time_zone("Central Time (US & Canada)")
  end
end