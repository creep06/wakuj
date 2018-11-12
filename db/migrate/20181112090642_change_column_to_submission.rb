class ChangeColumnToSubmission < ActiveRecord::Migration[5.2]
	def change
		change_column :submissions, :verdict, :string
	end
end
