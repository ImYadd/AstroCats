extends CharacterBody2D

var walk_speed = 300.0
const JUMP_VELOCITY = -400.0
var is_interacting = false  # ← Ajout ici

func _physics_process(delta: float) -> void:
	if is_interacting:
		return  # ← Empêche de bouger pendant l’interaction

	# Gravité
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Saut
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Déplacement gauche/droite
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * walk_speed
	else:
		velocity.x = move_toward(velocity.x, 0, walk_speed)

	move_and_slide()
