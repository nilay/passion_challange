class VerticalSerializer < ActiveModel::Serializer
  attributes :id, :name

  #show categories in that vertical
  # has_many :category  #serializer: CategorySerializer
end
