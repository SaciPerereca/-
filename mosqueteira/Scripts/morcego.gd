extends CharacterBody2D


const SPEED = 1000.0
const JUMP_VELOCITY = -400.0
@onready var wall_colider: RayCast2D = $wall_colider
var direction := -1
@onready var texture: Sprite2D = $texture


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if wall_colider.is_colliding():
		direction *= -1
		wall_colider.scale.x *= -1
		
	if direction == -1:
		texture.flip_h = true
	else:
		texture.flip_h = false
		 
	velocity.x = direction * SPEED * delta
		
	move_and_slide()
