class CoursesController < ApplicationController
  include SessionsHelper

  before_action :set_session_return_to

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find_by_slug(params[:id])
  end

  private
    def course_params
      params.require(:course).permit(:title, :description, :image_url, :hidden, :slug)
    end
end
