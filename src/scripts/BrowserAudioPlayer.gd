extends Node

# A wrapper for Godot's AudioStreamPlayer that redirects calls to Howler.js if running in a browser.

class_name BrowserAudioPlayer

var is_browser := OS.has_feature("HTML5")
var player_id: String
var file_path: String

func _init(_player_id: String, _file_path: String):
	player_id = _player_id
	file_path = _file_path
	if is_browser:
		# Use Howler.js for audio playback (pass both player_id and file_path as a string)
		var js_code = "audioBridge.createAudioPlayer('" + player_id + "', '" + file_path + "');"
		JavaScript.eval(js_code)

func play():
	if is_browser:
		var js_code = "audioBridge.playAudio('" + player_id + "');"
		JavaScript.eval(js_code)
	else:
		$AudioStreamPlayer.play()

func stop():
	if is_browser:
		var js_code = "audioBridge.stopAudio('" + player_id + "');"
		JavaScript.eval(js_code)
	else:
		$AudioStreamPlayer.stop()

func set_volume(volume: float):
	if is_browser:
		var js_code = "audioBridge.setVolume('" + player_id + "', " + str(volume) + ");"
		JavaScript.eval(js_code)
	else:
		$AudioStreamPlayer.volume_db = linear2db(volume)

func is_playing() -> bool:
	if is_browser:
		return JavaScript.eval("audioBridge.isPlaying('" + player_id + "');")
	else:
		return $AudioStreamPlayer.is_playing()
