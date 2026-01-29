extends Node

@export var comanda_scene: PackedScene
@export var spawn_time := 4.0
@export var max_comandas := 5

@onready var timer := $Timer
var container: HBoxContainer

func _ready():
	print("Manager listo, container: ", container)
	timer.one_shot = false
	timer.wait_time = spawn_time
	timer.timeout.connect(_spawn_comanda)

func start():
	if container == null:
		return
	timer.start()
	
func _spawn_comanda():
	print("Container: ", container)
	if container == null:
		return

	# Limitar cuántas comandas hay
	if container.get_child_count() >= max_comandas:
		return

	var comanda = comanda_scene.instantiate()
	container.add_child(comanda)
