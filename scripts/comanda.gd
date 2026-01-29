extends Control

#Cuando la comanda llega a 0 se elimina

func _ready() -> void:
	$Hoja/MarginContainer/VBoxContainer/ProgressBar.time_over.connect(_on_time_over)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_time_over():
	var tween := create_tween()
	tween.tween_property(self,"modulate:a", 0.0,0.3)
	tween.tween_callback(queue_free)
