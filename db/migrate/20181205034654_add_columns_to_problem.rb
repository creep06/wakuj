class AddColumnsToProblem < ActiveRecord::Migration[5.2]
	def change
		add_column :problems, :input_desc, :text
		add_column :problems, :output_desc, :text
	end
end
