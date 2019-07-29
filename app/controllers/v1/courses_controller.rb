class V1::CoursesController < ApplicationController

  before_action :set_course, only: [:update, :show, :destroy]

  #method GET
  #route /courses
  def index
      render_success data: {
          courses: ActiveModel::Serializer::CollectionSerializer.new(Course.all, serializer: CourseSerializer)
      }
  end

  #method POST
  #route /courses
  def create
      course = Course.new(course_params)
      if course.save
        render_created data: { vertical: CourseSerializer.new(course) }, message: 'Course Created Successfully'
      else
        render_unprocessable_entity message: course.errors.full_messages.join(', ')
      end
  end

  #method PUT/PATCH
  #route /courses/{id}
  def update
    if @course.update(course_params)
      render_updated data: { vertical: CourseSerializer.new(@course) }, message: 'Course Updated Successfully'
    else
      render_unprocessable_entity message: @course.errors.full_messages.join(', ')
    end
  end

  #method GET
  #route /courses/{id}
  def show
    render_success data: { course: CourseSerializer.new(@course) }, message: 'Course Found'
  end

  #method DELETE
  #route /courses/{id}
  def destroy
    if @course.destroy
      render_success message: 'Course Deleted'
    else
      render_unprocessable_entity message: @course.errors.full_messages.join(', ')
    end
  end

  private

  #set object or fail if not found
  def set_course
    @course = Course.find_by(id: params[:id])
    render_500_error(message: "Course Not found") unless @course
  end

  # Only allow a trusted parameter "white list" through.
  def course_params
    params.permit(:name, :author, :category_id, :state)
  end

end
