class CreateIdeas < ActiveRecord::Migration[6.1]
  def change
    create_table :ideas do |t|
      t.references :theme, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :title,   null:false
      t.text   :content,  null:false
      t.string :img      
      t.timestamps
    end
  end
end
