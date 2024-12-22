const audioPlayers = {};

function createAudioPlayer(id, audioFile) {
    // Resolve the audio file path relative to the current page's location
    const basePath = window.location.pathname.substring(0, window.location.pathname.lastIndexOf("/"));
    const resolvedPath = basePath + audioFile;

    audioPlayers[id] = new Howl({
        src: [resolvedPath],  // Use the resolved path
        html5: true,  // Enables playing on mobile browsers
    });
    console.log("Hello from the bridge.");
    console.log(audioPlayers);
    console.log(resolvedPath);
    audioPlayers[id].play();
}

function playAudio(id) {
    console.log("Playing audio from id: " + id);
    if (audioPlayers[id]) {
        console.log("playing audio from howler!");
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


