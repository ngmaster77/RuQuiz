class Createall < ActiveRecord::Migration[5.1]
  def change
    drop_table :cuestionarios
    create_table :cuestionarios  do |t|
      t.string :titulo
      t.string :descripcion 
      t.string :creador
      t.integer :npreguntas
      t.float :notaaprobar
      t.float :notamaxima
      t.string :fechacre
    end
    drop_table :users
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :instructor
      t.integer :suspensos
      t.integer :aprobados
    end
    drop_table :resultados
    create_table :resultados do |t|
      t.belongs_to :user, index: true
      t.belongs_to :cuestionario, index: true
      t.string :name
      t.float :nota
      t.string :fechares
    end
  end
end
