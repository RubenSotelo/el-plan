extends Control

@onready var btn_start = $CenterContainer/VBoxContainer/Button

func _ready():
	btn_start.pressed.connect(_on_start)

func _on_start():
	SF.go_to_niveles()
