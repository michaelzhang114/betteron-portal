class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.text :heading
      t.text :link

      t.timestamps
    end
  end
end
