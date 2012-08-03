class ChangeColumnBodyInMessage < ActiveRecord::Migration
  def up
    change_table :messages do |t|
      t.remove :body
      t.text :body
    end
  end

  def down
    remove_column :messages, :body
  end
end
