// audio_bridge.js
const audioPlayers = {};

function createAudioPlayer(id, audioFile) {
    audioPlayers[id] = new Howl({
        src: [audioFile],
        html5: true, // Enables playing on mobile browsers
    });
}

function playAudio(id) {
    if (audioPlayers[id]) {
        audioPlayers[id].play();
    }
}

function stopAudio(id) {
    if (audioPlayers[id]) {
        audioPlayers[id].stop();
    }
}

function setVolume(id, volume) {
    if (audioPlayers[id]) {
        audioPlayers[id].volume(volume);
    }
}

// Expose functions to Godot
window.audioBridge = {
    createAudioPlayer,
    playAudio,
    stopAudio,
    setVolume,
};

