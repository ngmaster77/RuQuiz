require './app/pregunta'
require './app/preguntarelleno'
require './app/truefalse'
require './app/seleccion'

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
D = PreguntaSeleccion.new("texto","pregunta",["res1","res2","res3"])

C = Questionario.new("Prueba", [A,B,D])
C.write()