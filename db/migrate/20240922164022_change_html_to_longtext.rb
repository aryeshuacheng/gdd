class ChangeHtmlToLongtext < ActiveRecord::Migration[7.2]
  def change
    change_column :proposals, :html, :longtext
  end
end
