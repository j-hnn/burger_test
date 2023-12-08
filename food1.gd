extends Area2D

@export var speed = 150

func _physics_process(delta):
	global_position.y += speed * delta # moves the food down

# this function deletes the food whenever it leaves the screen
func _on_visible_on_screen_notifier_2d_screen_exited():
	print("exited screen")
	die()
	
# die fucntion
func die():
	queue_free()
	print("despawned")
