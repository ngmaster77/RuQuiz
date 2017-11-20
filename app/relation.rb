class PreguntaRelation < Pregunta
  
  attr_accessor :text, :answer, :relations, :result
  
   def initialize(texto, relaciones, respuestas)
     @text = texto
     @answer = respuestas.split(',')
     @relations = relaciones.split(',')
     @result
     parse()
     
   end
    
   def toRUQL
     r = "drag_drop_choice_answer do "
     r << "text " + "'#{@text}' " + "\n"
     r << "relation " + @result + " \n"
     r << "end"
     r 
   end
   
   def parse 
     i = 0
     @result = []
     while i < @relations.length do 
       if i == @relations.length-1
         @result[i] = ":#{@relations[i]} => '#{@answer[i]}'"

       else
          @result[i] = ":#{@relations[i]} => '#{@answer[i]}',"
      end
       i += 1
     end
     @result = @result.join
   end
     
end