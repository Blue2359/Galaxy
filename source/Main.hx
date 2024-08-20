package;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	final fps:Int = 15;

	public function new()
	{
		super();
		addChild(new FlxGame(PlayState, fps, fps, true));
		FlxG.autoPause = false;
		FlxG.mouse.useSystemCursor = true;
	}
}
