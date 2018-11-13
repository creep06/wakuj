class SetDefaultValue < ActiveRecord::Migration[5.2]
	def change
		change_column_default(:users, :admin, false)
		change_column_default(:users, :point, 0)
		change_column_default(:users, :solved, 0)
		change_column_default(:users, :submitted, 0)

		change_column_default(:problems, :solved_count, 0)
		change_column_default(:problems, :submitted_count, 0)
		change_column_default(:problems, :ac_count, 0)
		change_column_default(:problems, :secret, false)

		change_column_default(:submissions, :verdict, "Pending")
		change_column_default(:submissions, :time, 0)
		change_column_default(:submissions, :memory, 0)

		remove_column :submissions, :compile_error, :boolean
	end
end
