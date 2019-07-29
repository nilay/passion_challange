class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :author, :state, :category_id

  #show course info that category belongs to
  #belongs_to :category  #serializer: VerticalSerializer
end
