class CreateDiscussions < ActiveRecord::Migration[6.0]
  def change
    create_table :discussions do |t|
      t.references :project, null: false, foreign_key: true
      t.string :name
      t.text :goal

      t.timestamps
    end
  end
end
