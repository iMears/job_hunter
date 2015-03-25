class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :position
      t.string :location
      t.string :company
      t.string :job_email

      t.timestamps
    end
  end
end
