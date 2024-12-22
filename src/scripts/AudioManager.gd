extends Node

func _ready():
	if OS.has_feature("HTML5"):
		override_audio_api()

func override_audio_api():
	for child in get_tree().get_nodes_in_group("AudioStreamPlayers"):
		var id = str(child.get_instance_id())
		var file = child.stream.resource_path
		var browser_player = BrowserAudioPlayer.new(id, file)
		child.queue_free() # Remove native player
		add_child(browser_player) # Add browser-friendly player
