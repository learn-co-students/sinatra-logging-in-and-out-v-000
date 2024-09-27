class DeleteUsers < ActiveRecord::Migrations
  def change
    drop_table :users
  end
end
