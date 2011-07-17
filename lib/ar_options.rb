module ArOptions
  def options
    instance_methods.include?('description') ?
      order(:name).map(&:description) :
      order(:name).map(&:name)
  end

  def options_with_id
    instance_methods.include?('description') ?
      order(:name).map {|item| [item.description, item.id]} :
      order(:name).map {|item| [item.name, item.id]}
  end
end

ActiveRecord::Base.extend ArOptions
