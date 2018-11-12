class AddColumnToSubmission < ActiveRecord::Migration[5.2]
  def change
	  add_column :submissions, :compile_error, :boolean
  end
end
