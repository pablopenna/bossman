class_name Goblin extends Entity

func die(_damage):
	call_deferred("queue_free")
