class Resultado < ActiveRecord::Base
  has_one :user
  has_one :cuestionario
  belongs_to :user
  belongs_to :cuestionario
  validates_presence_of :idcuestionario, :name, :nota
end