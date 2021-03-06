class EmailNewsJob
  extend HerokuResqueAutoscaler
  @queue = :email
  def self.perform(post_id, user_id)
    NewsMailer.news(post_id, user_id).deliver
  end
end
