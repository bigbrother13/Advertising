module PinsHelper

  def tag_cloud(tags, classes)
    max = tags.values.max
    tags.each do |tag, value|
      index = value.to_f / max * (classes.size - 1)
      yield(Tag.find_by_name(tag), classes[index.round])
    end
  end
end
