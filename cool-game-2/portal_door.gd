extends StaticBody2D

@export var button_presses_needed: int = 1
var bodies_on_button: int = 0

func _on_puzzle_button_pressed() -> void:
	bodies_on_button += 1
	if bodies_on_button ==1:
		visible = false
		$CollisionShape2D.set_deferred("disabled", true)

func _on_puzzle_button_unpressed() -> void:
	bodies_on_button -= 1
	if bodies_on_button == 0:
		visible = true
		$CollisionShape2D.set_deferred("disabled", false)
