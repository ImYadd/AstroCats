extends Area2D

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		open_task_scene()

func open_task_scene():
	var player = get_tree().get_current_scene().get_node("Player")
	if player:
			Global.player_position = player.global_position  # Sauvegarde la position actuelle du joueur

	var task_scene = load("res://scenes/tasks.tscn")
	var task_instance = task_scene.instantiate()
	get_tree().current_scene.add_child(task_instance)
