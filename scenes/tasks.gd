extends Node2D

var question = "Write 'Hello, world!' in Python. \n\nTips: don't forget the ('' '')"
var correct_answers = [
	'print("hello,world!")',
	"print('hello,world!')"
]

var is_interacting = false

func _ready():
	$Panel/QuestionLabel.text = question
	$Panel/SubmitButton.pressed.connect(_on_submit_pressed)
	$Camera2D.make_current()

func _process(delta):
	# Pas besoin d'appeler _physics_process ici
	pass

func _on_submit_pressed() -> void:
	var player_answer = $Panel/AnswerInput.text.strip_edges().to_lower()
	player_answer = player_answer.replace(" ", "")  # Normalisation des espaces

	if player_answer in correct_answers:
		$Panel/FeedbackLabel.text = "✅ Correct!"
		$Panel/FeedbackLabel.modulate = Color(0, 1, 0)
		await get_tree().create_timer(1.0).timeout
		return_to_main_scene()
	else:
		$Panel/FeedbackLabel.text = "❌ Incorrect, try again."
		$Panel/FeedbackLabel.modulate = Color(1, 0, 0)

func return_to_main_scene() -> void:
	var main_scene_path = "res://scenes/astrocats.tscn"
	var error = get_tree().change_scene_to_file(main_scene_path)
	if error != OK:
		print("Erreur en changeant de scène :", error)
		return
	# Ne pas attendre le signal ici (souvent source d'erreurs)
	# Le repositionnement du joueur sera géré dans la scène astrocats
