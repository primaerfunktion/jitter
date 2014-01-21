package entities;

import flixel.FlxSprite;
import flixel.FlxG;

/**
 * ...
 * @author René Rother
 */
class Player extends FlxSprite
{
	public function new(x,y) 
	{
		super(x, y);
		makeGraphic(40, 80,0xff000000);
		
		maxVelocity.x = 50;
		maxVelocity.y = maxVelocity.x;
		
		forceComplexRender = true;
		
		drag.x = maxVelocity.x * 4;
		drag.y = drag.x;
	}
	
	override public function update() {
		
		acceleration.x = 0;
		acceleration.y = 0;
		
		if (FlxG.keys.pressed.LEFT) acceleration.x = -maxVelocity.x * 4;
		if (FlxG.keys.pressed.RIGHT) acceleration.x = maxVelocity.x * 4;
		if (FlxG.keys.pressed.UP) acceleration.y = -maxVelocity.x * 4;
		if (FlxG.keys.pressed.DOWN) acceleration.y = maxVelocity.x * 4;
		
		super.update();
	}
	
}