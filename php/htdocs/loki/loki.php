<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="dark age of camelot online template maker">
    <meta name="author" content="simone celia">
    <!-- link rel="icon" href="../../favicon.ico"-->
    <title>Online-Loki</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <!--link rel="stylesheet" href="main.css"-->
    <!--link rel="stylesheet" href="bootstrap.min.css"-->
    
    <link rel="stylesheet" href="dist/themes/default/style.min.css" />
  </head>
  <body role="document">
    <!-- Fixed navbar  -->
    <? require_once 'navbar.php';?>
    <!-- Jumbotron     -->
    <? require_once 'jumbotron.php';?>
    <!-- PHP-Scripts   -->
    <? require_once 'scripts.php';?>
    <div class="container-fluid">
      <div class="row">
         <!-- Configuration -->
        <div class="col-lg-3">
          <h2>Configuration</h2>
          <div class="panel-group">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h4 class="panel-title">
                  <a data-toggle="collapse" href="#collapse-Character" onclick="setAquo(this)">Character &laquo</a>
                </h4>
              </div>
              <div id="collapse-Character" class="panel-collapse collapse in">
                <div class="panel-body">
                  <form role="form">
                    <div class="form-group">
                      <div class="table-responsive">
                        <table class="table">
                          <tbody>
                            <tr>
                              <td>
                                <label for="name">Name</label>
                              </td>
                              <td>
                                <input type="text" class="form-contrl" id="name" placeholder="Enter character name">
                              </td>
                            </tr>
                          </tbody>
                            <tr>
                              <td>
                                <label for="select-realm">Realm</label>
                              </td>
                              <td>
                                <select class="form-control" id="select-realm" onchange="realmChange(this.value)">
                                  <option>Midgard</option>
                                  <option>Hibernia</option>
                                  <option>Albion</option>
                                </select>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <label for="select-class">Class</label>
                              </td>
                              <td>
                                <select class="form-control" id="select-class" onchange="classChange(this.value)">
                                  <option>Berserker</option>
                                  <option>Bonedancer</option>
                                  <option>Healer</option>
                                  <option>Hunter</option>
                                  <option>Runemaster</option>
                                  <option>Savage</option>
                                  <option>Shadowblade</option>
                                  <option>Shaman</option>
                                  <option>Skald</option>
                                  <option>Spiritmaster</option>
                                  <option>Thane</option>
                                  <option>Valkyrie</option>
                                  <option>Warlock</option>
                                  <option>Warrior</option>
                                  <option>Mauler</option>
                                </select>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <label for="select-race">Race</label>
                              </td>
                              <td>
                                <select class="form-control" id="select-race">
                                  <option>Dwarf</option>
                                  <option>Norseman</option>
                                  <option>Kobold</option>
                                  <option>Troll</option>
                                  <option>Valkyn</option>
                                  <option>Minotaur</option>
                                </select>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <label for="select-level">Level</label>
                              </td>
                              <td>
                                <select class="form-control" id="select-level" onchange="levelChange(this.value)">
                                  <? for ($i = 50; $i > 0; $i--) { echo("<option>" . $i . "</option>"); }?>
                                </select>
                              </td>
                            </tr>
                        </table>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
              <div id="jstree_demo_div">
              
               <!-- in this example the tree is populated from inline HTML -->
               <ul>
                <li id="tree-Dual-Wield">Dual Wield
                  <ul>
                    <li id="tree-Statistic">Statistic</li>
                    <li id="tree-Resistance">Resistance</li>
                  </ul>
                </li>
                <!--li>Root node 2</li-->
              </ul>
              
              
              
              
              
              
              
              </div>
              <!--div class="panel panel-default">
                <div class="panel-heading">
                  <h4 class="panel-title">
                    <a data-toggle="collapse" href="#col-dual-wield" onclick="setAquo(this)">Dual Wield &laquo</a>
                  </h4>
                </div>
                <div id="col-dual-wield" class="panel-collapse collapse in">
                  <div class="panel-body">
                    <div class="panel-group">
                      <!--statistiche--
                      <div class="panel panel-default">
                        <div class="panel-heading">
                          <h4 class="panel-title">
                            <a data-toggle="collapse" href="#col-statistic" onclick="setAquo(this)">Statistic &raquo</a>
                          </h4>
                        </div>
                        <div id="col-statistic" class="panel-collapse collapse">
                          <div class="panel-body">
                            <div class="panel-group">
                              < echo printStat("Strength");
                                 echo printStat("Constitution");
                                 echo printStat("Dexterity");
                                 echo printStat("Quickness");
                                 echo printStat("Intelligence");
                                 echo printStat("Piety");
                                 echo printStat("Charisma");
                                 echo printStat("Empathy");
                                 echo printStat("Hits");
                                 echo printStat("Power");
                               ?>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!--resistenze--
                      <div class="panel panel-default">
                        <div class="panel-heading">
                          <h4 class="panel-title">
                            <a data-toggle="collapse" href="#col-resistance" onclick="setAquo(this)">Resistance &raquo</a>
                          </h4>
                        </div>
                        <div id="col-resistance" class="panel-collapse collapse">
                          <div class="panel-body">
                            < echo printRes("Body");
                               echo printRes("Cold");
                               echo printRes("Heat");
                               echo printRes("Energy");
                               echo printRes("Matter");
                               echo printRes("Spirit");
                               echo printRes("Crush");
                               echo printRes("Thrust");
                               echo printRes("Slash");
                            ?>
                          </div>
                        </div>
                      </div>
                      <!--skills--
                      <div class="panel panel-default">
                        <div class="panel-heading">
                          <h4 class="panel-title">
                            <a data-toggle="collapse" href="#col-skill" onclick="setAquo(this)">Skill &raquo</a>
                          </h4>
                        </div>
                        <div id="col-skill" class="panel-collapse collapse">
                          <div class="panel-body" id="panel-skills">
                            < echo printSkill("Axe");
                               echo printSkill("Hammer");
                               echo printSkill("Left Axe");
                               echo printSkill("Parry");
                               echo printSkill("Sword");
                            ?>
                          </div>
                        </div>
                      </div>
                      <!--toa bonus--
                      <div class="panel panel-default">
                        <div class="panel-heading">
                          <h4 class="panel-title">
                            <a data-toggle="collapse" href="#col-toa" onclick="setAquo(this)">TOA Bonus &raquo</a>
                          </h4>
                        </div>
                        <div id="col-toa" class="panel-collapse collapse">
                          <div class="panel-body" id="panel-skills">
                            < echo printTOA("Arcane Siphon");
                               echo printTOA("Armour Factor");
                               echo printTOA("Power Pool");
                               echo printTOA("Debuff Effectiveness");
                               echo printTOA("Buff Effectiveness");
                               echo printTOA("Healing Effectiveness");
                               echo printTOA("Spell Duration");
                               echo printTOA("Casting Speed");
                               echo printTOA("Spell Range");
                               echo printTOA("Spell Damage");
                               echo printTOA("Style Damage");
                               echo printTOA("Melee Damage");
                               echo printTOA("Melee Combat Speed");
                               echo printTOA("Fatigue");
                               echo printTOA("Resist Pierce");
                               echo printTOA("Death XP Loss");
                            ?>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>fine-->
            </div>
          </div>
        </div>
        <!-- Gear          -->
        <div class="col-lg-3">
          <h2>Gear</h2>
        </div>
        <!-- Item          -->
        <div class="col-lg-4">
          <h2>Item</h2>
        </div>
        <!-- Build Results -->
        <div class="col-lg-2">
          <h2>Build Results</h2>
          <!---->
          <div class="panel-group">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h4 class="panel-title">
                  <a data-toggle="collapse" href="#collapse-br-Dual-Wield" onclick="setAquo(this)">Dual Wield &laquo</a>
                </h4>
              </div>
              <div id="collapse-br-Dual-Wield" class="panel-collapse collapse in">
                <div class="panel-body">

<div class="panel-group" id="BR-Statistic">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" href="#collapse-br-Statistic" onclick="setAquo(this)">Statistic &laquo</a>
      </h4>
    </div>
    <div id="collapse-br-Statistic" class="panel-collapse collapse in">
      <div class="panel-body">
        <table class="table table-bordered">
          
          <tr id="BR-Statistic-Strength" style="display:none;margin:0;padding:0;">
            <td>
              <span>Strength</span>
            </td>
            <td>
              <span id="">0</span>/<span id="">75</span>
            </td>
            <td>kek</td><td>kek</td>
          </tr>
          <tr id="BR-Statistic-Constitution" style="display:none;margin:0;padding:0;">
            <td>
              <span>Constitution</span>
            </td>
            <td>
              <span id="">0</span>/<span id="">75</span>
            </td>
          </tr>
          
        </table>
      </div>
    </div>
  </div>
</div>

                </div>
              </div>
            </div>
          </div>
          <!---->
          
        </div>
      </div>
      <!-- footer -->
      <? require_once 'footer.php';?>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="dist/jstree.min.js"></script>
    <script src="scripts.js"></script>
    <!--script src="jquery.min.js"></script-->
    <!--script src="bootstrap.min.js"></script-->
  </body>
</html>
