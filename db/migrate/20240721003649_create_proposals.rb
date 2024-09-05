class CreateProposals < ActiveRecord::Migration[7.2]
  def change
    create_table :proposals do |t|
      t.string :html
      t.string :title
      t.timestamps
    end
  end
end
