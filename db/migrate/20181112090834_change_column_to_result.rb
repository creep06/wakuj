class ChangeColumnToResult < ActiveRecord::Migration[5.2]
	def change
		change_column :results, :verdict, :string
	end
end
