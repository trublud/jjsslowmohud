var closed = true;
var closep = true;
var lastData = {};
var titlesize = 1.35;
var officersize = 1.3;
var currentAction = null;
var potopen = false
$(document).ready(() => {
	  $(".Plant-hud").hide();
	   $(".container-plant").slideUp();
	// $(document).on("click", function () {
		 //	   $(".Plant-hud").show();
	 //  $(".container-plant").slideDown();
			
   // DragAble();
	//  });
  $(document).on("input change", "#increase-size", function () {
    lastData.size = $(this).val();
    lastData.title = Math.abs(titlesize * $(this).val());
    lastData.titlep = Math.abs(titlesize * $(this).val());
    lastData.officer = Math.abs(officersize * $(this).val());
    $(".titlep").css("font-size", `${lastData.title}rem`);
    $(".title").css("font-size", `${lastData.titlep}rem`);
    $(".player").css("font-size", `${lastData.me}rem`);
    $(".officer").css("font-size", `${lastData.officer}rem`);
    $(".officer me").css("font-weight", "bold");
  });

  $(document).on("input", "#opacity", function () {
    lastData.opacity = $(this).val();
    ChangeBackGround($(this).val());
  });

  $(".restore-btn").on("click", function () {
    lastData = {};
    ChangeBackGround("0.1");
    $(".officer").css("font-size", `1.3rem`);
    $(".title").css("font-size", `1.35rem`);
    $(".titlep").css("font-size", `1.35rem`);
    $(".range-inputes input").val("contrast");
    $(".player").css("font-size", `1.3rem`);
  });

  $(".options-btns").on("click", ".options-btn", function () {
    currentAction = $(this).data("action");
    SetRightInput(currentAction);
  });

  $(".inputs-id").on("click", ".save-btn", function () {
    if (currentAction == null) {
      $(".inputs-id #err-text").text("Please select an action");
      return;
    } else if (currentAction == "remove") {
      if ($("#id").val() == "")
        $(".inputs-id #err-text").text("The input can not be empty!");
      else SendData(null);
    } else {
      if ($("#code").val() == "" || $("#id").val() == "")
        $(".inputs-id #err-text").text("The inputs can not be empty!");
      else SendData($("#code").val());
    }
  });

  //  $(".range-bar").prop('disabled', closed);
  SwitchPages();
  DragAble();
  Close();
});

window.addEventListener("message", e => {
  if (e.data.action == "open") {
    $("#opacity").val(1);
    if (lastData.opacity) {
      $("#opacity").val(lastData.opacity);
    } else if (lastData.size) {
      $("#increase-size").val(lastData.size);
    }
    $(".warrper").show(500);
    $(".settings-container").slideDown();
	  
	  
	  
	     } else if (e.data.action == "plantopen") {
         if (potopen){
         
          $(".Plant-hud").hide();
          $(".container-plant").slideUp();
           potopen = false
         }else{
           var msg = e.data.data;
        
           			   $(".Plant-hud").show();
	   $(".container-plant").slideDown();
     if (msg.growth < 100) {
      document.getElementById('Harvest-btn').style.visibility = 'hidden';
     } 
   
			potopen = true
      //$(".statph").text(`test`);
      $(".statph").text(msg.ph );
      $(".stattds").text(msg.tds);
      $(".statwaterage").text(msg.waterage);
      $(".stattemp").text(msg.temp);
      $(".stathumidity").text(msg.humidity);
      $(".statage").text(msg.age);
      $(".stathealth").text(msg.health);
      $(".Plant-hud").text(msg.type + ' - ' + msg.growth + ' %');
       
    DragAble();
			        }
  } else if (e.data.action == "plantstats") {
   // $(".Plant-hud").show();
//$(".container-plant").slideDown();
 //DragAble();	 
 var msg = e.data.data;
 if (msg.growth < 100) {
  document.getElementById('Harvest-btn').style.visibility = 'hidden';
   document.getElementById('Water-btn').style.visibility = 'visible';
	 document.getElementById('Feed-btn').style.visibility = 'visible';
     document.getElementById('Lights-btn').style.visibility = 'visible';
     document.getElementById('phup-btn').style.visibility = 'visible';
     document.getElementById('phdown-btn').style.visibility = 'visible';
     document.getElementById('Humidity-btn').style.visibility = 'visible';
     document.getElementById('Fans-btn').style.visibility = 'visible';
     document.getElementById('Chgwater-btn').style.visibility = 'visible';
 }else{
  document.getElementById('Harvest-btn').style.visibility = 'visible';
  document.getElementById('Water-btn').style.visibility = 'hidden';
  document.getElementById('Feed-btn').style.visibility = 'hidden';
    document.getElementById('Lights-btn').style.visibility = 'hidden';
    document.getElementById('phup-btn').style.visibility = 'hidden';
    document.getElementById('phdown-btn').style.visibility = 'hidden';
    document.getElementById('Humidity-btn').style.visibility = 'hidden';
    document.getElementById('Fans-btn').style.visibility = 'hidden';
    document.getElementById('Chgwater-btn').style.visibility = 'hidden';
 } 
 //$(".statph").text(`test`);
 $(".statlight").text(msg.light + ' %');
 $(".statair").text(msg.air + ' %');
 $(".statph").text(msg.ph );
 $(".stattds").text(msg.tds + ' ppm');
 $(".statwaterage").text(msg.waterage + ' days');
 $(".stattemp").text(msg.temp + ' %');
 $(".stathumidity").text(msg.humidity + ' %');
 $(".statage").text(msg.age+ ' days');
 $(".stathealth").text(msg.health);
 $(".Plant-hud").text(msg.type + ' - ' + msg.growth + ' %');
	  
  } else if (e.data.action == "hidehud") {
    $(".active-hud").slideUp();
  // $(".active-hud").slideDown();
  } else if (e.data.action == "hidenotify") {
    $(".active-officers").slideUp();
   
  } else if (e.data.action == "notify") {
    $(".officers-container").html("");
    var msg = e.data.data;
    $(".titlep span").text(``);

    html = `
            <div class="officer">
            <span class="tag">-</span> ${msg} <span class="tag">-</span>
        </div>`;

    $(".officers-container").append(html);

    $(".active-officers").slideDown();
    DragAble();
    $(".titlep").css("font-size", `${lastData.title}rem`);
    $(".title").css("font-size", `${lastData.titlep}rem`);
    $(".player").css("font-size", `${lastData.officer}rem`);
    $(".officer").css("font-size", `${lastData.officer}rem`);
    $(".officer me").css("font-weight", "bold");
  } else if (e.data.action == "showmehud") {
    $(".active-hud").slideDown();
  } else if (e.data.action == "hidemehud") {
    $(".active-hud").slideUp();
  } else if (e.data.action == "showhud") {
    $(".officers-hud").html("");

    $(".active-hud").slideDown();
    
  
  } else if (e.data.action == "paddme") {
   
    $(".officers-hud").html("");
    var officer = e.data.data[0];
    $(".title span").text(`JJs Cool Hud `);

    var html;
    if (officer.visible) {
      html = `
         <div class="player">
         <span class="tag">${officer.name} </span> | Visible 💹|  ❤️${officer.life} | ${officer.data1} | 🛡️${officer.data3}  |  <span class="tag">${officer.data4}  </span>  
         </div>`;
    } else {
      html = `
         <div class="player">
         <span class="tag"> ${officer.name} </span> ❤️${officer.life} | ${officer.data1} | 🛡️${officer.data3}  |  <span class="tag">${officer.data4} </span> 
         </div>`;
    }

    $(".officers-hud").append(html);

   
    DragAble();
    $(".titlep").css("font-size", `${lastData.title}rem`);
    $(".title").css("font-size", `${lastData.titlep}rem`);
    $(".player").css("font-size", `${lastData.officer}rem`);
    $(".officer").css("font-size", `${lastData.officer}rem`);
    $(".officer me").css("font-weight", "bold");
  } else if (e.data.action == "error") {
    $(".inputs-id #err-text").text(e.data.errorText);
  } else if (e.data.action == "update") {
    $(".officers-container").html("");
    var officers = e.data.data;
    $(".titlep span").text(`JJs CoolHud | Online: (${officers.length})`);
    for (var officer of officers) {
      var html;

      if (officer.visible) {
        html = `
            <div class="officer">
            <span class="tag">${officer.name} </span> | Visible 💹 | ❤️ ${officer.life} | ${officer.data1} | ${officer.data3} |  <span class="tag">${officer.data4}</span> 
  </div>`;
		  
		  
		  
		  
		  
		  
		  
		
			   
			   
			   
			   
		   
		
		
		
		
		
		
		
		
      } else {
        html = `
            <div class="officer">
            <span class="tag"> ${officer.name} </span> ❤️ ${officer.life} | ${officer.data1} | ${officer.data3} |  <span class="tag">${officer.data4}  </span> 
        </div>`;
      }
      $(".officers-container").append(html);
    }
    DragAble();
    $(".titlep").css("font-size", `${lastData.title}rem`);
    $(".title").css("font-size", `${lastData.titlep}rem`);
    $(".player").css("font-size", `${lastData.officer}rem`);
    $(".officer").css("font-size", `${lastData.officer}rem`);
    $(".officer me").css("font-weight", "bold");
  }
});

function toggleplayer() {
  closep = !closep;
   $(".range-bar").prop('disabled', !closep);
  if (!closep) $(".active-officers").slideUp();
  if (closep) $(".active-officers").slideDown();
    $.post('https://jjsslowmohud/ToggleOpenPlayerlist',JSON.stringify({toggleplayer : true}))
}
function toggleuser() {
  closed = !closed;
   $(".range-bar").prop('disabled', !closed);
  if (!closed) $(".active-hud").slideUp();
  if (closed) $(".active-hud").slideDown();
    $.post('https://jjsslowmohud/ToggleOpenUser',JSON.stringify({toggleuser : true}))
}

function Close() {
  $("#close-del").on("click", function () {
    currentAction = null;
    $("input").val("");
    $(".warrper").hide();
    $(".settings-container").slideUp();
    $.post("https://jjsslowmohud/close", JSON.stringify({}));
    closed = false;
    closep = false;
  });
}

function SetRightInput(action) {
  if (action == "remove") {
    $("#code").hide();
  } else {
    $("#code").show();
  }
}

function SendData(code) {
  var data = {
    action: currentAction,
    id: $("#id").val(),
    code: code,
  };
  $(".inputs-id #err-text").text("");
  $.post("http://jjsslowmohud/action", JSON.stringify({ data: data }));
}

function ChangeBackGround(val) {
  $(".active-officers").css("background-color", `rgba(0,0,0,${val})`);
  $(".active-hud").css("background-color", `rgba(0,0,0,${val})`);
  $(".title").css(
    "background-color",
    `rgba(0,0,0,${addbits(val + 0.02 * 0.1)})`
  );
  $(".titlep").css(
    "background-color",
    `rgba(0,0,0,${addbits(val + 0.02 * 0.1)})`
  );
}

function addbits(s) {
  var total = 0,
    s = s.match(/[+\-]*(\.\d+|\d+(\.\d+)?)/g) || [];

  while (s.length) {
    total += parseFloat(s.shift());
  }
  return total;
}

function DragAble() {
  $(".active-officers").draggable({
    appendTo: "body",
    containment: "window",
    scroll: true,
 });
  $(".container-plant").draggable({
    appendTo: "body",
    containment: "window",
    scroll: false,
  });
  $(".active-hud").draggable({
    appendTo: "body",
    containment: "window",
    scroll: false,
  });
}
function Fansplant() {
  $.post('https://jjsslowmohud/Feedplant',JSON.stringify({action : 'air'}))
}
function Waterplant() {
  $.post('https://jjsslowmohud/Feedplant',JSON.stringify({action : 'water'}))
}
function Lightsplant() {
  $.post('https://jjsslowmohud/Feedplant',JSON.stringify({action : 'light'}))
}
function Destroyplant() {
  $.post('https://jjsslowmohud/Feedplant',JSON.stringify({action : 'destroy'}))
  $(".Plant-hud").hide();
  $(".container-plant").slideUp();
   potopen = false
   $.post("https://jjsslowmohud/close", JSON.stringify({}));
}
function Harvestplant() {
  $.post('https://jjsslowmohud/Feedplant',JSON.stringify({action : 'harvest'}))
  $(".Plant-hud").hide();
  $(".container-plant").slideUp();
   potopen = false
   $.post("https://jjsslowmohud/close", JSON.stringify({}));
}
function Humidityplant() {
  $.post('https://jjsslowmohud/Feedplant',JSON.stringify({action : 'humidity'}))
}
function Feedplant() {
  $.post('https://jjsslowmohud/Feedplant',JSON.stringify({action : 'feed'}))
}
function phup() {
  $.post('https://jjsslowmohud/Feedplant',JSON.stringify({action : 'phup'}))
}
function phdown() {
  $.post('https://jjsslowmohud/Feedplant',JSON.stringify({action : 'phdown'}))
}
function NewWaterplant() {
  $.post('https://jjsslowmohud/Feedplant',JSON.stringify({action : 'NewWaterplant'}))
}
function SwitchPages() {
  $(".slide-btnRight").on("click", function () {
    $(".page-1").fadeIn(200);
    $(".inputs-id").fadeOut(250);
    $(".settings-container-header span").text("Personal Settings");
  });
}

$(document).keyup(function (e) {
 
    if ( e.keyCode == 27) {
    potopen =false
    currentAction = null;
    $("input").val("");
    $(".warrper").hide();
    $(".settings-container").slideUp();
	   $(".Plant-hud").hide();
	   $(".container-plant").slideUp();
    $.post("https://jjsslowmohud/close", JSON.stringify({}));
    closed = false;
    closep = false;
  }
});
