extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 22
const MAX_SPEED = 200
const ACCELERATION = 100
const JUMP_HEIGHT = -400
var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
	else:
		friction = true
		
		
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
		
	motion = move_and_slide(motion, UP)
