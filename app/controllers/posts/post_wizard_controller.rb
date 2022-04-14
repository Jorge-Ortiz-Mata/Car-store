class Posts::PostWizardController < ApplicationController

    include Wicked::Wizard

    steps :set_title, :set_description
    before_action :set_post

    def show
        authorize @post, :same_user?
        render_wizard
    end

    def update
        authorize @post, :same_user?
        case step
            when :set_title
                @post.update(post_params)
            when :set_description
                @post.update(post_params)
        end 
        render_wizard @post
    end

    def finish_wizard_path
        post_path(@post)
    end

    private

        def set_post
            @post = Post.friendly.find(params[:post_id])
        end

        def post_params
            params.require(:post).permit(:title, :body)
        end

end
