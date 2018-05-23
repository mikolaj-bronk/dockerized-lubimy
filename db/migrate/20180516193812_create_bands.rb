class CreateBands < ActiveRecord::Migration[5.2]
  def change
    create_table :bands do |t|
      t.string :name
      t.datetime :date_created
      t.string :image

      t.timestamps
    end
  end
end
