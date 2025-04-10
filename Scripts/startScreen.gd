extends Control


func _ready():
	pass


func _on_startBtn_pressed():
	get_tree().change_scene("res://Levels/Level_01.tscn")


func _on_quitBtn_pressed():
	get_tree().quit()
