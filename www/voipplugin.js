window.keepSocketAlive = function(str, callback) {
    cordova.exec(callback, function(err) {
        callback('Could not keep Socket Alive');
    }, "VoIPMode", "keepSocketAlive", [str]);
};
