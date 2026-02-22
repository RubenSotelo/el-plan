extends Node

func go_to_scene(path: String) -> void:
	get_tree().change_scene_to_file(path)

func go_to_inicio() -> void:
	go_to_scene("res://Scenes/Inicio/Inicio.tscn")

func go_to_niveles() -> void:
	go_to_scene("res://Scenes/Niveles/Niveles.tscn")

func go_to_personajes() -> void:
	go_to_scene("res://Scenes/Personajes/Personajes.tscn")

func go_to_planeacion() -> void:
	var level = GD.levels.get(GD.current_level_id, null)
	if level:
		go_to_scene(level.planning_scene)
