class LessonsController < ApplicationController
  include SessionsHelper

  before_action :set_session_return_to

  def show
    @lesson = Lesson.find_by(slug: params[:id])
  end

  def index
    @lessons = Lesson.all()
  end
end
