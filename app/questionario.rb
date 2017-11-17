require './app/pregunta'
require './app/preguntarelleno'
require './app/truefalse'
require './app/seleccion'
require './app/preguntadrop'
require './app/relation'

class Questionario
  
  @preguntas = []
  attr_accessor :titulo
  
  def initialize (titulo, array)
    @titulo = titulo
    @preguntas = array
  end
  
  def write(id)
      r = "quiz " + "'#{@titulo}'" + " do\n"
      @preguntas.each { |x| 
        r << x.toRUQL
        r <<"\n"
      }
      r << "end"
      puts r
      File.open("./var/#{id}.rb","w+"){|f| f.write(r) }
  end
end


