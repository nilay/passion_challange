class V1::CategoriesController < ApplicationController

  before_action :set_category, only: [:update, :show, :destroy]

  #method GET
  #route /categories
  def index
    render_success data: {
      categories: ActiveModel::Serializer::CollectionSerializer.new(Category.all, serializer: CategorySerializer)
    }
  end

  #method POST
  #route /categories
  def create
    category = Category.new(category_params)
    if category.save
      render_created data: { category: CategorySerializer.new(category) }, message: 'Category Created Successfully'
    else
      render_unprocessable_entity message: category.errors.full_messages.join(', ')
    end
  end

  #method PATCH/PUT
  #route /categories/{id}
  def update
    if @category.update(category_params)
      render_updated data: { category: CategorySerializer.new(@category) }, message: 'Category Updated Successfully'
    else
      render_unprocessable_entity message: @category.errors.full_messages.join(', ')
    end
  end

  #method GET
  #route /categories/{id}
  def show
    render_success data: { category: CategorySerializer.new(@category) }, message: 'Category Found'
  end

  #method DELETE
  #route /categories/{id}
  def destroy
    if @category.destroy
      render_success message: 'Category Deleted'
    else
      render_unprocessable_entity message: @category.errors.full_messages.join(', ')
    end
  end


  private

  #set object or fail if not found
  def set_category
    @category = Category.find(params[:id])
    render_500_error(message: "Not found") unless @category
  end

  # Only allow a trusted parameter "white list" through.
  def category_params
    params.permit(:name, :vertical_id, :state)
  end

end
