extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -400.0
@onready var anim: AnimatedSprite2D = $Anim
var is_jumping = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		anim.play("Jump")
		
	# Handle jump.
	if Input.is_action_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		is_jumping = true
	elif  is_on_floor():
		is_jumping = false
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Esquerda","Direita")
	if direction != 0:
		velocity.x = direction * SPEED
		anim.scale.x = direction
		if !is_jumping :
			anim.play("Andando")
	elif  is_jumping :
			anim.play("Jump")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor():
			anim.play("Idle")

	move_and_slide()
