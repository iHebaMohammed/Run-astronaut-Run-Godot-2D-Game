extends Node2D


onready var gameManager=get_tree().root.get_node("Main")
onready var sound = get_node("AudioStreamPlayer2D")

func _on_Area2D_body_entered(body):
	if body.name=="Character":
		gameManager.oxygen+=20
		visible=false
		sound.play()
		


