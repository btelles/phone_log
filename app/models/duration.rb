class Duration < ActiveRecord::Base
  has_many :logs

  def self.options_with_id
    order("length_rating asc").map {|a| [a.name, a.id]}
  end
end
