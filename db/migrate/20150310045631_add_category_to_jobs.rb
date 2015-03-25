class AddCategoryToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :category, :string, default: "interested"
  end
end
