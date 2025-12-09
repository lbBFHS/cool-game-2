extends CharacterBody2D
class_name Player
@export var move_speed: float = 100.0
@export var push_stregnth: float = 140.0
@export var accel
func move_player():
	var move_vector: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = move_vector * move_speed
	
	if velocity.x > 0:
		$AnimatedSprite2D.play("walk_right")
	elif velocity.x < 0: 
		$AnimatedSprite2D.play("walk_left")
	elif velocity.y > 0:
		$AnimatedSprite2D.play("walk_down")
	elif velocity.y < 0:
		$AnimatedSprite2D.play("walk_up")
	else:
		$AnimatedSprite2D.stop()
	move_and_slide()

func attack():
	is_attacking = true
	velocity = Vector2.ZERO
	$Weapon.visible = true
	%WeaponArea.monitoring = true
	$WeaponTimer.start()
	
	var player_animation: String = $AnimatedSprite2D.animation
func _on_weapon_area_body_entered(body: Node2D)
func _on_hit_box_entered(body: Node2D) -> void:
	SceneManager.player_hp -= 1
	print
func on_weapon_timer_timeout() -> void:
	
func _physics_process(delta: float) -> void:
	if not is_attacking:
			move_player()
	push_blocks()
	move_and_slide()
