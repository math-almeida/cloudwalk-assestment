class AddUserRefToRepository < ActiveRecord::Migration[7.0]
  def change
    add_reference :repositories, :user, null: false, foreign_key: true
  end
end
