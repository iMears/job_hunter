class AddJobIdColumnToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :job_id, :integer
  end
end
