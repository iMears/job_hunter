class AddColumnsToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :phone_number, :string
    add_column :jobs, :manager, :string
  end
end
