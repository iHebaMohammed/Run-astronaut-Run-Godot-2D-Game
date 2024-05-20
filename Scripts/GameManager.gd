extends Node2D


var StartGame=false
var isDead=false
var oxygen=15
onready var sceneUI=get_node("MainSceneUI")
onready var oxygenText=sceneUI.get_node("Oxygen")
onready var player=get_node("Character")
 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("StartGame") and not isDead :
		StartGame=true
	oxygen-=delta
	if oxygen <= 0:
		player.die()
	else:
		oxygenText.text ="Oxygen " + str(int(oxygen))
		
	
	
