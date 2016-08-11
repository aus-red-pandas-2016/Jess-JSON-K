class ChangePasswordColumnToOriginalPw < ActiveRecord::Migration
  def change
    rename_column :users, :password, :original_pw
  end
end
