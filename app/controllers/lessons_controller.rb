class LessonsController < ApplicationController
  include SessionsHelper

  before_action :set_session_return_to

  def show
    @lesson = Lesson.find_by_slug(params[:id])
  end

  private
    def lesson_params
      params.require(:lesson).permit(:course_id, :title, :description, :video_embed, :transcript, :free, :slug)
    end
end
