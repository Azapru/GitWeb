extends Control

var Text : PackedScene = preload("res://Elements/Text.tscn")
var elements = []

func _ready():
	elements.append(Text.instantiate())
	add_child(elements[0])
	elements[0].text = "Balls"
	
	elements.append(Text.instantiate())
	add_child(elements[1])
	elements[1].text = "Balls\nGaming!!\njireohqgpihr9pguiqh4"
	elements[1].position = Vector2(0, 64)
	
func _process(delta):
	pass
