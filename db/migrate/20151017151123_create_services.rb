class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.references :user, index: true

      t.timestamps
    end
  end
end
