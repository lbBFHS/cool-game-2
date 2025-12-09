extends CharacterBody2D

@export var speed: int = 75
var target: Node2D

func _physics_process(delta: float) -> void:
	if target: 
		chasing()
	else:
		pass
	animate_enemy()
	move_and_slide()

func animate_enemy():
	var normal_velocity: Vector2 = velocity.normalized()
	if normal_velocity.x > 0.7:
		$AnimatedSprite2D.play("right")
	elif  normal_velocity.x < -0.7:
		$AnimatedSprite2D.play("left")
	elif normal_velocity.y > 0.7:
		$AnimatedSprite2D.play("down")
	elif  normal_velocity.y < -0.7:
		$AnimatedSprite2D.play("up")
	else:
		$AnimatedSprite2D.play("default")

func chasing():
	var distance_to_player: Vector2
	distance_to_player = target.global_position - global_position
	var directiom_normal: Vector2 = distance_to_player.normalized()
	if speed > 0.0:
		speed -= 0.01
	velocity = directiom_normal * speed

func _on_chasing_radius_body_entered(body: Node2D) -> void:
	if body is Player:
		target = body
		speed = 75
