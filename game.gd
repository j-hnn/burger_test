extends Node2D

@export var food_scenes: Array[PackedScene] = []

@onready var spawn_location = $SpawnLocation
@onready var food_container = $FoodContainer

var inside = false
var pressed = false
var food_number = 0
var food = ""
s
func _ready():
	pass

func _process(delta):
	pass

# this function spawns the food
func spawn_food():
	var food = food_scenes[food_number].instantiate()
	food.global_position = spawn_location.global_position
	food_container.add_child(food)

func _on_spawn_button_pressed():
	spawn_food()

# these functions signal when the button is pressed/unpressed
func _on_button_button_down():
	pressed = true
	stack_or_not()
	print("pressed")
	# await get_tree().create_timer(1.0).timeout
	
func _on_button_button_up():
	pressed = false
	
	
# these functions signal when the food is inside the hitbox
func _on_burger_bottom_area_entered(area):
	inside = true

func _on_burger_bottom_area_exited(area):
	inside = false


func stack_or_not():
	if inside == true and pressed == true:
		if food_number <= len(food_scenes) - 1:
			food_number += 1
		else:
			food_number == 0
		print("yay")

	else:
		get_tree().reload_current_scene()
