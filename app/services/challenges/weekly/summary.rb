class Challenges::Weekly::Summary
  attr_accessor :users

  def initialize
    @users = []
  end

  def call
    @users = build_users

    self
  end

  def sorted_users
    @users.sort { |x,y| y.total_steps <=> x.total_steps }
  end

  private

  def build_users
    User.all.map do |user|
      Challenges::Weekly::User.new(user).call
    end
  end
end
