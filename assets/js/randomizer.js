// Found don't know where 

$(document).ready(function(){
    //hide all divs just for the purpose of this example, 
    //you should have the divs hidden with your css
    $('#hide1').hide();
    $('#hide2').hide();
    $('#hide3').hide();
    $('#hide4').hide();
    //check if the cookie is already setted
    if ($.cookie("currentDiv")===undefined){
            $.cookie("currentDiv",1);
    }else{ //else..well 
            //get and increment value, let's suppse we have just 3 divs     

            var numValue = parseInt($.cookie("currentDiv"));
            numValue = numValue + 1;
            if (numValue>4){
            //restart to 1
                $.cookie("currentDiv",1);
            }
            else{ //no issues, assign the incremented value
                $.cookie("currentDiv",numValue.toString());
            }

            //show the div
            $('#hide'+$.cookie("currentDiv")).show();
    }
});