extends Node

# -------------------------
# Señales globales
# -------------------------

signal scene_changed
signal selection_changed
signal world_changed
signal timeline_changed
signal navigation_changed

# -------------------------
# Estado global del juego
# -------------------------

var current_level_id: String = ""
var selected_character_id: String = ""

# Datos de niveles
var levels: Dictionary = {}

# Datos de personajes
var characters: Dictionary = {}

# Estado del mundo (puertas, objetos, etc.)
var world_state: Dictionary = {}

# Plan actual
var plan_actions: Dictionary = {}   # character_id -> Array

# -------------------------
# Inicialización
# -------------------------

func _ready() -> void:
	_init_levels()
	_init_characters()

	# Uso mínimo para evitar warnings (sin afectar gameplay)
	emit_signal("world_changed")
	emit_signal("timeline_changed")
	emit_signal("navigation_changed")

# -------------------------
# API básica que usaremos en fases siguientes
# -------------------------

func set_selected_character(id: String) -> void:
	selected_character_id = id
	emit_signal("selection_changed")

func set_current_scene(path: String) -> void:
	emit_signal("scene_changed", path)

# -------------------------
# Niveles
# -------------------------

func _init_levels() -> void:
	levels = {
		"bank_01": {
			"display_name": "Banco Central",
			"difficulty": 1,
			"planning_scene": "res://Scenes/Planeacion/Planeacion.tscn"
		}
	}

# -------------------------
# Personajes
# -------------------------

func _init_characters() -> void:
	characters = {
		"leader": {
			"display_name": "Líder",
			"speed": 140.0
		},
		"hacker": {
			"display_name": "Hacker",
			"speed": 120.0
		}
	}
