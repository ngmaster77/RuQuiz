$(document).ready(function() {
    var pregunta = 1;
    $("#add1").click(function() {        
        var questionTitle = "<hr><h3>Pregunta " + pregunta + " <small>(Verdadero o Falso)</small></h3>";
        var questionType = "<div class=\"form-group\"><input type=\"text\" class=\"form-control\" name=\"inputQuestionType" + pregunta + "\" value=\"1\" hidden></div>";
        var inputQuestion = "<div class=\"form-row\"><div class=\"form-group col-md-8\"><label for=\"inputQuestionTrueFalse" + pregunta + "\">Enunciado</label><input type=\"text\" class=\"form-control\" id=\"inputQuestionTrueFalse" + pregunta + "\" name=\"inputQuestionTrueFalse" + pregunta + "\"><small class=\"form-text text-muted\">Introduce el enunciado de la pregunta y luego elige si es verdadera o falsa.</small></div>";
        var inputAnswer = "<div class=\"form-group col-md-4\"><label for=\"inputAnswerTrueFalse" + pregunta + "\">Respuesta Correcta</label><select id=\"inputAnswerTrueFalse" + pregunta + "\" class=\"form-control\" name=\"inputAnswerTrueFalse" + pregunta + "\"><option selected disabled>Seleccionar respuesta...</option><option value=\"true\">Verdadero</option><option value=\"false\">Falso</option></select></div></div>";
        var question = questionTitle + questionType + inputQuestion + inputAnswer;
        var fieldWrapper = $("<div id=\"question" + pregunta + "\"</div>");
        pregunta++;
        fieldWrapper.append(question);
        $(".questions").append(fieldWrapper);
    });
    $("#add2").click(function() {
        var questionTitle = "<hr><h3>Pregunta " + pregunta + " <small>(Completar)</small></h3>";
        var questionType = "<div class=\"form-group\"><input type=\"text\" class=\"form-control\" name=\"inputQuestionType" + pregunta + "\" value=\"2\" hidden></div>";
        var inputQuestion = "<div class=\"form-group\"><label for=\"inputQuestionFillIn" + pregunta + "\">Enunciado</label><input type=\"text\" class=\"form-control\" id=\"inputQuestionFillIn" + pregunta + "\" name=\"inputQuestionFillIn" + pregunta + "\" placeholder=\"La capital de EEUU es - y se encuentra en la costa -\"><small class=\"form-text text-muted\">Escribe un guión (-) donde quieras añadir el espacio en blanco para que el alumno conteste.</small></div>";
        var inputAnswer = "<div class=\"form-group\"><label for=\"inputAnswerTFillIn" + pregunta + "\">Respuesta Correcta</label><input type=\"text\" class=\"form-control\" id=\"inputAnswerFillIn" + pregunta + "\" name=\"inputAnswerFillIn" + pregunta + "\" placeholder=\"Washington,este\"><small class=\"form-text text-muted\">Escribe las respuestas correctas separadas por coma sin espacios.</small></div>";
        var question = questionTitle + questionType + inputQuestion + inputAnswer;
        var fieldWrapper = $("<div id=\"question" + pregunta + "\"</div>");
        pregunta++;
        fieldWrapper.append(question);
        $(".questions").append(fieldWrapper);
    });
    $("#add3").click(function() {
        var questionTitle = "<hr><h3>Pregunta " + pregunta + " <small>(Multirespuesta)</small></h3>";
        var questionType = "<div class=\"form-group\"><input type=\"text\" class=\"form-control\" name=\"inputQuestionType" + pregunta + "\" value=\"3\" hidden></div>";
        var inputQuestion = "<div class=\"form-group\"><label for=\"inputQuestionChoice" + pregunta + "\">Enunciado</label><input type=\"text\" class=\"form-control\" id=\"inputQuestionChoice" + pregunta + "\" name=\"inputQuestionChoice" + pregunta + "\"><small class=\"form-text text-muted\">Introduce el enunciado de la pregunta.</small></div>";
        var inputTrueAnswer = "<div class=\"form-group\"><label for=\"inputTrueAnswerChoice" + pregunta + "\">Respuesta Correcta</label><input type=\"text\" class=\"form-control\" id=\"inputTrueAnswerChoice" + pregunta + "\" name=\"inputTrueAnswerChoice" + pregunta + "\"><small class=\"form-text text-muted\">Introduce solo una respuesta correcta.</small></div>";
        var inputFalseAnswer = "<div class=\"form-group\"><label for=\"inputFalseAnswerChoice" + pregunta + "\">Respuestas Incorrectas</label><input type=\"text\" class=\"form-control\" id=\"inputFalseAnswerChoice" + pregunta + "\" name=\"inputFalseAnswerChoice" + pregunta + "\"><small class=\"form-text text-muted\">Escribe las respuestas incorrectas separadas por coma.</small></div>";
        var question = questionTitle + questionType + inputQuestion + inputTrueAnswer + inputFalseAnswer;
        var fieldWrapper = $("<div id=\"question" + pregunta + "\"</div>");
        pregunta++;
        fieldWrapper.append(question);
        $(".questions").append(fieldWrapper);
    });
    /*$("#deleteAll").click(function() {
        pregunta = 1;
        $(".questions").empty();
    });*/
});