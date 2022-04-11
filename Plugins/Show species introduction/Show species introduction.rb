#===============================================================================
# * Show Species Introdution - by FL (Credits will be apreciated)
#===============================================================================
#
# This script is for Pokémon Essentials. It shows a picture with the pokémon
# species in a border, show a message with the name and kind, play it cry and
# mark it as seen in pokédex. Good to make the starter selection event.
#
#===============================================================================
#
# bo4p5687 (update)
#
#===============================================================================
#
# Call: showSpeciesIntro(specie,seen,gender,form,shiny,shadow)
# 
# The specie is the species number
# Seen: if set true, specie will show on pokedex
# Gender: 0 -> male; 1 -> female
#   if pokemon don't have gender, set 0 or number isn't 1
# Form: set number of form
# Shiny: set true, it shows shiny pokemon
# Shadow: set true, it shows shadow pokemon
#
# Ex: 
# 'showSpeciesIntro(4)' shows Charmander
# 'showSpeciesIntro(:CHIKORITA)' shows Chikorita
# 'showSpeciesIntro(422,false,0,1)' shows Shellos in East Sea form.
#
#===============================================================================
#===============================================================================
# Gender: 0: male/no gender; 1: female
# Form: 0, 1, 2, 3, etc
def showSpeciesIntro(specie,seen=true,gender=0,form=0,shiny=false,shadow=false)
	specie = GameData::Species.get(specie).id
  name   = GameData::Species.get(specie).name
  kind   = GameData::Species.get(specie).category
  if seen
		$Trainer.pokedex.set_seen(specie)
		$Trainer.pokedex.register(specie, gender, form)
  end
  bitmap = GameData::Species.front_sprite_filename(specie,form,gender,shiny,shadow)
	GameData::Species.play_cry_from_species(specie,form)
  if bitmap # to prevent crashes
    iconwindow=PictureWindow.new(bitmap)
    iconwindow.x=(Graphics.width/2)-(iconwindow.width/2)
    iconwindow.y=((Graphics.height-96)/2)-(iconwindow.height/2)
    pbMessage(_INTL("{1}. {2} POKéMON.",name,kind))
    iconwindow.dispose
  end
end