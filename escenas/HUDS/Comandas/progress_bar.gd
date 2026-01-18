extends ProgressBar

signal time_over

const GREEN  = Color(0.2, 1.0, 0.2)
const YELLOW = Color(1.0, 0.9, 0.2)
const RED    = Color(1.0, 0.2, 0.2)

@export var max_time := 10.0
var time_left := 0.0

var fill_style: StyleBoxFlat
var finished:= false

func _ready():
	min_value = 0
	max_value = 100
	value = 100

	# Crear el rectángulo de relleno
	fill_style = StyleBoxFlat.new()
	fill_style.bg_color = GREEN
	fill_style.corner_radius_top_left = 4
	fill_style.corner_radius_top_right = 4
	fill_style.corner_radius_bottom_left = 4
	fill_style.corner_radius_bottom_right = 4

	add_theme_stylebox_override("fill", fill_style)

	time_left = max_time
	update_bar()

func _process(delta):
	if finished:
		return
		
	time_left -= delta
	time_left = max(time_left, 0)
	update_bar()
	
	if time_left == 0:
		finished = true # Esto evita que la señal se emita muchas veces
		emit_signal("time_over") 

func update_bar():
	var t := time_left / max_time
	value = t * 100

	if t > 0.5:
		fill_style.bg_color = YELLOW.lerp(GREEN, (t - 0.5) / 0.5)
	else:
		fill_style.bg_color = RED.lerp(YELLOW, t / 0.5)
