<?
  function printStat($stat) {
    $max = 127;
    if ($stat == "Hits") {
      $max = 400;
    }
    if ($stat == "Power") {
      $max = 75;
    }
    return '<div class="panel panel-default"><div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse" onclick="setAquo(this)"href="#col-' . $stat . '">' . $stat . ' &raquo</a></h4></div><div id="col-' . $stat . '" class="panel-collapse collapse"><div class="panel-body"><table class="table"><tbody><tr><td><label for="name">Minimum</label></td><td><input style="max-width:100px" type="number" class="form-control" id="min-stat-' . $stat . '" value="0" min="0" max="' . $max . '" onblur="onBlurInput(this)"></td></tr><tr><td><label for="select-level">Consider</label></td><td><select style="max-width:100px" class="form-control" id="consider-stat-' . $stat . '" onChange="addToBR(this,' . "'Statistic','" . $stat . "'" . ')"><option>No</option><option>Yes</option></select></td></tr></tbody></table></div></div></div>';
  }
  
  function printRes($resi) {
    $max = 26;
    return '<div class="panel panel-default"><div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse" onclick="setAquo(this)"href="#col-r-' . $resi . '">' . $resi . ' &raquo</a></h4></div><div id="col-r-' . $resi . '" class="panel-collapse collapse"><div class="panel-body"><table class="table"><tbody><tr><td><label for="name">Minimum</label></td><td><input style="max-width:100px" type="number" class="form-control" id="min-resi-' . $resi . '" value="0" min="0" max="' . $max . '" onblur="onBlurInput(this)"></td></tr><tr><td><label for="select-level">Consider</label></td><td><select style="max-width:100px" class="form-control" id="consider-res-' . $resi . '"><option>No</option><option>Yes</option></select></td></tr></tbody></table></div></div></div>';
  }
  
  function printSkill($skil) {
    $max = 11;
    $skim = str_replace(array(" ", "'"), "-", $skil);
    return '<div class="panel panel-default"><div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse" onclick="setAquo(this)"href="#col-' . $skim . '">' . $skil . ' &raquo</a></h4></div><div id="col-' . $skim . '" class="panel-collapse collapse"><div class="panel-body"><table class="table"><tbody><tr><td><label for="name">Minimum</label></td><td><input style="max-width:100px" type="number" class="form-control" id="min-skil-' . $skim . '" value="0" min="0" max="' . $max . '" onblur="onBlurInput(this)"></td></tr><tr><td><label for="select-level">Consider</label></td><td><select style="max-width:100px" class="form-control" id="consider-skill-' . $skim . '"><option>No</option><option>Yes</option></select></td></tr></tbody></table></div></div></div>';
  }
  
  function printTOA($toab) {
    $max = 0;
    switch ($toab) {
      case "Arcane Siphon":
      case "Debuff Effectiveness":
      case "Buff Effectiveness":
      case "Healing Effectiveness":
      case "Spell Duration":
      case "Fatigue":
        $max = 25;
        break;
      case "Armour Factor":
      case "Death XP Loss":
        $max = 50;
        break;
      case "Power Pool":
        $max = 75;
        break;
      default:
        $max = 10;
    }
    $toam = str_replace(" ", "-", $toab);
    return '<div class="panel panel-default"><div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse" onclick="setAquo(this)"href="#col-' . $toam . '">' . $toab . ' &raquo</a></h4></div><div id="col-' . $toam . '" class="panel-collapse collapse"><div class="panel-body"><table class="table"><tbody><tr><td><label for="name">Minimum</label></td><td><input style="max-width:100px" type="number" class="form-control" id="min-toab-' . $toam . '" value="0" min="0" max="' . $max . '" onblur="onBlurInput(this)"></td></tr><tr><td><label for="select-level">Consider</label></td><td><select style="max-width:100px" class="form-control" id="consider-toa-' . $toam . '"><option>No</option><option>Yes</option></select></td></tr></tbody></table></div></div></div>';
  }
?>