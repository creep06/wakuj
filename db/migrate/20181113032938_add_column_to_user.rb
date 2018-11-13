class AddColumnToUser < ActiveRecord::Migration[5.2]
	def change
		add_column :users, :point, :integer
		add_column :users, :solved, :integer
		add_column :users, :submitted, :integer
	end
end
