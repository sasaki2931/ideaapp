class CreateThemes < ActiveRecord::Migration[6.1]
  def change
    create_table :themes do |t|
      t.string :title,      null: false
      t.text :content,      null: false
      t.text :reword     
      t.string :img        

      t.timestamps         null: false
    end
  end
end
