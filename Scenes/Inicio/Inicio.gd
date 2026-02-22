extends Control

@onready var btn_start: Button = get_node_or_null("CenterContainer/VBoxContainer/BtnStart") as Button

func _ready() -> void:
	# Fallback por si moviste el botón
	if btn_start == null:
		var found = find_child("BtnStart", true, false)
		if found is Button:
			btn_start = found

	if btn_start == null:
		push_error("Inicio.gd: No encuentro el botón 'BtnStart'. Revisa tu escena Inicio.tscn.")
		return

	btn_start.pressed.connect(_on_start_pressed)

func _on_start_pressed() -> void:
	SF.go_to_niveles()
