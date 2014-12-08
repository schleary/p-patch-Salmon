class EmailSubscribeJob
  @queue = :email
  def self.perform(user_id)
    NewsMailer.subscribe(user_id).deliver
  end
end
