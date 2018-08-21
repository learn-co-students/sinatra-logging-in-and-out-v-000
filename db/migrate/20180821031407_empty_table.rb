class EmptyTable < ActiveRecord::Migration[5.1]
  def change
    <<-SQL
    DELETE * FROM users;
    SQL

  end
end
