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
    
    
  end
  
  def write 
    
      r = "quiz " + "'#{@titulo}'" + " do\n"
      @preguntas.each { |x| 
        r << x.toRUQL
        r <<"\n"
      }
      r << "end"
      puts r
      File.open("./app/#{@identificador}.rb","w+"){|f| f.write(r) }
      
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


