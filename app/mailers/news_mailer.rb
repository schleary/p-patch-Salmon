class NewsMailer < ActionMailer::Base
  default from: "from@example.com"

  def news(post_id, user_id)
    @post = Post.find(post_id)
    @user = User.find(user_id)
    mail(
      to: @user.email,
      subject: @post.title,
      from: "schleary@gmail.com"
    )
  end
end
