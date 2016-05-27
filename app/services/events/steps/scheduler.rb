class Events::Steps::Scheduler
  attr_reader :now

  def initialize
    @now ||= DateTime.now.utc
  end

  def call
    #for every user, fire a job.
    User.all.pluck(:id).each do |id|
      Events::Steps::UserDailyJob.perform_async(id, now)
    end
  end
end
