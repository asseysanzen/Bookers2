class RemoveIntroductionIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :introductin_id, :text
  end
end
