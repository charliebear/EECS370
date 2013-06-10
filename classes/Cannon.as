﻿package  {		import flash.display.MovieClip;			public class Cannon extends Hazard {						public var rate:Number;		public var fireState:Number;		public var power:Number;		public var generateBullet:Boolean = false;				public function Cannon(new_x:Number, new_y:Number, new_rate:Number = 30, new_power:Number = 5, new_direction:Number = 0) {			// constructor code			x = new_x;			y = new_y;			rate = new_rate;			power = new_power;			fireState = 0;			switch(new_direction)			{				case 0:					this.rotation = 0;					break;				case 1: 					this.rotation = 90;					break;				case 2: 					this.rotation = 180;					break;				case 3:					this.rotation = 270;					break;				default:					this.rotation = 0;					break;			}		}				public function Update()		{			fireState++;			if(fireState > rate)			{				if(OnStage())				{					fireState = 0;					generateBullet = true;				}else{					fireState -= Math.floor(Math.random()*rate/4) + rate/2;				}			}		}				public function CheckBullet():Boolean		{			if(generateBullet)			{				generateBullet = false;				return true;			}			return false;		}				public function OnStage():Boolean{			return ((x < (stage.stageWidth + width/2) && x > -width/2) && (y < stage.stageHeight + height/2 && y > -height/2));		}	}	}