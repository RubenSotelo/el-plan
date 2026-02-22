extends Node
class_name SceneFlow

func go_to_scene(path: String) -> void:
	if path == "":
		push_warning("SceneFlow: path vacío.")
		return
	var err := get_tree().change_scene_to_file(path)
	if err != OK:
		push_error("SceneFlow: no se pudo cambiar a escena: %s (err=%d)" % [path, err])

func go_to_inicio() -> void:
	go_to_scene("res://Scenes/Inicio/Inicio.tscn")

func go_to_niveles() -> void:
	go_to_scene("res://Scenes/Niveles/Niveles.tscn")

func go_to_personajes() -> void:
	go_to_scene("res://Scenes/Personajes/Personajes.tscn")

func go_to_planeacion_for_level(level_id: String) -> void:
	GD.current_level_id = level_id

	var level: Dictionary = GD.levels.get(level_id, {})
	var scene_path: String = String(level.get("planning_scene", ""))

	if scene_path == "":
		push_error("SceneFlow: el nivel '%s' no tiene 'planning_scene'." % level_id)
		return

	go_to_scene(scene_path)
