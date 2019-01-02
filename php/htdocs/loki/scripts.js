/*$(document).ready(function(){
    $("ul[id*=dropdown-realm] li").click(function(){
        $("#button-realm").html($(this).text() + ' <span class="caret"></span>');
    });
  });  
  var properties = '';
  for (property in obj) {
    properties += '\n' + property;
  }
  alert('Properties of object:' + properties);
*/
$(document).ready(function() {
  $(function () { $('#jstree_demo_div').jstree(); });
  
  $('#jstree_demo_div').on("changed.jstree", function (e, data) {
      console.log(data.selected);
    });
    // 8 interact with the tree - either way is OK
    /*
    $('button').on('click', function () {
      $('#jstree_demo_div').jstree(true).select_node('child_node_1');
      $('#jstree_demo_div').jstree('select_node', 'child_node_1');
      $.jstree.reference('#jstree_demo_div').select_node('child_node_1');
    });
    */
});
var gResists = {};

function realmChange(realm) {
  if (window.XMLHttpRequest) {
    xmlhttp = new XMLHttpRequest();
  } else {
    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
  }
  xmlhttp.onreadystatechange = function() {
    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
      var myObj = jQuery.parseJSON(xmlhttp.responseText);
      var text = "";
      var x;
      for (x in myObj) {
        text += '<option>' + myObj[x] + '</option>';
      }
      $("#select-class").html(text);
      switch(realm) {
        case 'Albion':
          $("#select-race").html("<option>Avalonian</option><option>Briton</option><option>Half Ogre</option><option>Highlander</option><option>Inconnu</option><option>Saracen</option><option>Minotaur</option>");
          $("#panel-skills").html('<div class="panel panel-default"><div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse" onclick="setAquo(this)"href="#col-Parry">Parry &raquo</a></h4></div><div id="col-Parry" class="panel-collapse collapse"><div class="panel-body"><table class="table"><tbody><tr><td><label for="name">Minimum</label></td><td><input style="max-width:100px" type="number" class="form-control" id="min-skil-Parry" value="0" min="0" max="11"></td></tr><tr><td><label for="select-level">Consider</label></td><td><select style="max-width:100px" class="form-control" id="consider-Parry"><option>No</option><option>Yes</option></select></td></tr></tbody></table></div></div></div><div class="panel panel-default"><div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse" onclick="setAquo(this)"href="#col-Shield">Shield &raquo</a></h4></div><div id="col-Shield" class="panel-collapse collapse"><div class="panel-body"><table class="table"><tbody><tr><td><label for="name">Minimum</label></td><td><input style="max-width:100px" type="number" class="form-control" id="min-skil-Shield" value="0" min="0" max="11"></td></tr><tr><td><label for="select-level">Consider</label></td><td><select style="max-width:100px" class="form-control" id="consider-Shield"><option>No</option><option>Yes</option></select></td></tr></tbody></table></div></div></div><div class="panel panel-default"><div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse" onclick="setAquo(this)"href="#col-Crossbow">Crossbow &raquo</a></h4></div><div id="col-Crossbow" class="panel-collapse collapse"><div class="panel-body"><table class="table"><tbody><tr><td><label for="name">Minimum</label></td><td><input style="max-width:100px" type="number" class="form-control" id="min-skil-Crossbow" value="0" min="0" max="11"></td></tr><tr><td><label for="select-level">Consider</label></td><td><select style="max-width:100px" class="form-control" id="consider-Crossbow"><option>No</option><option>Yes</option></select></td></tr></tbody></table></div></div></div><div class="panel panel-default"><div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse" onclick="setAquo(this)"href="#col-Crush">Crush &raquo</a></h4></div><div id="col-Crush" class="panel-collapse collapse"><div class="panel-body"><table class="table"><tbody><tr><td><label for="name">Minimum</label></td><td><input style="max-width:100px" type="number" class="form-control" id="min-skil-Crush" value="0" min="0" max="11"></td></tr><tr><td><label for="select-level">Consider</label></td><td><select style="max-width:100px" class="form-control" id="consider-Crush"><option>No</option><option>Yes</option></select></td></tr></tbody></table></div></div></div><div class="panel panel-default"><div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse" onclick="setAquo(this)"href="#col-Polearm">Polearm &raquo</a></h4></div><div id="col-Polearm" class="panel-collapse collapse"><div class="panel-body"><table class="table"><tbody><tr><td><label for="name">Minimum</label></td><td><input style="max-width:100px" type="number" class="form-control" id="min-skil-Polearm" value="0" min="0" max="11"></td></tr><tr><td><label for="select-level">Consider</label></td><td><select style="max-width:100px" class="form-control" id="consider-Polearm"><option>No</option><option>Yes</option></select></td></tr></tbody></table></div></div></div><div class="panel panel-default"><div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse" onclick="setAquo(this)"href="#col-Slash">Slash &raquo</a></h4></div><div id="col-Slash" class="panel-collapse collapse"><div class="panel-body"><table class="table"><tbody><tr><td><label for="name">Minimum</label></td><td><input style="max-width:100px" type="number" class="form-control" id="min-skil-Slash" value="0" min="0" max="11"></td></tr><tr><td><label for="select-level">Consider</label></td><td><select style="max-width:100px" class="form-control" id="consider-Slash"><option>No</option><option>Yes</option></select></td></tr></tbody></table></div></div></div><div class="panel panel-default"><div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse" onclick="setAquo(this)"href="#col-Thrust">Thrust &raquo</a></h4></div><div id="col-Thrust" class="panel-collapse collapse"><div class="panel-body"><table class="table"><tbody><tr><td><label for="name">Minimum</label></td><td><input style="max-width:100px" type="number" class="form-control" id="min-skil-Thrust" value="0" min="0" max="11"></td></tr><tr><td><label for="select-level">Consider</label></td><td><select style="max-width:100px" class="form-control" id="consider-Thrust"><option>No</option><option>Yes</option></select></td></tr></tbody></table></div></div></div><div class="panel panel-default"><div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse" onclick="setAquo(this)"href="#col-Two-Handed">Two Handed &raquo</a></h4></div><div id="col-Two-Handed" class="panel-collapse collapse"><div class="panel-body"><table class="table"><tbody><tr><td><label for="name">Minimum</label></td><td><input style="max-width:100px" type="number" class="form-control" id="min-skil-Two-Handed" value="0" min="0" max="11"></td></tr><tr><td><label for="select-level">Consider</label></td><td><select style="max-width:100px" class="form-control" id="consider-Two-Handed"><option>No</option><option>Yes</option></select></td></tr></tbody></table></div></div></div>');
          break;
        case 'Hibernia':
          $("#select-race").html("<option>Celt</option><option>Elf</option><option>Firbolg</option>");
          $("#panel-skills").html('<div class="panel panel-default"><div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse" onclick="setAquo(this)"href="#col-Arboreal-Path">Arboreal Path &raquo</a></h4></div><div id="col-Arboreal-Path" class="panel-collapse collapse"><div class="panel-body"><table class="table"><tbody><tr><td><label for="name">Minimum</label></td><td><input style="max-width:100px" type="number" class="form-control" id="min-skil-Arboreal-Path" value="0" min="0" max="11"></td></tr><tr><td><label for="select-level">Consider</label></td><td><select style="max-width:100px" class="form-control" id="consider-Arboreal-Path"><option>No</option><option>Yes</option></select></td></tr></tbody></table></div></div></div><div class="panel panel-default"><div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse" onclick="setAquo(this)"href="#col-Creeping-Path">Creeping Path &raquo</a></h4></div><div id="col-Creeping-Path" class="panel-collapse collapse"><div class="panel-body"><table class="table"><tbody><tr><td><label for="name">Minimum</label></td><td><input style="max-width:100px" type="number" class="form-control" id="min-skil-Creeping-Path" value="0" min="0" max="11"></td></tr><tr><td><label for="select-level">Consider</label></td><td><select style="max-width:100px" class="form-control" id="consider-Creeping-Path"><option>No</option><option>Yes</option></select></td></tr></tbody></table></div></div></div><div class="panel panel-default"><div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse" onclick="setAquo(this)"href="#col-Verdant-Path">Verdant Path &raquo</a></h4></div><div id="col-Verdant-Path" class="panel-collapse collapse"><div class="panel-body"><table class="table"><tbody><tr><td><label for="name">Minimum</label></td><td><input style="max-width:100px" type="number" class="form-control" id="min-skil-Verdant-Path" value="0" min="0" max="11"></td></tr><tr><td><label for="select-level">Consider</label></td><td><select style="max-width:100px" class="form-control" id="consider-Verdant-Path"><option>No</option><option>Yes</option></select></td></tr></tbody></table></div></div></div>');
          break;
        case 'Midgard':
          $("#select-race").html("<option>Dwarf</option><option>Norseman</option><option>Kobold</option><option>Troll</option><option>Valkyn</option><option>Minotaur</option>");
          $("#panel-skills").html('<div class="panel panel-default"><div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse" onclick="setAquo(this)"href="#col-Axe">Axe &raquo</a></h4></div><div id="col-Axe" class="panel-collapse collapse"><div class="panel-body"><table class="table"><tbody><tr><td><label for="name">Minimum</label></td><td><input style="max-width:100px" type="number" class="form-control" id="min-skil-Axe" value="0" min="0" max="11"></td></tr><tr><td><label for="select-level">Consider</label></td><td><select style="max-width:100px" class="form-control" id="consider-Axe"><option>No</option><option>Yes</option></select></td></tr></tbody></table></div></div></div><div class="panel panel-default"><div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse" onclick="setAquo(this)"href="#col-Hammer">Hammer &raquo</a></h4></div><div id="col-Hammer" class="panel-collapse collapse"><div class="panel-body"><table class="table"><tbody><tr><td><label for="name">Minimum</label></td><td><input style="max-width:100px" type="number" class="form-control" id="min-skil-Hammer" value="0" min="0" max="11"></td></tr><tr><td><label for="select-level">Consider</label></td><td><select style="max-width:100px" class="form-control" id="consider-Hammer"><option>No</option><option>Yes</option></select></td></tr></tbody></table></div></div></div><div class="panel panel-default"><div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse" onclick="setAquo(this)"href="#col-Left-Axe">Left Axe &raquo</a></h4></div><div id="col-Left-Axe" class="panel-collapse collapse"><div class="panel-body"><table class="table"><tbody><tr><td><label for="name">Minimum</label></td><td><input style="max-width:100px" type="number" class="form-control" id="min-skil-Left-Axe" value="0" min="0" max="11"></td></tr><tr><td><label for="select-level">Consider</label></td><td><select style="max-width:100px" class="form-control" id="consider-Left-Axe"><option>No</option><option>Yes</option></select></td></tr></tbody></table></div></div></div><div class="panel panel-default"><div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse" onclick="setAquo(this)"href="#col-Parry">Parry &raquo</a></h4></div><div id="col-Parry" class="panel-collapse collapse"><div class="panel-body"><table class="table"><tbody><tr><td><label for="name">Minimum</label></td><td><input style="max-width:100px" type="number" class="form-control" id="min-skil-Parry" value="0" min="0" max="11"></td></tr><tr><td><label for="select-level">Consider</label></td><td><select style="max-width:100px" class="form-control" id="consider-Parry"><option>No</option><option>Yes</option></select></td></tr></tbody></table></div></div></div><div class="panel panel-default"><div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse" onclick="setAquo(this)"href="#col-Sword">Sword &raquo</a></h4></div><div id="col-Sword" class="panel-collapse collapse"><div class="panel-body"><table class="table"><tbody><tr><td><label for="name">Minimum</label></td><td><input style="max-width:100px" type="number" class="form-control" id="min-skil-Sword" value="0" min="0" max="11"></td></tr><tr><td><label for="select-level">Consider</label></td><td><select style="max-width:100px" class="form-control" id="consider-Sword"><option>No</option><option>Yes</option></select></td></tr></tbody></table></div></div></div> ');
          break;
      }
    }
  }
  xmlhttp.open("GET", "getClasses.php?q=" + realm, true);
  xmlhttp.send();
};

function classChange(classe) {
  if (window.XMLHttpRequest) {
    xmlhttp = new XMLHttpRequest();
  } else {
    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
  }
  xmlhttp.onreadystatechange = function() {
    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
      var myObj = jQuery.parseJSON(xmlhttp.responseText);
      var text = "";
      var x;
      for (x in myObj) {
        text += '<option>' + myObj[x] + '</option>';
      }
      $("#select-race").html(text);
      getSkills(classe);
    }
  }
  xmlhttp.open("GET", "getRaces.php?q=" + classe + "&r=" + $("#select-realm option:selected").text(), true);
  xmlhttp.send();
};

function getSkills(classe) {
  if (window.XMLHttpRequest) {
    xmlhttp = new XMLHttpRequest();
  } else {
    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
  }
  xmlhttp.onreadystatechange = function() {
    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
      var myObj = jQuery.parseJSON(xmlhttp.responseText);
      var text = "";
      var x;
      for (x in myObj) {
        text += myObj[x];
      }
      $("#panel-skills").html(text);
    }
  }
  xmlhttp.open("GET", "getSkills.php?q=" + classe + "&r=" + $("#select-realm option:selected").text(), true);
  xmlhttp.send();
};

function levelChange(level) {
  $("[id^=min-]").val('0');
  $("[id^=min-stat-]").attr("max", Number(level) + Math.floor(level / 2) + 2 * ((Math.floor(level / 2)) + 1));
  $("[id^=min-resi-]").attr("max", Math.floor(level / 2) + 1);
  $("[id^=min-skil-]").attr("max", Math.floor(level / 5) + 1);
  $("[id^=min-toab-Arcane-Siphon]").attr("max", Math.floor(level / 2));
  $("[id^=min-toab-Debuff-Effectiveness]").attr("max", Math.floor(level / 2));
  $("[id^=min-toab-Buff-Effectiveness]").attr("max", Math.floor(level / 2));
  $("[id^=min-toab-Healing-Effectiveness]").attr("max", Math.floor(level / 2));
  $("[id^=min-toab-Spell-Duration]").attr("max", Math.floor(level / 2));
  $("[id^=min-toab-Fatigue]").attr("max", Math.floor(level / 2));
  $("[id^=min-toab-Armour-Factor]").attr("max", Number(level));
  $("[id^=min-toab-Death-XP-Loss]").attr("max", Number(level));
  $("[id^=min-toab-Power-Pool]").attr("max", Number(level) + Math.floor(level / 2));
  $("[id^=min-toab-Casting-Speed]").attr("max", Math.floor(level / 5));
  $("[id^=min-toab-Spell-Range]").attr("max", Math.floor(level / 5));
  $("[id^=min-toab-Spell-Damage]").attr("max", Math.floor(level / 5));
  $("[id^=min-toab-Style-Damage]").attr("max", Math.floor(level / 5));
  $("[id^=min-toab-Melee-Damage]").attr("max", Math.floor(level / 5));
  $("[id^=min-toab-Melee-Combat-Speed]").attr("max", Math.floor(level / 5));
  $("[id^=min-toab-Resist-Pierce]").attr("max", Math.floor(level / 5));
};

function setAquo(obj) {
  if (obj.text.charAt(obj.text.length - 1) == "«") {
    $(obj).text(obj.text.replace("«", "»"));
  } else {
    $(obj).text(obj.text.replace("»", "«"));
  }
};

function onBlurInput(obj) {
  var value = Number($(obj).val());
  var max = $(obj).attr('max');
  if (typeof(value) != "number") {
    $(obj).val("0");
  } else {
    if (value > max) {
      $(obj).val(max);
    } else {
      if (value < 0) {
        $(obj).val("0");
      } else {
        $(obj).val(Math.floor(value));
      }
    }
  }
  //
};
/*
function toggle() {
  var ele = document.getElementById("toggleText");
  --------------var text = document.getElementById("displayText");
  if(ele.style.display == "block") {
        ele.style.display = "none";
    -------------text.innerHTML = "show";
    }
  else {
    ele.style.display = "block";
    ---------------text.innerHTML = "hide";
  }
};
*/
function addToBR(obj, type, name) {
  //                  stat  stregth
  //if (type == "stat") {
    var ele = document.getElementById("BR-" + type + "-" + name);
  //}
  if ($(obj).val() == 'Yes') {
    ele.style.display = "block";
  } else {
    ele.style.display = "none";
  }
};
