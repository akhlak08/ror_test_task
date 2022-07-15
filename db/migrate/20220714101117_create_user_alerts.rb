class CreateUserAlerts < ActiveRecord::Migration[7.0]
  def change
    create_table :user_alerts do |t|
      t.float :price
      t.string :status, default: "created"
      t.integer :user_id

      t.timestamps
    end
  end
end
