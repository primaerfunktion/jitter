package entities;

import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.group.FlxGroup;
import flixel.util.FlxRandom;
import flixel.FlxG;
import flixel.util.FlxPoint;

/**
 * ...
 * @author René Rother
 */
class Car extends FlxSprite
{

	public function new(X:Float=0, Y:Float=0, sprite : String) 
	{
		super(X, Y);
		loadGraphic(sprite, true, true, 20, 20, false);
		
		width = 12;
		height = 12;
		offset.x  = 2;
		offset.y = 2;
		
		//forceComplexRender = true;
		
		animation.add("up", [0]);
		animation.add("down", [2]);
		animation.add("left", [1]);
		
		maxVelocity.x = 40;
		maxVelocity.y = 40;
		drag.x = maxVelocity.x * 0.75;
		drag.y = drag.x;
		
		RandomDir();
	}
	
	override public function update():Void
	{	
		
		super.update();
		
		if (velocity.x > 0.1) {
			facing = FlxObject.RIGHT;
			animation.play("left");
		}
		else if (velocity.x < -0.1) {
			facing =  FlxObject.LEFT;
			animation.play("left");
		}
		if (velocity.y < -0.1) { 
			facing = FlxObject.UP;
			animation.play("up");
		}
		if (velocity.y > 0.1) {
			facing = FlxObject.DOWN;
			animation.play("down");
		}
	}
	
	public function Explode(dir : FlxPoint):Void {
		if (alive) {
			FlxG.camera.shake(0.01, 0.1);
			velocity.x = dir.x * 10;
			velocity.y = dir.y * 10;
			color = 0x999999;
			alive = false;
		}
	}
	
	public function Start():Void {
		reset(Math.random() * 10, Math.random());
		color = 0xffffff;
		alive = true;
		
		RandomDir();
	}
	
	public function RandomDir():Void {
		velocity.x = Math.random();
		if (Math.random() > 0.5) velocity.x *= -1;
		velocity.y = Math.random();
		if (Math.random() > 0.5) velocity.y *= -1;
	}
	
}