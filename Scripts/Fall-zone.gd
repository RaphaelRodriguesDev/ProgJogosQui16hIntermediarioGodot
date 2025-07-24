extends Area2D

func _on_fallzone_body_entered(body: Node) -> void:
	print(body);
	get_tree().change_scene("res://Prefabs/GameOver.tscn")
