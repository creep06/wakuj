class AddColumnToProblem < ActiveRecord::Migration[5.2]
	def change
		add_column :problems, :constraint, :text
		add_column :problems, :sample1i, :text
		add_column :problems, :sample1o, :text
		add_column :problems, :sample2i, :text
		add_column :problems, :sample2o, :text
		add_column :problems, :sample3i, :text
		add_column :problems, :sample3o, :text
		add_column :problems, :sample4i, :text
		add_column :problems, :sample4o, :text
		add_column :problems, :sample5i, :text
		add_column :problems, :sample5o, :text
		add_column :problems, :sample6i, :text
		add_column :problems, :sample6o, :text
		add_column :problems, :sample7i, :text
		add_column :problems, :sample7o, :text
		add_column :problems, :sample8i, :text
		add_column :problems, :sample8o, :text
		add_column :problems, :sample9i, :text
		add_column :problems, :sample9o, :text
		add_column :problems, :sample10i, :text
		add_column :problems, :sample10o, :text
	end
end
