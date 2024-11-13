extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])
	
	var velocity = self.linear_velocity
	
	# print("velocity.x < 0 = " + str(velocity.x < 0))
	$AnimatedSprite2D.flip_h = velocity.x < 0
	
	# print("velocity.y < 0 = " + str(velocity.y < 0))
	$AnimatedSprite2D.flip_v = velocity.y > 0
	
	$AnimatedSprite2D.play()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
