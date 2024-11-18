extends Area2D

func _on_body_entered(body: Node2D) -> void: # When I receive a signal that I've been touched...
	print("Coin collected!")
	queue_free() #This function deletes the node that this script is attached to.
