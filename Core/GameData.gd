extends Node
class_name GameData

signal scene_changed
signal selection_changed
signal world_changed
signal timeline_changed
signal navigation_changed

var current_level_id: String = "bank_central"

# Aquí defines tus niveles. Puedes agregar más después.
# IMPORTANTE: planning_scene debe existir como .tscn real.
var levels: Dictionary = {
	"bank_central": {
		"id": "bank_central",
		"display_name": "Banco Central",
		"difficulty": 1,
		"planning_scene": "res://Scenes/Planeacion/Planeacion.tscn"
	}
}

func set_level(level_id: String) -> void:
	current_level_id = level_id
	emit_signal("scene_changed")
