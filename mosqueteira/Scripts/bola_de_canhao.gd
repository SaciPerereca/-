extends Area2D
@onready var anim = $Anim


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	anim.play("Pega")

	


func _on_anim_animation_finished():
	queue_free()
