class YoutubeController < ApplicationController

  before_action :user_has_profile?
  
    def show
      @youtube = Youtube.new(id: params[:id])
      render json: {
        sgid: @youtube.attachable_sgid,
        content: render_to_string(partial: "youtubes/thumbnail", locals: { youtube: @youtube }, formats: [:html])
      }
    end
  end