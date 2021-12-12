class CreateFloorplans < ActiveRecord::Migration[6.1]
  def change
    create_table :floorplans do |t|
      t.string :name
      t.belongs_to :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
