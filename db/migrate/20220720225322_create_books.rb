class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|

      #本のタイトルと感想のカラム
      t.string :title
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
