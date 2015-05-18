class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.integer     :reservation_id,  null: false
      t.timestamps                    null: false
    end
  end
end
