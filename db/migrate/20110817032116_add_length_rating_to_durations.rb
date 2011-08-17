class AddLengthRatingToDurations < ActiveRecord::Migration
  def change
    add_column :durations, :length_rating, :integer
  end
end
