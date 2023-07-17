$(document).ready(function(){
    window.addEventListener('message', function(event) {
        var data = event.data;
        $(".container-fluid").css("display",data.show? "none":"block");
		$("#inventory").html(data.inventory + "/25kg");
        $("#voice").html(data.voice);
        $("#fuel").html(data.fuel);
        $("#thirst").html(Math.round(data.thirst/10000));
        $("#hunger").html(Math.round(data.hunger/10000));

        if (data.speaking) {
            $("#circle-voice").css("background-color", "rgba(26, 234, 16, 0.5)")
        } else {
            $("#circle-voice").css("background-color", "rgba(0, 0, 0, 0.5)")
        }

        if (data.showfuel) {
            $("#fuelbar").show()
            $("#fuel").html(data.fuel);
        } else {
            $("#fuelbar").hide()
        }
    });
});