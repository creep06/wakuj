class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.string :name
      t.integer :verdict
      t.integer :time
      t.integer :memory

      t.timestamps
    end
  end
end
