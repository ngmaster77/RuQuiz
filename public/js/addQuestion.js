$(document).ready(function() {
    var pregunta = 1;

    /* Añadir pregunta de tipo: Verdadero o Falso */
    $("#add1").click(function() {        
        var questionTitle = "<hr><h3>Pregunta " + pregunta + " <small class=\"text-muted\">(Verdadero o Falso)</small> <button id=\"deleteQuestion-" + pregunta + "\" type=\"button\" class=\"btn btn-danger btn-sm deleteButton\"><i class=\"fa fa-trash\" aria-hidden=\"true\"></i></button></h3>";
        var questionType = "<div class=\"form-group\"><input type=\"text\" class=\"form-control\" name=\"inputQuestionType" + pregunta + "\" value=\"1\" hidden></div>";
        var inputQuestion = "<div class=\"form-row\"><div class=\"form-group col-md-8\"><label for=\"inputQuestionTrueFalse" + pregunta + "\">Enunciado</label><input type=\"text\" class=\"form-control\" id=\"inputQuestionTrueFalse" + pregunta + "\" name=\"inputQuestionTrueFalse" + pregunta + "\" required><small class=\"form-text text-muted\">Introduce el enunciado de la pregunta y luego elige si es verdadera o falsa.</small></div>";
        var inputAnswer = "<div class=\"form-group col-md-4\"><label for=\"inputAnswerTrueFalse" + pregunta + "\">Respuesta Correcta</label><select id=\"inputAnswerTrueFalse" + pregunta + "\" class=\"form-control\" name=\"inputAnswerTrueFalse" + pregunta + "\" required><option value=\"\">Seleccionar respuesta...</option><option value=\"true\">Verdadero</option><option value=\"false\">Falso</option></select></div></div>";
        var question = questionTitle + questionType + inputQuestion + inputAnswer;
        var fieldWrapper = $("<div class=\"questionWrapper\" id=\"question" + pregunta + "\"</div>");
        pregunta++;
        fieldWrapper.append(question);
        $(".questions").append(fieldWrapper);
    });

    /* Añadir pregunta de tipo: Completar */
    $("#add2").click(function() {
        var questionTitle = "<hr><h3>Pregunta " + pregunta + " <small class=\"text-muted\">(Completar)</small> <button id=\"deleteQuestion-" + pregunta + "\" type=\"button\" class=\"btn btn-danger btn-sm deleteButton\"><i class=\"fa fa-trash\" aria-hidden=\"true\"></i></button></h3>";
        var questionType = "<div class=\"form-group\"><input type=\"text\" class=\"form-control\" name=\"inputQuestionType" + pregunta + "\" value=\"2\" hidden></div>";
        var inputQuestion = "<div class=\"form-group\"><label for=\"inputQuestionFillIn" + pregunta + "\">Enunciado</label><input type=\"text\" class=\"form-control\" id=\"inputQuestionFillIn" + pregunta + "\" name=\"inputQuestionFillIn" + pregunta + "\" placeholder=\"La capital de EEUU es - y se encuentra en la costa -\" required><small class=\"form-text text-muted\">Escribe un guión (-) donde quieras añadir el espacio en blanco para que el alumno conteste.</small></div>";
        var inputAnswer = "<div class=\"form-group\"><label for=\"inputAnswerTFillIn" + pregunta + "\">Respuesta Correcta</label><input type=\"text\" class=\"form-control\" id=\"inputAnswerFillIn" + pregunta + "\" name=\"inputAnswerFillIn" + pregunta + "\" placeholder=\"Washington,este\" required><small class=\"form-text text-muted\">Escribe las respuestas correctas separadas por coma sin espacios.</small></div>";
        var question = questionTitle + questionType + inputQuestion + inputAnswer;
        var fieldWrapper = $("<div class=\"questionWrapper\" id=\"question" + pregunta + "\"</div>");
        pregunta++;
        fieldWrapper.append(question);
        $(".questions").append(fieldWrapper);
    });

    /* Añadir pregunta de tipo: Multirespuesta */
    $("#add3").click(function() {
        var questionTitle = "<hr><h3>Pregunta " + pregunta + " <small class=\"text-muted\">(Multirespuesta)</small> <button id=\"deleteQuestion-" + pregunta + "\" type=\"button\" class=\"btn btn-danger btn-sm deleteButton\"><i class=\"fa fa-trash\" aria-hidden=\"true\"></i></button></h3>";
        var questionType = "<div class=\"form-group\"><input type=\"text\" class=\"form-control\" name=\"inputQuestionType" + pregunta + "\" value=\"3\" hidden></div>";
        var inputQuestion = "<div class=\"form-group\"><label for=\"inputQuestionChoice" + pregunta + "\">Enunciado</label><input type=\"text\" class=\"form-control\" id=\"inputQuestionChoice" + pregunta + "\" name=\"inputQuestionChoice" + pregunta + "\" required><small class=\"form-text text-muted\">Introduce el enunciado de la pregunta.</small></div>";
        var inputTrueAnswer = "<div class=\"form-group\"><label for=\"inputTrueAnswerChoice" + pregunta + "\">Respuesta Correcta</label><input type=\"text\" class=\"form-control\" id=\"inputTrueAnswerChoice" + pregunta + "\" name=\"inputTrueAnswerChoice" + pregunta + "\" required><small class=\"form-text text-muted\">Introduce solo una respuesta correcta.</small></div>";
        var inputFalseAnswer = "<div class=\"form-group\"><label for=\"inputFalseAnswerChoice" + pregunta + "\">Respuestas Incorrectas</label><input type=\"text\" class=\"form-control\" id=\"inputFalseAnswerChoice" + pregunta + "\" name=\"inputFalseAnswerChoice" + pregunta + "\" required><small class=\"form-text text-muted\">Escribe las respuestas incorrectas separadas por coma.</small></div>";
        var question = questionTitle + questionType + inputQuestion + inputTrueAnswer + inputFalseAnswer;
        var fieldWrapper = $("<div class=\"questionWrapper\"id=\"question" + pregunta + "\"</div>");
        pregunta++;
        fieldWrapper.append(question);
        $(".questions").append(fieldWrapper);
    });

    /* Añadir pregunta de tipo: Drag and Drop */
    $("#add4").click(function() {
        var questionTitle = "<hr><h3>Pregunta " + pregunta + " <small class=\"text-muted\">(Arrastrar y Colocar)</small> <button id=\"deleteQuestion-" + pregunta + "\" type=\"button\" class=\"btn btn-danger btn-sm deleteButton\"><i class=\"fa fa-trash\" aria-hidden=\"true\"></i></button></h3>";
        var questionType = "<div class=\"form-group\"><input type=\"text\" class=\"form-control\" name=\"inputQuestionType" + pregunta + "\" value=\"4\" hidden></div>";
        var inputQuestion = "<div class=\"form-group\"><label for=\"inputQuestionDragDrop" + pregunta + "\">Enunciado</label><input type=\"text\" class=\"form-control\" id=\"inputQuestionDragDrop" + pregunta + "\" name=\"inputQuestionDragDrop" + pregunta + "\" placeholder=\"La fórmula química del dióxido de carbono es - y la del ozono es -.\" required><small class=\"form-text text-muted\">Escribe un guión (-) donde quieras añadir el espacio en blanco.</small></div>";
        var inputAnswer = "<div class=\"form-group\"><label for=\"inputAnswerDragDrop" + pregunta + "\">Respuesta Correcta</label><input type=\"text\" class=\"form-control\" id=\"inputAnswerDragDrop" + pregunta + "\" name=\"inputAnswerDragDrop" + pregunta + "\" placeholder=\"CO2,O3\" required><small class=\"form-text text-muted\">Escribe las respuestas correctas separadas por coma sin espacios.</small></div>";
        var question = questionTitle + questionType + inputQuestion + inputAnswer;
        var fieldWrapper = $("<div class=\"questionWrapper\" id=\"question" + pregunta + "\"</div>");
        pregunta++;
        fieldWrapper.append(question);
        $(".questions").append(fieldWrapper);
    });

    /* Añadir pregunta de tipo: Relacionar */
    $("#add5").click(function() {
        var questionTitle = "<hr><h3>Pregunta " + pregunta + " <small class=\"text-muted\">(Relacionar)</small> <button id=\"deleteQuestion-" + pregunta + "\" type=\"button\" class=\"btn btn-danger btn-sm deleteButton\"><i class=\"fa fa-trash\" aria-hidden=\"true\"></i></button></h3>";
        var questionType = "<div class=\"form-group\"><input type=\"text\" class=\"form-control\" name=\"inputQuestionType" + pregunta + "\" value=\"5\" hidden></div>";
        var inputTitle = "<div class=\"form-group\"><label for=\"inputTitleRelation" + pregunta + "\">Enunciado</label><input type=\"text\" class=\"form-control\" id=\"inputTitleRelation" + pregunta + "\" name=\"inputTitleRelation" + pregunta + "\" placeholder=\"Relacionar los siguientes términos:\" required><small class=\"form-text text-muted\">Introduce el enunciado de la pregunta.</small></div>";
        var inputQuestion = "<div class=\"form-group\"><label for=\"inputQuestionRelation" + pregunta + "\">Preguntas</label><input type=\"text\" class=\"form-control\" id=\"inputQuestionRelation" + pregunta + "\" name=\"inputQuestionRelation" + pregunta + "\" placeholder=\"Manzana,Rojo,Pera,Melocotón,Amarillo.\" required><small class=\"form-text text-muted\">Introduce las preguntas separadas por coma sin espacios.</small></div>";
        var inputAnswer = "<div class=\"form-group\"><label for=\"inputAnswerRelation" + pregunta + "\">Respuestas</label><input type=\"text\" class=\"form-control\" id=\"inputAnswerRelation" + pregunta + "\" name=\"inputAnswerRelation" + pregunta + "\" placeholder=\"Fruta,Color,Fruta,Fruta,Color.\" required><small class=\"form-text text-muted\">Escribe las respuestas en el mismo orden que las preguntas separadas por coma.</small></div>";
        var question = questionTitle + questionType + inputTitle + inputQuestion + inputAnswer;
        var fieldWrapper = $("<div class=\"questionWrapper\"id=\"question" + pregunta + "\"</div>");
        pregunta++;
        fieldWrapper.append(question);
        $(".questions").append(fieldWrapper);
    });

    /* Eliminar todas las preguntas */
    $("#deleteAll").click(function() {
        pregunta = 1;
        $(".questions").empty();
    });

    /* Impedir que se pueda enviar el formulario sin preguntas */
    $('form').submit(function () {
        if ($('#questionsContainer').find($(".questionWrapper")).length == 0){
            var alertText = "Debe añadir <strong>al menos 1 pregunta</strong> para crear el cuestionario.";
            var alert = "<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">" + alertText + "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button></div>";
            $("#alertEmptyQuestions").append(alert);
            window.scrollTo(0,0);
            return false;
        }
    });

    /* Permitir cerrar una alerta */
    $(".alert").alert()
});

/* Borrar pregunta de manera individual */
$(document).on('click', '.deleteButton', function(){ 
    var questionNumber = $(this)[0].id.split("-")[1];
    var deleteQuestion = "<hr><div class=\"card border-warning\"><div class=\"card-body text-warning\"><h4 class=\"card-title\">Pregunta " + questionNumber + ": Eliminada</h4><p class=\"card-text\">Esta pregunta ha sido eliminada y no será añadida en el cuestionario.</p></div></div>";
    $(this).parent().parent().removeClass("questionWrapper")
    $(this).parent().parent().empty();
    $("#question" + questionNumber).append(deleteQuestion);
});

/* Función que comprueba que el cuestionario tiene título y descripción */
(function () {
    'use strict';

    window.addEventListener('load', function () {
      var form = document.getElementById('needs-validation');
      form.addEventListener('submit', function (event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    }, false);
  })();