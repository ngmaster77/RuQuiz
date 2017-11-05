class Estadistica < ActiveRecord::Base
  has_one :users
  belongs_to :name: "User"
  validates_presence_of :name, :aprobados, :realizados, :suspensos, :media, :porcentajeaprobados, :porcentajeasuspensos
end