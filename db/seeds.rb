# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

runewars_template = Template.create(:name => 'Runewars Fate', :public => true)
runewars_cards =  Card.create(
                    [{:template => runewars_template, :text => "Dragon -	Triangle: nothing,	Rectangle: 2 Rout,	Circle: Orb,	Hexagon: 2 Dmg"},
                    {:template => runewars_template,  :text => "Dragon -	Triangle: nothing,	Rectangle: 2 Rout,	Circle: Orb,	Hexagon: 1 Dmg"},
                    {:template => runewars_template,  :text => "Shield -	Triangle: nothing,	Rectangle: Orb,	Circle: Orb,	Hexagon: 1 Dmg,"},
                    {:template => runewars_template,  :text => "Shield -	Triangle: nothing,	Rectangle: Orb,	Circle: Orb,	Hexagon: nothing"},
                    {:template => runewars_template,  :text => "Sun -	Triangle: 1 Rout,	Rectangle: nothing,	Circle: 1 Dmg,	Hexagon: nothing"},
                    {:template => runewars_template,  :text => "Dragon -	Triangle: 1 Rout,	Rectangle: nothing,	Circle: 1 Dmg,	Hexagon: Orb"},
                    {:template => runewars_template,  :text => "Sun -	Triangle: 1 Rout,	Rectangle: nothing,	Circle: nothing,	Hexagon: Orb"},
                    {:template => runewars_template,  :text => "Dragon -	Triangle: 1 Rout,	Rectangle: 1 Rout,	Circle: nothing,	Hexagon: 3 Dmg"},
                    {:template => runewars_template,  :text => "Dragon -	Triangle: Orb,	Rectangle: 1 Rout,	Circle: nothing,	Hexagon: 3 Dmg"},
                    {:template => runewars_template,  :text => "Dragon -	Triangle: Orb,	Rectangle: 1 Rout,	Circle: nothing,	Hexagon: 2 Dmg"},
                    {:template => runewars_template,  :text => "Dragon -	Triangle: nothing,	Rectangle: 2 Dmg,	Circle: Orb,	Hexagon: 2 Dmg"},
                    {:template => runewars_template,  :text => "Dragon -	Triangle: nothing,	Rectangle: 2 Dmg,	Circle: Orb,	Hexagon: 1 Dmg"},
                    {:template => runewars_template,  :text => "Shield -	Triangle: nothing,	Rectangle: Orb,	Circle: Orb,	Hexagon: 1 Dmg"},
                    {:template => runewars_template,  :text => "Shield -	Triangle: nothing,	Rectangle: Orb,	Circle: Orb,	Hexagon: 1 Dmg"},
                    {:template => runewars_template,  :text => "Shield -	Triangle: 1 Dmg,	Rectangle: nothing,	Circle: 1 Rout,	Hexagon: nothing"},
                    {:template => runewars_template,  :text => "Dragon -	Triangle: 1 Dmg,	Rectangle: nothing,	Circle: 1 Rout,	Hexagon: Orb"},
                    {:template => runewars_template,  :text => "Sun -	Triangle: 1 Dmg,	Rectangle: nothing,	Circle: nothing,	Hexagon: Orb"},
                    {:template => runewars_template,  :text => "Dragon -	Triangle: 1 Dmg,	Rectangle: 1 Dmg,	Circle: nothing,	Hexagon: 3 Dmg"},
                    {:template => runewars_template,  :text => "Dragon -	Triangle: Orb,	Rectangle: 1 Dmg,	Circle: nothing,	Hexagon: nothing"},
                    {:template => runewars_template,  :text => "Dragon -	Triangle: Orb,	Rectangle: 1 Dmg,	Circle: nothing,	Hexagon: 2 Dmg"},
                    {:template => runewars_template,  :text => "Dragon -	Triangle: nothing,	Rectangle: 2 Dmg,	Circle: Orb,	Hexagon: 2 Rout"},
                    {:template => runewars_template,  :text => "Dragon -	Triangle: nothing,	Rectangle: 2 Dmg,	Circle: Orb,	Hexagon: 2 Rout"},
                    {:template => runewars_template,  :text => "Shield -	Triangle: nothing,	Rectangle: Orb,	Circle: Orb,	Hexagon: 1 Rout"},
                    {:template => runewars_template,  :text => "Shield -	Triangle: nothing,	Rectangle: Orb,	Circle: Orb,	Hexagon: nothing"},
                    {:template => runewars_template,  :text => "Shield -	Triangle: 1 Dmg,	Rectangle: nothing,	Circle: 1 Dmg,	Hexagon: nothing"},
                    {:template => runewars_template,  :text => "Dragon -	Triangle: 1 Dmg,	Rectangle: nothing,	Circle: 1 Dmg,	Hexagon: Orb"},
                    {:template => runewars_template,  :text => "Sun -	Triangle: 1 Dmg,	Rectangle: nothing,	Circle: nothing,	Hexagon: Orb"},
                    {:template => runewars_template,  :text => "Dragon -	Triangle: 1 Dmg,	Rectangle: 1 Dmg,	Circle: nothing,	Hexagon: 2 Rout"},
                    {:template => runewars_template,  :text => "Dragon -	Triangle: Orb,	Rectangle: 1 Dmg,	Circle: nothing,	Hexagon: 2 Rout"},
                    {:template => runewars_template,  :text => "Dragon -	Triangle: Orb,	Rectangle: 1 Dmg,	Circle: nothing,	Hexagon: 2 Rout"}])

smallworld_races_template = Template.create(:name => 'Small World Races', :public => true)
smallworld_races_cards = Card.create([{:template => smallworld_races_template, :text => "Amazons (6) Use 4 Additional Amazons during conquest."},
                                    {:template => smallworld_races_template, :text => "Dwarves (3) Collect 1 extra coin for each mine, even in decline."},                                  
                                    {:template => smallworld_races_template, :text => "Elves (6) Do not suffer losses when conquered."},
                                    {:template => smallworld_races_template, :text => "Ghouls (5) Act as if activate when in decline."},
                                    {:template => smallworld_races_template, :text => "Giants (6) Conquer adjacent to occupied mountains at -1 units."},                                  
                                    {:template => smallworld_races_template, :text => "Halflings (6) First conquest anywhere. Place 2 immune hole-in-the-grounds in the first 2 areas conquered."},                                  
                                    {:template => smallworld_races_template, :text => "Humans (5) Collect 1 extra coin for each Farmland region."},                                  
                                    {:template => smallworld_races_template, :text => "Orcs (5) Collect 1 extra coin for each unoccupied region conquered this turn."},                                  
                                    {:template => smallworld_races_template, :text => "Ratmen (8) No Racial Power."},                                  
                                    {:template => smallworld_races_template, :text => "Skeletons (6) Create 1 additional skeleton during redeploy for each 2 unoccupied regions conquered this turn."},                                  
                                    {:template => smallworld_races_template, :text => "Sorcerors (5) On your turn, you may replace an opponent's single unit adjacent to your territory with a sorceror from the box. You may do this once for each opponent."},                                 
                                    {:template => smallworld_races_template, :text => "Tritons (6) Conquer adjacent to water at -1 units."},                                  
                                    {:template => smallworld_races_template, :text => "Trolls (5) Place a Troll's Lair in each region you occupy. These stay even in decline."},                                  
                                    {:template => smallworld_races_template, :text => "Wizards (5) Collect 1 extra coin for each Magic Source.)"}])

smallworld_powers = Template.create(:name => 'Small World Powers', :public => true)
smallworld_powers_cards = Card.create([
  {:template => smallworld_powers, :text => "Alchemist (4) Collect 2 exta coins at the end of each turn while active."},
  {:template => smallworld_powers, :text => "Berserk (4) You can use the reinforcement die for every conquest and roll before selecting the region."},
  {:template => smallworld_powers, :text => "Bivouacking (5) During redeploy, place or move the 5 Encampment tokens in your region(s) that count as one unit each for defense."},
  {:template => smallworld_powers, :text => "Commando (4) You may conquer any region at -1 units."},
  {:template => smallworld_powers, :text => "Diplomat (5) At the end of your turn, pick an opponent whose active race you did not attack. That player may not attack your active race before your next turn."},
  {:template => smallworld_powers, :text => "Dragon Master (5) Once per turn, you may make a single conquest with just one unit. Place or move the Dragon token into that region which makes it immune."},
  {:template => smallworld_powers, :text => "Flying (5) You may conquer any region except water even if they are not adjacent."},
  {:template => smallworld_powers, :text => "Forest (4) Collect 1 extra coin for each Forest you control."},
  {:template => smallworld_powers, :text => "Fortified (3) Once per turn, place one Fortress in a region you control (max 1 per region, 6 total). Each fortress confers 1 extra coin while active and 1 defense. These remain even in decline."},
  {:template => smallworld_powers, :text => "Heroic (5) At the end of your turn place your 2 Hero tokens in two seperate regions you control. These regions are immune."},
  {:template => smallworld_powers, :text => "Hill (4) Collect 1 bonus coin for each Hill you control."},
  {:template => smallworld_powers, :text => "Merchant (2) Collect 1 bonus coin for each region you control."},
  {:template => smallworld_powers, :text => "Mounted (5) Conquer Hills and Farmlands at -1 units."},
  {:template => smallworld_powers, :text => "Pillaging (5) Collect 1 extra coin for each non-empty region conquered this turn."},
  {:template => smallworld_powers, :text => "Seafaring (5) You may conquer water regions."},
  {:template => smallworld_powers, :text => "Spirit (5) This race does not count for your declined race limit. (Keep this power when in decline)"},
  {:template => smallworld_powers, :text => "Stout (4) You may go into Decline after conquering."},
  {:template => smallworld_powers, :text => "Swamp (4) Collect 1 extra coin for each Swamp you control."},
  {:template => smallworld_powers, :text => "Underworld (5) You may conquer regions with caverns at -1 units. All regions with Caverns are considered adjacent."},
  {:template => smallworld_powers, :text => "Wealthy (4) Collect 7 extra coins at the end of your first turn active.  "},
  ])                                