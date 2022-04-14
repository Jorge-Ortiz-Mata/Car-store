class PostMailer < ApplicationMailer

    def new_post(post)
        @post = post
        mail(to: @post.user.email, subject: "You've created a new post. Post: #{@post.title}")
    end

end
