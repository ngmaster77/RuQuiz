class Resultado < ActiveRecord::Base
  belongs_to :user
  belongs_to :cuestionario
  validates_presence_of :cuestionario_id, :name, :nota
end