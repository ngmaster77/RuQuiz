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
        console.log("añadiendo verdadero o falso");
        var questionNumber = $("<hr><h3>Pregunta " + pregunta + "</h3>");
        pregunta++;
        $(".questions").append(questionNumber);
    });
    $("#add2").click(function() {
        console.log("añadiendo completar");
        var questionNumber = $("<hr><h3>Pregunta " + pregunta + "</h3>");
        pregunta++;
        
        $(".questions").append(questionNumber);
    });
    $("#add3").click(function() {
        console.log("añadiendo verdadero o falso");
        var questionNumber = $("<hr><h3>Pregunta " + pregunta + "</h3>");
        pregunta++;
        $(".questions").append(questionNumber);
    });
});
/*
<hr>
<h3>Pregunta 1</h3>
<hr>
*/