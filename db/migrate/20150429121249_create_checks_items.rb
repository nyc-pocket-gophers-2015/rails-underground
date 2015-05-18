class CreateChecksItems < ActiveRecord::Migration
  def change
    create_table :checks_items do |t|
      t.integer     :check_id,  null: false
      t.integer     :item_id,   null: false
      t.timestamps              null: false
    end
  end
end
