$(document).ready(function() {
    console.log("jquery ok")
    var pregunta = 1;
    $("#add").click(function() {
        var intId = $("#buildyourform div").length + 1;
        var fieldWrapper = $("<div class=\"fieldwrapper\" id=\"field" + intId + "\"/>");
        var fName = $("<input type=\"text\" class=\"fieldname\" />");
        var fType = $("<select class=\"fieldtype\"><option value=\"checkbox\">Checked</option><option value=\"textbox\">Text</option><option value=\"textarea\">Paragraph</option></select>");
        var removeButton = $("<input type=\"button\" class=\"remove\" value=\"-\" />");
        removeButton.click(function() {
            $(this).parent().remove();
        });
        fieldWrapper.append(fName);
        fieldWrapper.append(fType);
        fieldWrapper.append(removeButton);
        $("#buildyourform").append(fieldWrapper);
    });
    $("#add1").click(function() {        
        var questionTitle = "<hr><h3>Pregunta " + pregunta + " <small>(Verdadero o Falso)</small></h3>";
        pregunta++;
        var inputQuestion = "<div class=\"form-row\"><div class=\"form-group col-md-8\"><label for=\"inputQuestionTrueFalse" + pregunta + "\">Enunciado</label><input type=\"text\" class=\"form-control\" id=\"inputQuestionTrueFalse" + pregunta + "\"></div>";
        var inputAnswer = "<div class=\"form-group col-md-4\"><label for=\"inputAnswerTrueFalse" + pregunta + "\">Respuesta</label><select id=\"inputAnswerTrueFalse" + pregunta + "\" class=\"form-control\"><option selected disabled>Seleccionar respuesta...</option><option>Verdadero</option><option>Falso</option></select></div></div>";

        var question = questionTitle + inputQuestion + inputAnswer;
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
});