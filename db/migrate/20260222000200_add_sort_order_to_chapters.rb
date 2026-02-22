class AddSortOrderToChapters < ActiveRecord::Migration[8.0]
  def up
    add_column :chapters, :sort_order, :integer, null: false, default: 0

    migration_chapter = Class.new(ActiveRecord::Base) do
      self.table_name = "chapters"
    end

    migration_chapter.reset_column_information
    migration_chapter.order(:created_at).each_with_index do |chapter, index|
      chapter.update_columns(sort_order: index + 1)
    end
  end

  def down
    remove_column :chapters, :sort_order
  end
end
