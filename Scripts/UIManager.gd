extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Play_pressed():
	get_tree().change_scene("res://Scenes/StoryScene.tscn")
	

func _on_Exit_pressed():
	get_tree().quit()


func _on_SoundMute_toggled(button_pressed):
	#A bus is an output channel on a mixer that has collected all the audio from any channel that is sent to it
	var master_sound = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_mute(master_sound, button_pressed)
