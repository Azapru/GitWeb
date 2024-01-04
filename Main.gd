extends Control

var Paragraph : PackedScene = preload("res://Elements/Paragraph.tscn")
var elements = []
var gwml: Array

var element: String
var element_id = 0
var properties: Array
var builder_y = 0

func _ready():
	# Load GWML file
	gwml = FileAccess.open("test.gwml", FileAccess.READ).get_as_text().split("\n", false)
	
	# Build site
	for line: String in gwml:
		# Check for finishing line
		if line == "#\r":
			if element == "paragraph":
				elements.append(Paragraph.instantiate())
				add_child(elements[element_id])
				
				elements[element_id].position.y = builder_y
				
				for property in properties:
					if property[0] == "padding":
						elements[element_id].position.x += int(property[1])
						elements[element_id].position.y += int(property[1])
						builder_y += int(property[1])
					if property[0] == "text":
						elements[element_id].text = property[1]
				
				builder_y += elements[element_id].size.y
				
			element_id += 1
		#Check for elements
		elif line == "#paragraph\r":
			element = "paragraph"
			properties = [] # Clean
		else: # Property line
			properties.append(line.split("=", false, 1))
	
func _process(delta):
	pass
