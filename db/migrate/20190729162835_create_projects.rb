class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :start
      t.string :finish
      t.integer :team_id

      t.timestamps
    end
  end
end
