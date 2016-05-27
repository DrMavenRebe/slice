namespace :deploy do
  desc "create Events::Step link list"
  task :link_events => :environment do
    User.pluck(:id).each do |user_id|
      last = nil;
      Events::Step.
        where(user_id: user_id).
        order("created_at ASC").each do |i|
          i.last_event_step_id = last
          i.save!
          last = i.id
      end
    end
  end

  desc "end of day events"
  task :day_end_events => :environment do
    User.pluck(:id).each do |user_id|
      last = nil;

      Events::Step.
        where(user_id: user_id).
        order("created_at ASC").each do |i|
          if last.present? && (i.created_at.in_time_zone("Central Time (US & Canada)").day > last.created_at.in_time_zone("Central Time (US & Canada)").day)
            last.day_final = true
            last.save!
          end
        last = i
      end
    end
  end
end
