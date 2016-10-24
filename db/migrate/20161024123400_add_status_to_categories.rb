class AddStatusToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :status, :boolean
  end
end
