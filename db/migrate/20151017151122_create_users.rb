class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      #t.integer :index
      t.string :name
      t.text :log

      t.timestamps
    end
  end
end
