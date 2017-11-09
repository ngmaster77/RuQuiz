$(document).ready(function() {
    var pregunta = 1;
    $("#add1").click(function() {        
        var questionTitle = "<hr><h3>Pregunta " + pregunta + " <small>(Verdadero o Falso)</small></h3>";
        var inputQuestion = "<div class=\"form-row\"><div class=\"form-group col-md-8\"><label for=\"inputQuestionTrueFalse" + pregunta + "\">Enunciado</label><input type=\"text\" class=\"form-control\" id=\"inputQuestionTrueFalse" + pregunta + "\" name=\"inputQuestionTrueFalse" + pregunta + "\"></div>";
        var inputAnswer = "<div class=\"form-group col-md-4\"><label for=\"inputAnswerTrueFalse" + pregunta + "\">Respuesta</label><select id=\"inputAnswerTrueFalse" + pregunta + "\" class=\"form-control\" name=\"inputAnswerTrueFalse" + pregunta + "\"><option selected disabled>Seleccionar respuesta...</option><option value=\"true\">Verdadero</option><option value=\"false\">Falso</option></select></div></div>";
        var question = questionTitle + inputQuestion + inputAnswer;
        pregunta++;
        $(".questions").append(question);
    });
    $("#add2").click(function() {
        var questionNumber = "<hr><h3>Pregunta " + pregunta + " <small>(Completar)</small></h3>";
        pregunta++;
        
        $(".questions").append(questionNumber);
    });
    $("#add3").click(function() {
        var questionNumber = "<hr><h3>Pregunta " + pregunta + " <small>(Multirespuesta)</small></h3>";
        pregunta++;
        
        $(".questions").append(questionNumber);
    });
    $("#deleteAll").click(function() {
        pregunta = 1;
        $(".questions").empty();
    });
});