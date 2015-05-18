class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer   :organizer_id,  null: false
      t.string    :name,          null: false
      t.integer   :min_age,       null: false
      t.datetime  :held_at,       null: false
      t.timestamps                null: false
    end
  end
end
