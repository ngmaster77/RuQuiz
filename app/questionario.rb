require './app/pregunta'
require './app/preguntarelleno'
require './app/truefalse'
require './app/seleccion'

class Questionario
  
  @preguntas = []
  attr_accessor :titulo, :identificador
  
  def initialize (titulo, array)
    @titulo = titulo
    @preguntas = array
    @identificador = Time.new.strftime("%Y-%m-%d %H:%M:%S")
    parse()
    puts @identificador
    
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
  
  def parse 

    @identificador = @identificador.to_s
    @identificador = @identificador.split('-')
    @identificador = @identificador.join()
    @identificador = @identificador.split(' ')
    @identificador = @identificador.join()
    @identificador = @identificador.split(':')
    @identificador = @identificador.join()
    
  end
  
end



A = PreguntaRelleno.new("capital de california", "sacramento", "2")
B = PreguntaVerdadero.new('la tierra es plana', 'false', '1')
D = PreguntaSeleccion.new("texto","pregunta",["res1","res2","res3"])

C = Questionario.new("Prueba", [A,B,D])
