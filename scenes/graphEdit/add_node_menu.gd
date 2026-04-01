extends PopupMenu

@export var json_flow_node: PackedScene = preload("res://scenes/graphNodes/json_node.tscn")

@onready var graph_edit = get_parent()

var templates_submenu = PopupMenu.new()

var submenu_callables: Array[Callable] = []

var popup_items = [
	["Add JSON Flow Node", add_json_flow_node_clicked],
]

func _ready():
	for entry in popup_items:
		add_item(entry[0])
	
	submenu_popup_delay = 0
	add_child(templates_submenu)
	templates_submenu.name = "templates_submenu"
	add_submenu_item("Add from template", "templates_submenu")
	reload_templates()
	about_to_popup.connect(reload_templates)
	templates_submenu.index_pressed.connect(func (id: int):submenu_callables[id].call())
	
	id_pressed.connect(func (idx: int):popup_items[idx][1].call())

func reload_templates():
	templates_submenu.clear()
	submenu_callables.clear()
	for template in Globals.template_registry.get_templates():
		templates_submenu.add_item(template)
		submenu_callables.append(graph_edit.add_node.bind(
			Globals.template_registry.get_template_data(template),template,graph_edit.make_canvas_position_local(position)))

func popup_submenu(new_position):
	position = new_position
	templates_submenu.position = new_position
	reload_templates()
	templates_submenu.size = Vector2(0,0)
	templates_submenu.popup()

func add_json_flow_node_clicked():
	graph_edit.add_node({},"",graph_edit.make_canvas_position_local(position))
