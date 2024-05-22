extends CharacterBody2D

func _process(delta):
	var direction = Vector2.RIGHT
	velocity = direction * 200
	move_and_slide()
