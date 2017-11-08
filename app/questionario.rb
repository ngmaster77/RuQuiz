class Questionario
  
  @preguntas = []
  attr_accessor :titulo
  
  def initialize (titulo, array)
    @titulo = titulo
    @preguntas = array
  end
  
  
end
