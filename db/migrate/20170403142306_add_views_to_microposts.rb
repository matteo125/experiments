class AddViewsToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :views, :integer
  end
end
