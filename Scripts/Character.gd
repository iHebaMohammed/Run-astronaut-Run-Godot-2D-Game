extends RigidBody2D

export var jumpForce=250
onready var animationSprite=get_node("AnimatedSprite")
var isJumping=false
var isShooting=false
onready var gameManager=get_parent()
onready var collisionShape=get_node("CollisionShape2D")
onready var audio=get_node("AudioStreamPlayer2D")

var bullet = preload("res://Scenes/Bullet.tscn")
var jumpSound = preload("res://Sounds/jump.wav")
var loseSound = preload("res://Sounds/Lose.wav")
var shootSound = preload("res://Sounds/Shoot.wav")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	get_node("AnimatedSprite").play("Run")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if gameManager.StartGame == true:
		if Input.is_action_pressed("Up") and isJumping==false:
			set_axis_velocity(Vector2(0,-jumpForce))
			isJumping=true
			animationSprite.play("Jump")
			audio.stream = jumpSound
			audio.play()
		if Input.is_action_pressed("Down"):
			collisionShape.scale.y=0.5
			collisionShape.position.y=10
			animationSprite.play("Slide")
		if Input.is_action_just_released("Down"):
			collisionShape.scale.y=1
			collisionShape.position.y=-1
			animationSprite.play("Run")
			
		if Input.is_action_pressed("Right") and isShooting==false:
			shoot()
			isShooting=true
		if Input.is_action_just_released("Right"):
			isShooting=false
		

	
	


func _on_Character_body_entered(body):
	if gameManager.StartGame == true:
		if body.get_parent().is_in_group("Ground"):
			isJumping=false
			animationSprite.play("Run")
		else:
			die()
			pass

func die():
	gameManager.StartGame=false
	gameManager.isDead=true
	animationSprite.play("Death")
	
	
	
	
	gameManager.get_node("Music").stop()
	audio.stream=loseSound
	audio.play()
	








func shoot():
	if audio.stream != shootSound:
		audio.stream = shootSound
	audio.play()
	var b =bullet.instance()
	b.position=get_node("BulletPosition").get_global_position()
	print(b.position)
	get_parent().add_child(b)
	

