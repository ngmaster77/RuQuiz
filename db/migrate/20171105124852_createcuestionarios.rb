class Createcuestionarios < ActiveRecord::Migration
  def change
    create_table :cuestionarios do |t|
      t.integer :idcuestionario
      t.string :name
      t.float :nota
    end
  end
end
