extends Node2D

# Reference to the AudioStreamPlayer node
var audio_player

func _ready():
	# Get the AudioStreamPlayer node
	audio_player = $AudioStreamPlayer2D
	
	# Connect the button pressed signal to the function to play audio
	$Button.connect("pressed", self, "_on_Button_pressed")

# When the button is pressed, the audio is played
func _on_Button_pressed():
	audio_player.play()
