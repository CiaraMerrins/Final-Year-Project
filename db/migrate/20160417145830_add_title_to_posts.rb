class AddTitleToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :title, index: true
  end
end
