class Estadistica < ActiveRecord::Base
  has_one :users
  belongs_to :users
  validates_presence_of :name, :aprobados, :realizados, :suspensos, :media, :porcentajeaprobados, :porcentajeasuspensos
end