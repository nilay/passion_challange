class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :state, :vertical_id

  #show vertical information that category belongs to
  #belongs_to :vertical  #serializer: VerticalSerializer
end
