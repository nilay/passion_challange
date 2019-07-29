class V1::VerticalsController < ApplicationController

  before_action :set_vertical, only: [:update, :show, :destroy]

  #method GET
  #route /verticals
  def index
      render_success data: {
          verticals: ActiveModel::Serializer::CollectionSerializer.new(Vertical.all, serializer: VerticalSerializer)
      }
  end

  #method POST
  #route /verticals
  def create
      vertical = Vertical.new(vertical_params)
      if vertical.save
        render_created data: { vertical: VerticalSerializer.new(vertical) }, message: 'Vertical Created Successfully'
      else
        render_unprocessable_entity message: vertical.errors.full_messages.join(', ')
      end
  end

  #method PATCH/PUT
  #route /verticals/{id}
  def update
    if @vertical.update(vertical_params)
      render_updated data: { vertical: VerticalSerializer.new(@vertical) }, message: 'Vertical Updated Successfully'
    else
      render_unprocessable_entity message: @vertical.errors.full_messages.join(', ')
    end
  end

  #method GET
  #route /verticals/{id}
  def show
    render_success data: { vertical: VerticalSerializer.new(@vertical) }, message: 'Vertical Found'
  end

  #method DELETE
  #route /verticals/{id}
  def destroy
    if @vertical.destroy
      render_success message: 'Vertical Deleted'
    else
      render_unprocessable_entity message: @vertical.errors.full_messages.join(', ')
    end
  end

  private

  #set object or fail if not found
  def set_vertical
    @vertical = Vertical.find_by(id: params[:id])
    render_500_error(message: "Vertical Not found") unless @vertical
  end

  # Only allow a trusted parameter "white list" through.
  def vertical_params
    params.permit(:name)
  end

end
