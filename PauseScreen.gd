extends ColorRect


export(String, FILE) var HomePath
var reload = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().paused = true
		show()


func _on_ExitButton_pressed():
	get_tree().quit()


func _on_HomeButton_pressed():
	get_tree().paused = false
	hide()
	get_tree().change_scene(HomePath)


func _on_RetryResumeButton_pressed():
	get_tree().paused = false
	if reload:
		get_tree().reload_current_scene()
		reset_screen()
	hide()

func game_over():
	reload = true
	$Title.text = "Game over !"
	$VBoxContainer/RetryResumeButton.text = "Retry"
	get_tree().paused = true
	show()

func reset_screen():
	reload = false
	$Title.text = "Paused"
	$VBoxContainer/RetryResumeButton.text = "Resume"
