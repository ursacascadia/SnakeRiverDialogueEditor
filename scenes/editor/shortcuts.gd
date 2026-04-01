extends Node

@export var add_node_menu: Node

var shortcuts: Dictionary = {
	"add_empty_node": add_empty_node,
	"add_template_node": add_template_node
}

func _input(event: InputEvent) -> void:
	for a in shortcuts:
		if event.is_action(a, true):
			shortcuts[a].call()
			get_viewport().set_input_as_handled()

func add_empty_node():
	pass

func add_template_node():
	add_node_menu.popup_submenu(get_viewport().get_mouse_position())
