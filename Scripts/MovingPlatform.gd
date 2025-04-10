extends Node2D

onready var platform = $platform
onready var tween = $Tween

export var speed = 3.0
export var horizontal = true
export var distance = 192

var follow = Vector2.ZERO
var move_direction = Vector2.ZERO
const WAIT_DURATION = 1.5  # Tempo de espera ao chegar no destino

func _ready():
	tween.connect("tween_completed", self, "_on_tween_completed")
	move_direction = Vector2.RIGHT * distance if horizontal else Vector2.UP * distance
	_start_tween(true)  # Começa indo para frente

func _start_tween(forward: bool):
	var from = Vector2.ZERO if forward else move_direction
	var to = move_direction if forward else Vector2.ZERO
	var duration = distance / float(speed * 16)

	tween.interpolate_property(
		self, "follow", from, to, duration,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, WAIT_DURATION
	)
	tween.start()

func _on_tween_completed(_object, _key):
	_start_tween(follow == Vector2.ZERO)  # Alterna entre ida e volta

func _physics_process(_delta: float) -> void:
	platform.position = platform.position.linear_interpolate(follow, 0.05)
