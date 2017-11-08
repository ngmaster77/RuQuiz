require './app/pregunta'
require './app/preguntarelleno'
require './app/truefalse'

class Questionario
  
  @preguntas = []
  attr_accessor :titulo
  
  def initialize (titulo, array)
    @titulo = titulo
    @preguntas = array
  end
  
  def write 
    
      r = "quiz " + "'#{@titulo}'" + " do\n"
      @preguntas.each { |x| 
        r << x.toRUQL
        r <<"\n"
      }
      r << "end"
      puts r
      File.open("./app/#{@titulo}.rb","w+"){|f| f.write(r) }
      
  end
  
end


A = PreguntaRelleno.new("capital de california", "sacramento", "2")
B = TrueFalse.new('la tierra es plana', 'false', '1')

C = Questionario.new("Prueba", [A,B])
C.write()