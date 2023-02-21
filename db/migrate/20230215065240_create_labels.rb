class CreateLabels < ActiveRecord::Migration[6.1]
  def change
    create_table :labels do |t|
      t.string :name, default: 'デフォルト', null: false

      t.timestamps
    end
  end
end
