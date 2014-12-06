class NewsMailer < ActionMailer::Base
  default from: "from@example.com"

  def news(post_id)
    @post = Post.find(post_id)
    mail(
      to: "schleary@gmail.com",
      subject: @post.title,
      from: "kokopellilime@gmail.com"
    )
  end
end
