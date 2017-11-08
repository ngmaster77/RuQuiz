$(document).ready(function() {
    console.log("jquery ok")
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
    });
    $("#add2").click(function() {
        console.log("añadiendo verdadero o falso");
    });
    $("#add3").click(function() {
        console.log("añadiendo verdadero o falso");
    });
});
/*
<hr>
<h3>Pregunta 1</h3>
<hr>
*/