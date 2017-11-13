class Createusers < ActiveRecord::Migration[5.1]
    def change
      drop_table :users
      drop_table :estadisticas
      create_table :users do |t|
        t.string :name
        t.string :email
        t.string :password_digest
        t.boolean :instructor
        t.integer :suspensos
        t.integer :aprobados
      end
  end
end

