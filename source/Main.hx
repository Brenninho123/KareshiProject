package;

import openfl.display.Sprite; import flixel.FlxGame; import PlayState;

class Main extends Sprite {

public function new() {
    super();

    // Initialize Flixel game
    var game = new FlxGame(
        1280, // width
        720,  // height
        PlayState, // initial state
        60,   // update FPS
        60,   // draw FPS
        true  // skip splash
    );

    addChild(game);
}

}
