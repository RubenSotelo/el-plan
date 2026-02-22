extends Control

@onready var level_list = $VBoxContainer/VBoxContainer

func _ready():
	_build_levels()

func _build_levels():
	for child in level_list.get_children():
		child.queue_free()

	for level_id in GD.levels.keys():
		var data = GD.levels[level_id]

		var btn = Button.new()
		btn.text = "%s (Dificultad %d)" % [
			data.display_name,
			data.difficulty
		]

		btn.pressed.connect(func():
			GD.current_level_id = level_id
			SF.go_to_planeacion()
		)

		level_list.add_child(btn)
