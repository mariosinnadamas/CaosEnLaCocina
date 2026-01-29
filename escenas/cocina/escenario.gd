extends Node2D

@onready var manager := $ComandasManager
@onready var list := $CanvasLayer/Hud/ComandasList

func _ready():
	print("Container asignado", list)
	print("Manager", manager)
	manager.container = list
	manager.start()
