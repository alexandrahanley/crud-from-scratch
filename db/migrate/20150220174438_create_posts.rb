class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :status
      t.string :user
      t.integer :number_of_likes
    end
  end
end
