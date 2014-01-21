package ;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up.
	 */
	override public function create():Void
	{
		// Set a background color
		FlxG.cameras.bgColor = 0xff131c1b;
		FlxG.mouse.hide();
		
		var title : FlxText = new FlxText(10, 10, 100, "Zilla", 20);
		title.font = Reg.textfont;
		add(title);
		
		var subtitle : FlxText = new FlxText(10, 30, 200, "Press X to start", 20);
		subtitle.font = Reg.textfont;
		subtitle.alpha = 0.8;
		add(subtitle);

		super.create();
	}

	/**
	 * Function that is called when this state is destroyed - you might want to
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		if (FlxG.keys.justPressed.X) FlxG.switchState(new PlayState());

		super.update();
	}
}