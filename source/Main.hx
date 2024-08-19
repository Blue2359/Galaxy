package;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	final fps:Int = 30;

	public function new()
	{
		super();
		addChild(new FlxGame(PlayState, fps, fps, true));
		FlxG.autoPause = false;
		FlxG.mouse.useSystemCursor = true;
	}
}
