extends Node2D

var spawnpoint = false

var activated = false 



func _on_area_2d_area_entered(area):
	if area.get_parent() is Player:
		pass

