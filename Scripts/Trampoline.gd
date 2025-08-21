extends Area2D

func _on_trampoline_body_entered(body: Node) -> void:
	print("Colidiu")
	body.velocity.y = body.jump_force * 2
	$anim.play("jump")
