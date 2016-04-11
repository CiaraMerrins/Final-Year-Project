class AddStatusTypeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :status_type, :string
  end
end
