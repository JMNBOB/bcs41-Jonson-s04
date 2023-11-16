extends Area2D

var nextLevel = 1

func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		nextLevel += 1
		get_tree().change_scene("res://Scenes/map/Level_" + str(nextLevel) +".tscn") 
