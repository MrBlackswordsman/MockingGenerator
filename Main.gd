extends Control

onready var input_text = $CenterContainer/Container/InputText
onready var output_text = $CenterContainer/Container/OutputText

var input = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func convert_text(text):
	for i in text.length():
		var r = randi() % 2
		
		if r == 1:
			text = text.replacen(text[i], text[i].to_upper())
			
		elif r == 0:
			text = text.replacen(text[i], text[i].to_lower())
	
	output_text.text = text

func _on_InputText_text_changed():
	input = input_text.text

func _on_ConvertButton_pressed():
	randomize()
	convert_text(input)

func _on_CopyTextButton_pressed():
	OS.clipboard = output_text.text
