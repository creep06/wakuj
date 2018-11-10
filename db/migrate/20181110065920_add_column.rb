class AddColumn < ActiveRecord::Migration[5.2]
	def change
		add_column :submissions, :problem_id, :integer
		add_column :submissions, :user_id, :integer
		add_column :results, :submission_id, :integer
		add_column :accepteds, :user_id, :integer
		add_column :accepteds, :problem_id, :integer
	end
end
