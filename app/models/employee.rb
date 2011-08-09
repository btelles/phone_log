class Employee < ActiveRecord::Base

  def full_name
    [first_name, last_name].compact.join(' ')
  end

  def select_option
    [full_name, id]
  end


  def self.options_with_id
    order("last_name asc, first_name asc").map(&:select_option)
  end
end
