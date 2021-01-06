class CreateCredits < ActiveRecord::Migration[6.0]
  def change
    create_table :credits do |t|
      t.references :store, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :credits

      t.timestamps
    end
  end
end
