class CreateSubmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :submissions do |t|
      t.text :code
      t.string :language
      t.integer :point
      t.integer :length
      t.integer :verdict
      t.integer :time
      t.integer :memory

      t.timestamps
    end
  end
end
