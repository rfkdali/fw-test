class FloorplanSerializer < ActiveModel::Serializer
  attributes :name, :original, :thumb, :large

  def original
    object.original
  end

  def thumb
    object.thumb
  end

  def large
    object.large
  end
end
