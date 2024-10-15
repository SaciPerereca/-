extends Node2D

const Espera_um_poquin = 1.0
@onready var plataforma: AnimatableBody2D = $plataforma
@export var Speed = 3.0# velocidade rapida underground master
@export var Distance = 192
@export var move_hor = true

var Follow = Vector2.ZERO
var meio_da_plataforma = 16 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	move_plataforma()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	plataforma.position = plataforma.position.lerp(Follow, 0.5 )
	

func move_plataforma():
	var dir_movimento = Vector2.RIGHT * Distance if move_hor else Vector2.UP * Distance
	var duracao = dir_movimento.length() /  float(Speed * meio_da_plataforma)
	
	var Plataforma_tween = create_tween().set_loops().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	Plataforma_tween.tween_property(self, "Follow", dir_movimento, duracao).set_delay(Espera_um_poquin)
	Plataforma_tween.tween_property(self, "Follow", Vector2.ZERO, duracao).set_delay(Espera_um_poquin * 2)
	
