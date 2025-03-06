extends PanelContainer


@export var current_value : String

@export var standard_array_pool = {"8": false, "10": false, "12": false, "13": false, "14": false, "15": false}

var parent_node
var can_be_removed
# Called when the node enters the scene tree for the first time.
func _ready():
	for button in get_tree().get_nodes_in_group("ValueButtons"):
		if standard_array_pool.get(button.name) == true:
			button.disabled = true
			
		else:
			button.disabled = false
			
	parent_node = self.get_parent().get_child(0)
	current_value = parent_node.label_name

func _on_8_pressed():
	if standard_array_pool.has(current_value):
		standard_array_pool[current_value] = false
	standard_array_pool["8"] = true
	parent_node.label_name = "8"
	await get_tree().create_timer(0.1).timeout
	self.get_parent().remove_child(self)

func _on_10_pressed():
	if standard_array_pool.has(current_value):
		standard_array_pool[current_value] = false
	standard_array_pool["10"] = true
	parent_node.label_name = "10"
	await get_tree().create_timer(0.1).timeout
	self.get_parent().remove_child(self)
	
	
func _on_12_pressed():
	if standard_array_pool.has(current_value):
		standard_array_pool[current_value] = false
	standard_array_pool["12"] = true
	parent_node.label_name = "12"
	await get_tree().create_timer(0.1).timeout
	self.get_parent().remove_child(self)
	
func _on_13_pressed():
	if standard_array_pool.has(current_value):
		standard_array_pool[current_value] = false
	standard_array_pool["13"] = true
	parent_node.label_name = "13"
	await get_tree().create_timer(0.1).timeout
	self.get_parent().remove_child(self)
	
func _on_14_pressed():
	if standard_array_pool.has(current_value):
		standard_array_pool[current_value] = false
	standard_array_pool["14"] = true
	parent_node.label_name = "14"
	await get_tree().create_timer(0.1).timeout
	self.get_parent().remove_child(self)
	
func _on_15_pressed():
	if standard_array_pool.has(current_value):
		standard_array_pool[current_value] = false
	standard_array_pool["15"] = true
	parent_node.label_name = "15"
	await get_tree().create_timer(0.1).timeout
	self.get_parent().remove_child(self)

func _on_clear_pressed():
	if standard_array_pool.has(current_value):
		standard_array_pool[current_value] = false
		
	parent_node.label_name = "-"
	update_values()
	
	await get_tree().create_timer(0.1).timeout
	self.get_parent().remove_child(self)
	
func update_values():
	for button in get_tree().get_nodes_in_group("ValueButtons"):
		if standard_array_pool.get(button.name) == true:
			button.disabled = true
			
		else:
			button.disabled = false
			
func _process(delta):
	if Input.is_action_just_released("ui_touch"):
		var curPos = get_global_mouse_position()
		if self.is_inside_tree() == true:
			if !Rect2(self.get_global_rect()).has_point(curPos) and !Rect2(parent_node.get_global_rect()).has_point(curPos):
				self.get_parent().remove_child(self)
				pass


func _on_tree_entered():
	printerr("ENTERED")
	
	for child_index in $MarginContainer/VBoxContainer.get_children().size():
		printerr(standard_array_pool.get($MarginContainer/VBoxContainer.get_child(child_index).name))
		if standard_array_pool.get($MarginContainer/VBoxContainer.get_child(child_index).name) == true:
			$MarginContainer/VBoxContainer.get_child(child_index).disabled = true
		else:
			$MarginContainer/VBoxContainer.get_child(child_index).disabled = false
		
	parent_node = self.get_parent().get_child(0)
	current_value = parent_node.label_name
	can_be_removed = true

func _on_tree_exiting():
	can_be_removed = false
