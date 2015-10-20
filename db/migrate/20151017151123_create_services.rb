class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      #t.integer :index
      t.string :name
      t.references :user, index: true

      t.timestamps
    end
  end
end
