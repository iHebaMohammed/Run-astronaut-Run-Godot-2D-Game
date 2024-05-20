extends Node2D

var sets=[]
export var Speed=10
export var limit=687.8
export var limitOffset=2.8
var randomGenerator=RandomNumberGenerator.new()
var randomIndex=0
onready var gameManager=get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child.is_in_group("Sets"):
			sets.append(child)
			remove_child(child)
	selectRandomObstacle()
	print(get_child_count())



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if gameManager.StartGame==true:
		translate(Vector2(-Speed*delta,0))
		if position.x<=-limit:
			position.x=limit-limitOffset
			remove_child(sets[randomIndex])
			selectRandomObstacle()


func selectRandomObstacle():
	randomGenerator.randomize()
	randomIndex=randomGenerator.randi_range(0,sets.size()-1)
	sets[randomIndex].get_node("FireWorm").reset()
	add_child(sets[randomIndex])
