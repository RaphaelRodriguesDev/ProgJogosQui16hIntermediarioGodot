extends KinematicBody2D

var facing_left = true

onready var bullet_instance = preload("res://Scene/seed.tscn")
onready var player = Global.get("player")

func _physics_process(delta) -> void:
	if player:
		var distance = player.global_position.x - self.position.x
		facing_left = true if distance < 0 else false
		
		if facing_left:
			self.scale.x = 1
		else:
			self.scale.x = -1
			
func shoot():
	var bullet = bullet_instance.instance()
	add_child(bullet)
	bullet.global_position = $spawnShoot.global_position
