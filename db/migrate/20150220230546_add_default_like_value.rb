class AddDefaultLikeValue < ActiveRecord::Migration
  def change
    change_column :posts, :number_of_likes, :integer, default: 0
  end
end
