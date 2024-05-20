extends Node2D


onready var animatedSprite=get_node("AnimatedSprite")
var isDead=false

# Called when the node enters the scene tree for the first time.
func _ready():
	animatedSprite.play("Idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.name=="Character" and isDead==false:
		body.die()


func _on_Area2D_area_entered(area):
	if area.is_in_group("Bullet"):
		die()
		area.get_parent().queue_free()

func die():
	isDead = true
	animatedSprite.play("Die")
	
func reset():
	isDead = false
	animatedSprite.play("Idle")
	
		

