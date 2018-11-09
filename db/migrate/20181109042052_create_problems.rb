class CreateProblems < ActiveRecord::Migration[5.2]
  def change
    create_table :problems do |t|
      t.string :name
      t.text :statement
      t.integer :point
      t.integer :time_limit
      t.integer :memory_limit
      t.integer :solved_count
      t.integer :submitted_count
      t.integer :ac_count
      t.integer :testcases_count
      t.boolean :secret

      t.timestamps
    end
  end
end
