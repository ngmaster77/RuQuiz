class PreguntaDrop < Pregunta
  
  attr_accessor :text, :answer
  
   def initialize(texto,respuesta)
     @text = texto
     @answer = respuesta
     parse()
   end
    
   def toRUQL
     r = "drag_drop_fill_in do "
     r << "text " + "'#{@text}' " + "\n"
     r << "answer " + "#{@answer}" + " "
     r << "end"
     r 
   end
   
   
   def parse
     @text = @text.split()
     aux = @answer.split(',')
     i = 0 
     j = 0
     
     while i < @text.length 
       if @text[i] == '-'
          while @text[i].length != aux[j].length
                @text[i] << '-'
          end
          j += 1
       end
        i += 1 
     end
     
     @text = @text.join(' ')
     @answer = @answer.downcase 
     @answer = @answer.split(',').to_s.gsub('"','\'')
     
   end
   
end