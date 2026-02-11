package;

import flixel.FlxState; import flixel.FlxG; import flixel.FlxSprite; import flixel.group.FlxGroup; import flixel.util.FlxColor; import flixel.FlxObject; import flixel.input.keyboard.FlxKeyboard;

class PlayState extends FlxState { var player:FlxSprite; var bullets:FlxGroup;

override public function create():Void
{
    super.create();

    // Background color
    FlxG.camera.bgColor = FlxColor.BLACK;

    // Player setup
    player = new FlxSprite(FlxG.width / 2 - 8, FlxG.height - 60);
    player.makeGraphic(16, 16, FlxColor.WHITE);
    add(player);

    // Bullet group
    bullets = new FlxGroup();
    add(bullets);
}

override public function update(elapsed:Float):Void
{
    super.update(elapsed);

    handleMovement(elapsed);
    handleShooting();
}

function handleMovement(elapsed:Float):Void
{
    var speed:Float = 200;

    // Focus mode (slow movement)
    if (FlxG.keys.pressed.SHIFT)
        speed = 100;

    player.velocity.set(0, 0);

    if (FlxG.keys.pressed.LEFT)  player.velocity.x = -speed;
    if (FlxG.keys.pressed.RIGHT) player.velocity.x = speed;
    if (FlxG.keys.pressed.UP)    player.velocity.y = -speed;
    if (FlxG.keys.pressed.DOWN)  player.velocity.y = speed;

    // Keep player on screen
    player.x = FlxMath.bound(player.x, 0, FlxG.width - player.width);
    player.y = FlxMath.bound(player.y, 0, FlxG.height - player.height);
}

function handleShooting():Void
{
    if (FlxG.keys.pressed.Z)
    {
        spawnBullet();
    }
}

function spawnBullet():Void
{
    var bullet = new FlxSprite(player.x + player.width / 2 - 2, player.y - 8);
    bullet.makeGraphic(4, 8, FlxColor.CYAN);
    bullet.velocity.y = -400;

    bullets.add(bullet);
}

}