class AddCustomLabelAndNumberToChapters < ActiveRecord::Migration[8.0]
  def change
    add_column :chapters, :custom_label, :string
    add_column :chapters, :custom_number, :integer
  end
end
