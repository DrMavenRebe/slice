class Events::Steps::UserDaily
  attr_accessor :user_id, :datetime, :step

  def initialize(user_id, datetime)
    @user_id = user_id
    @datetime = datetime
  end

  def call
    create_event_step
    check_last_event_step
  end

  def create_event_step
    @step = Events::Step.create!(
      user_id: user_id,
      daily_steps: steps,
      last_event_step_id: last_event_step_id)
  end

  def last_event_step_id
    Events::Step.
      where(user_id: user_id).
      order("created_at ASC").
      last.
      id
  end

  def steps
    Fitbit::Summary.new(user, chicago_datetime).steps || 0
  end

  private

  def check_last_event_step
    if step && (chicago_created_day(step) > chicago_created_day(step.event_step))
      step.event_step.update_attributes(day_final: true)
    end
  end

  def now
    @now ||= DateTime.now.utc
  end

  def user
    @id ||= User.find(user_id)
  end

  def chicago_created_day(current_step)
    current_step.created_at.in_time_zone("Central Time (US & Canada)").day
  end

  def chicago_datetime
    datetime.in_time_zone("Central Time (US & Canada)")
  end
end
