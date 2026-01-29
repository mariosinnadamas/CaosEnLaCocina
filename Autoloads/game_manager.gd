extends Node

@onready var manager := $ComandasManager
@onready var list := $CanvasLayer/Hud

const LEVELS = {
	1: preload("res://escenas/cocina/escenario.tscn")
}

var current_level = 0

func load_next_level():
	current_level+=1
	
	if current_level <= LEVELS.size():
		get_tree().change_scene_to_packed(LEVELS[current_level])
