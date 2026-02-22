extends Control

@onready var level_list: VBoxContainer = get_node_or_null("ScrollContainer/LevelList") as VBoxContainer

func _ready() -> void:
	if level_list == null:
		# Fallback por si la ruta cambia
		var found = find_child("LevelList", true, false)
		if found is VBoxContainer:
			level_list = found

	if level_list == null:
		push_error("Niveles.gd: No encuentro 'ScrollContainer/LevelList' (VBoxContainer).")
		return

	_build_level_list()

func _build_level_list() -> void:
	for child in level_list.get_children():
		child.queue_free()

	var keys: Array = GD.levels.keys()
	keys.sort()

	for k in keys:
		var level_id := String(k)
		var level_data: Dictionary = GD.levels.get(level_id, {})

		var display_name: String = String(level_data.get("display_name", level_id))
		var difficulty: int = int(level_data.get("difficulty", 1))

		var btn := Button.new()
		btn.text = "%s (Dificultad %d)" % [display_name, difficulty]
		btn.size_flags_horizontal = Control.SIZE_EXPAND_FILL

		btn.pressed.connect(func(): _on_level_selected(level_id))
		level_list.add_child(btn)

func _on_level_selected(level_id: String) -> void:
	SF.go_to_planeacion_for_level(level_id)
