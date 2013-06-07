﻿﻿package  {		import flash.display.MovieClip;	import flash.events.Event;	import flash.events.KeyboardEvent;	import flash.ui.Keyboard;	import flash.media.SoundChannel;	import flash.utils.getQualifiedClassName;	import com.coreyoneil.collision.CollisionList;	import com.coreyoneil.collision.CollisionGroup;	public class PlatformerMain extends MovieClip {		public var backgroundMusic:BackgroundMusic;		public var bgmSoundChannel:SoundChannel;		var myPlayer:Player;		var upPressed:Boolean = false;		var upWasPressed:Boolean = false;		var downPressed:Boolean = false;		var leftPressed:Boolean = false;		var rightPressed:Boolean = false;		var isPlayerDead:Boolean = false;		var isPlayerFinished:Boolean = false;		var collisions:CollisionList;		var environment:Array;		var myEnemies:Array;		var envMoved:Boolean = false;		var xmin:Number;//left side of the stage		var xmax:Number;//right side of the stage		var offset:Number;//how much the environment is offset 		var levelNum:Number;		var scrollFraction:Number = .6; 		var firstRun:Boolean = true;		//var hasJetpack:Boolean;		//how far across the screen the player should be before the screen scrolls		//(to keep the player in a reasonable place on the screen)						public function PlatformerMain(level:Number, jetpack:Boolean) {			// constructor code			environment = [];			myEnemies = [];			levelNum = level;			myPlayer = new Player( 50, 300, jetpack);			//addChild(myPlayer);			collisions = new CollisionList(myPlayer);			/*collisions.returnAngle = true;			collisions.returnAngleType = "Degrees";*/			addEventListener( Event.ADDED_TO_STAGE, onAddToStage );		}				public function constructDemo(){			var newtile:Tile = new Tile(50,550);			environment.push(newtile);			newtile = new Tile(150,550);			environment.push(newtile);						var myCannon = new Cannon(50,50,20,5,0);			myEnemies.push(myCannon);			myCannon = new Cannon(50,100,20,5,1);			myEnemies.push(myCannon);			myCannon = new Cannon(50,150,20,5,2);			myEnemies.push(myCannon);			myCannon = new Cannon(50,200,20,5,3);			myEnemies.push(myCannon);						//gap			//newtile = new Tile(300,550);			//environment.push(newtile);			//second gap			newtile = new Tile(400,550);			environment.push(newtile);			//stairs			newtile = new Tile(600,500);			environment.push(newtile);			newtile = new Tile(700,450);			environment.push(newtile);			//down stairs			newtile = new Tile(800,500);			environment.push(newtile);			newtile = new Tile(900,550);			environment.push(newtile);			newtile = new Tile(1000,550);			environment.push(newtile);			//second gap			newtile = new Tile(1200,550);			environment.push(newtile);			newtile = new Tile(1300,550);			environment.push(newtile);			var finish:Goal = new Goal(1300,450,1);			environment.push(finish);			for(var j = 0; j < myEnemies.length; j++)			{				environment.push(myEnemies[j]);			}						for(var i = 0; i < environment.length; i++){				collisions.addItem(environment[i]);				addChild(environment[i]);			}			offset = 0;			xmin = 0;			xmax = 1350;			addChild(myPlayer);		}		public function constructLevel1() {			var newtile:Tile = new Tile(50,550);			environment.push(newtile);						newtile = new Tile(150, 450);			environment.push(newtile);						newtile = new Tile(150,550);			environment.push(newtile);			//column			newtile = new Tile(350,550);			environment.push(newtile);			newtile = new Tile(350,450);			environment.push(newtile);			newtile = new Tile(350,350);			environment.push(newtile);			newtile = new Tile(350,250);			environment.push(newtile);			newtile = new Tile(350,150);			environment.push(newtile);			newtile = new Tile(250,150);			environment.push(newtile);						newtile = new Tile(450, 350);			environment.push(newtile);						newtile = new Tile(550, 350);			environment.push(newtile);						newtile = new Tile(650, 350);			environment.push(newtile);						newtile = new Tile(550, 150);			environment.push(newtile);						newtile = new Tile(550, 50);			environment.push(newtile);						newtile = new Tile(800, 0);			environment.push(newtile);						newtile = new Tile(250, 370);			environment.push(newtile);			//top left stair-gap			newtile = new Tile(50, 270);			environment.push(newtile);												//second gap			newtile = new Tile(450,550);			environment.push(newtile);			//stairs			newtile = new Tile(550,500);			environment.push(newtile);			newtile = new Tile(650,450);			environment.push(newtile);			//down stairs			newtile = new Tile(750,500);			environment.push(newtile);			newtile = new Tile(850,550);			environment.push(newtile);			newtile = new Tile(950,550);			environment.push(newtile);			//second gap			newtile = new Tile(1100,550);			environment.push(newtile);			newtile = new Tile(1200,550);			environment.push(newtile);			var finish:Goal = new Goal(1200,450,2);			environment.push(finish);						var warp:Warp = new Warp(1150,100,4);			environment.push(warp);						var enemy1:Enemy = new Enemy(1025,375, 60, 2, false);			environment.push(enemy1);			myEnemies.push(enemy1);						enemy1 = new Enemy(700, 250, 90, 1, true);			environment.push(enemy1);			myEnemies.push(enemy1);						for(var j = 0; j < myEnemies.length; j++)			{				environment.push(myEnemies[j]);			}			for(var i = 0; i < environment.length; i++){				collisions.addItem(environment[i]);				addChild(environment[i]);			}			offset = 0;			xmin = 0;			xmax = 1250;			addChild(myPlayer);		}				public function constructLevel2() {			myPlayer.setPosition(50,350);			var newtile:Tile = new Tile(50,500);			environment.push(newtile);			newtile = new Tile(-50,400);			environment.push(newtile);			newtile = new Tile(-50,300);			environment.push(newtile);			newtile = new Tile(150, 450);			environment.push(newtile);			newtile = new Tile(250, 450);			environment.push(newtile);			newtile = new Tile(350, 450);			environment.push(newtile);						var myCannon = new Cannon(30,250,35,5,2);			myEnemies.push(myCannon);			myCannon = new Cannon(450,50,25,5,3);			myEnemies.push(myCannon);						var newElectric = new ElectricFloor(450,415);			environment.push(newElectric);			newElectric = new ElectricFloor(850,415);			environment.push(newElectric);			newtile = new Tile(550,450);			environment.push(newtile);			newtile = new Tile(650,450);			environment.push(newtile);			newtile = new Tile(750,450);			environment.push(newtile);			newElectric = new ElectricWall(580,300);			environment.push(newElectric);			newElectric = new ElectricWall(730,300);			environment.push(newElectric);			newtile = new Tile(950,450);			environment.push(newtile);			newtile = new Tile(1050,450);			environment.push(newtile);			newtile = new Tile(1150,580);			environment.push(newtile);						myCannon = new Cannon(850,50,25,7,3);			myEnemies.push(myCannon);			myCannon = new Cannon(1050,380,35,5,0);			myEnemies.push(myCannon);						var finish:Goal = new Goal(1150,480,3);			environment.push(finish);						for(var j = 0; j < myEnemies.length; j++)			{				environment.push(myEnemies[j]);			}			for(var i = 0; i < environment.length; i++){				collisions.addItem(environment[i]);				addChild(environment[i]);			}			offset = 0;			xmin = 0;			xmax = 1200;			addChild(myPlayer);		}				public function constructLevel3() {			myPlayer.setPosition(50, 350);			var newtile:Tile = new Tile(50,500);			environment.push(newtile);			newtile = new Tile(50,600);			environment.push(newtile);			// Ensure player can't fall off this edge			newtile = new Tile(-50,400);			environment.push(newtile);						newtile = new Tile(-50,300);			environment.push(newtile);			newtile = new Tile(-50,200);			environment.push(newtile);			newtile = new Tile(-50,100);			environment.push(newtile);			newtile = new Tile(-50,0);			environment.push(newtile);			newtile = new Tile(-50,-100);			environment.push(newtile);			newtile = new Tile(-50,-200);			environment.push(newtile);			newtile = new Tile(-50,-300);			environment.push(newtile);			newtile = new Tile(-50,-400);			environment.push(newtile);			newtile = new Tile(-50,-500);			environment.push(newtile);			newtile = new Tile(-50,-600);			environment.push(newtile);			newtile = new Tile(-50,-700);			environment.push(newtile);			newtile = new Tile(-50,-800);			environment.push(newtile);			newtile = new Tile(-50,-900);			environment.push(newtile);			newtile = new Tile(-50,-1000);			environment.push(newtile);						newtile = new Tile(150,600);			environment.push(newtile);			newtile = new Tile(150,500);			environment.push(newtile);			newtile = new Tile(150,400);			environment.push(newtile);						newtile = new Tile(250,600);			environment.push(newtile);			newtile = new Tile(250,500);			environment.push(newtile);			newtile = new Tile(250,400);			environment.push(newtile);			newtile = new Tile(250,300);			environment.push(newtile);						newtile = new Tile(350,600);			environment.push(newtile);			newtile = new Tile(350,500);			environment.push(newtile);			newtile = new Tile(350,400);			environment.push(newtile);			newtile = new Tile(350,300);			environment.push(newtile);			newtile = new Tile(350,200);			environment.push(newtile);						var jetpack:Jetpack = new Jetpack(450, 35);			environment.push(jetpack);						newtile = new Tile(450,600);			environment.push(newtile);			newtile = new Tile(450,500);			environment.push(newtile);			newtile = new Tile(450,400);			environment.push(newtile);			newtile = new Tile(450,300);			environment.push(newtile);			newtile = new Tile(450,200);			environment.push(newtile);			newtile = new Tile(450,100);			environment.push(newtile);						newtile = new Tile(550,600);			environment.push(newtile);						enemy1 = new Enemy(800,150,90, 1, false);			environment.push(enemy1);			myEnemies.push(enemy1);						newtile = new Tile(850,250);			environment.push(newtile);						enemy1 = new Enemy(1300,300,60, 2, true);			environment.push(enemy1);			myEnemies.push(enemy1);			newtile = new Tile(1250,400);			environment.push(newtile);			newtile = new Tile(1250,500);			environment.push(newtile);			newtile = new Tile(1250,600);			environment.push(newtile);						newtile = new Tile(1550,500);			environment.push(newtile);			newtile = new Tile(1550,600);			environment.push(newtile);			newtile = new Tile(1650,500);			environment.push(newtile);			newtile = new Tile(1650,600);			environment.push(newtile);			var enemy1:Enemy = new Enemy(1750,400, 90, 3, true);			environment.push(enemy1);			myEnemies.push(enemy1);									newtile = new Tile(2050,200);			environment.push(newtile);			newtile = new Tile(2050,300);			environment.push(newtile);			newtile = new Tile(2050,400);			environment.push(newtile);			newtile = new Tile(2050,500);			environment.push(newtile);			newtile = new Tile(2050,600);			environment.push(newtile);						enemy1 = new Enemy(2325,450, 70, 5, false);			environment.push(enemy1);			myEnemies.push(enemy1);			newtile = new Tile(2450,550);			environment.push(newtile);			newtile = new Tile(2550,550);			environment.push(newtile);			newtile = new Tile(2650,550);			environment.push(newtile);			newtile = new Tile(2750,550);			environment.push(newtile);			newtile = new Tile(2750,450);			environment.push(newtile);			newtile = new Tile(2850,550);			environment.push(newtile);			newtile = new Tile(2850,450);			environment.push(newtile);						var finish:Goal = new Goal(2850,350,4);			environment.push(finish);						for(var j = 0; j < myEnemies.length; j++)			{				environment.push(myEnemies[j]);			}			for(var i = 0; i < environment.length; i++){				collisions.addItem(environment[i]);				addChild(environment[i]);			}			offset = 0;			xmin = 0;			xmax = 2900;			addChild(myPlayer);		}				public function onAddToStage( event:Event ):void		{			if (firstRun) 			{				backgroundMusic = new BackgroundMusic();				bgmSoundChannel = backgroundMusic.play(0, 100);			}			stage.addEventListener( KeyboardEvent.KEY_DOWN, setKeyPressed  );			stage.addEventListener( KeyboardEvent.KEY_UP, unsetKeyPressed );			addEventListener(Event.ENTER_FRAME, executeFrame);			xmin = 0;			xmax = stage.width;			switch (levelNum % 4)			{				case 0:				constructDemo();				break;								case 1:				constructLevel1();				break;								case 2: 				constructLevel2();				break;								case 3:				default:				scrollFraction = 0.5;				constructLevel3();				break;			}								}				function executeFrame(event:Event)		{			if (!isPlayerFinished && !isPlayerDead) 			{				movePlayer(event);				updateEnemies();				handleCollisions();				envMoved = false;			}		}				function removeFromArray(item:Object, array:Array)		{			var index = array.indexOf(item);			if(index != -1)			{				array.splice(index,1);			}		}				function handleCollisions()		{			//do stuff here			var collisionArray:Array = collisions.checkCollisions();			var other;			for(var i = 0; i < collisionArray.length; i++){				if(collisionArray[i].object1 == myPlayer)				{					other = collisionArray[i].object2;				}else{					other = collisionArray[i].object1;				}				if(other is Goal)				{					if ( !isPlayerFinished && !isPlayerDead)					{						isPlayerFinished = true;						dispatchEvent(new AvatarEvent(AvatarEvent.GOAL_REACHED, other.nextLevel));						stage.removeEventListener( KeyboardEvent.KEY_DOWN, setKeyPressed );						stage.removeEventListener( KeyboardEvent.KEY_UP, unsetKeyPressed );						break;					}				}else if(other is Jetpack)				{					//hasJetpack = true;					myPlayer.hasJetpack = true;					removeFromArray(other,environment);					collisions.removeItem(other);					removeChild(other);									}				else if((other is Enemy) || (other is Hazard))				{					if (!isPlayerDead && !isPlayerFinished)					{						isPlayerDead = true;						dispatchEvent( new AvatarEvent( AvatarEvent.DEAD ) );						stage.removeEventListener( KeyboardEvent.KEY_DOWN, setKeyPressed );						stage.removeEventListener( KeyboardEvent.KEY_UP, unsetKeyPressed );						break;					}				}				else				{					if (!(isPlayerDead || isPlayerFinished))					{					//it's a wall						if ( Math.abs(other.y -myPlayer.y) < ( (other.height/2) + (myPlayer.height/2) ) && Math.abs(other.x -myPlayer.x) < (other.width/2 + myPlayer.width*3/8) )						{							if(Math.abs(myPlayer.x - other.x) < (other.width/2))							{								if(myPlayer.dy > 0 && myPlayer.y < other.y)								{									myPlayer.y = other.y - other.height/2 - myPlayer.height/2;									myPlayer.dy = 0;									myPlayer.Land(other);									upWasPressed = false;								}else if(myPlayer.dy < 0 && myPlayer.y > other.y)								{									myPlayer.y = other.y + other.height/2 + myPlayer.height/2;									myPlayer.dy = 0;								}else{								//do nothing								}							}						}					}				}			}			collisionArray = collisions.checkCollisions();			for(i = 0; i < collisionArray.length; i++){				if(collisionArray[i].object1 == myPlayer)				{					other = collisionArray[i].object2;				}else{					other = collisionArray[i].object1;				}				if(other is Goal && !isPlayerFinished)				{					isPlayerFinished = true;					dispatchEvent(new AvatarEvent(AvatarEvent.GOAL_REACHED, other.nextLevel));					break;				}				if ( !isPlayerFinished && !isPlayerDead)				{					//colliding in the X direction					if ( Math.abs(other.x -myPlayer.x) < ( (other.width/2) + (myPlayer.width/2) ) && Math.abs(other.y -myPlayer.y) < (other.height/2 + myPlayer.height*3/8) )					{						if( Math.abs(myPlayer.y - other.y) < (other.height/2))						{							if(myPlayer.dx > 0 && myPlayer.x < other.x)							{							myPlayer.x = other.x - other.width/2 - myPlayer.width/2;							myPlayer.dx = 0;							myPlayer.onWall = 1;							myPlayer.HitWall(other);							}else if(myPlayer.dx < 0 && myPlayer.x > other.x){							myPlayer.x = other.x + other.width/2 + myPlayer.width/2;							myPlayer.dx = 0;							myPlayer.onWall = -1;							myPlayer.HitWall(other);							}else{							//do nothing							}						}					}				}			}		}						function moveEnvironment(amt:Number)		{			//if you've reached the edge of the stage in either direction			if(((offset + amt) > (xmax - stage.stageWidth))||((offset + amt) < xmin))			{				myPlayer.x += amt;			}			else{				envMoved = true;				var item;								for(var i = 0; i < environment.length; i++)				{					item = environment[i];					item.x -= amt;				}				offset += amt;			}		}				function updateEnemies()		{						for (var i = 0; i < myEnemies.length; i++)			{				if(myEnemies[i] is Enemy)				{										if (myEnemies[i].timer >= myEnemies[i].roamTime) 					{						myEnemies[i].goingLeft = !myEnemies[i].goingLeft; // change direction						myEnemies[i].timer = 0; // reset timer					}					if (myEnemies[i].goingLeft)					{						myEnemies[i].x -= myEnemies[i].speed; // Go Left if we're supposed to.						if(envMoved)						{							myEnemies[i].x += myPlayer.dx;						}					}					else 					{						myEnemies[i].x += myEnemies[i].speed; // Otherwise go right						if(envMoved)						{							myEnemies[i].x += myPlayer.dx;						}					}										myEnemies[i].timer += 1; // Increment timer.				}				else if (myEnemies[i] is Cannon)				{					var temp:Cannon = myEnemies[i];					temp.Update();					if(temp.CheckBullet())					{						if(temp.OnStage())						{							var temp2;							switch(temp.rotation)							{								case 0:									temp2 = new Bullet(temp.x - 20, temp.y, -temp.power, 0);									break;								case 90:									temp2 = new Bullet(temp.x, temp.y-15, 0, -temp.power);									break;								case 180:									temp2 = new Bullet(temp.x + 20, temp.y, temp.power, 0);									break;								default:									temp2 = new Bullet(temp.x, temp.y+15, 0, temp.power);									break;							}							myEnemies.push(temp2);							environment.push(temp2);							collisions.addItem(temp2);							addChild(temp2);						}					}				}				else if (myEnemies[i] is Bullet)				{					var tempBullet:Bullet = myEnemies[i];					tempBullet.Move();				}			}		}				function movePlayer(event:Event)		{			if(myPlayer.onPlatform){				myPlayer.CheckFloor();			}						if (!myPlayer.onPlatform)			{				myPlayer.dy = Math.min(myPlayer.dy + 5, 40);			}			if (upPressed)			{				if(upWasPressed){					if(myPlayer.jetpackOn())					{						myPlayer.dy = Math.max(myPlayer.dy-6,-20);					}else if( myPlayer.dy <= -10){						myPlayer.dy = Math.max(myPlayer.dy-2.5,-25);					}				}else{					if(myPlayer.onPlatform){						myPlayer.dy = -25;						myPlayer.onPlatform = false;						upWasPressed = true;					}else if(myPlayer.jetpackOn())					{						if(myPlayer.dy > 0)						{							myPlayer.dy = Math.max(myPlayer.dy/2-3,-20);						}else{							myPlayer.dy = Math.max(myPlayer.dy-6,-20);						}						upWasPressed = true;					}				}			}			/*if (downPressed)			{				myPlayer.dy = Math.min(myPlayer.dy+2, 10);			}*/			if (leftPressed)			{				if(myPlayer.dx >= 0){					myPlayer.dx = Math.floor(myPlayer.dx / 2) - 3;				}else{					myPlayer.dx = Math.max(myPlayer.dx-3, -15);				}			}			if (rightPressed)			{				if(myPlayer.dx <= 0){					myPlayer.dx = Math.floor(myPlayer.dx / 2) + 3;				}else{					myPlayer.dx = Math.min(myPlayer.dx+3, 15);				}			}			if (!rightPressed && !leftPressed)			{				myPlayer.dx = 0;			}			/*if (!downPressed && !upPressed)			{				myPlayer.dy = 0;			}*/			if(myPlayer.onWall == 0){				if((myPlayer.x >= (stage.stageWidth * scrollFraction) && myPlayer.dx > 0) || (myPlayer.x <= (stage.stageWidth * (1-scrollFraction)) && myPlayer.dx < 0))				{					moveEnvironment(myPlayer.dx);				}else{					myPlayer.x += myPlayer.dx;				}			}else if(myPlayer.onWall == 1){				if(myPlayer.dx < 0){					myPlayer.onWall = 0;				}else{					myPlayer.CheckWall();				}				if((myPlayer.x >= (stage.stageWidth * scrollFraction) && myPlayer.dx > 0) || (myPlayer.x <= (stage.stageWidth * (1-scrollFraction)) && myPlayer.dx < 0))				{					moveEnvironment(myPlayer.dx);				}else{					myPlayer.x += myPlayer.dx;				}			}else if(myPlayer.onWall == -1){				if(myPlayer.dx > 0){				myPlayer.onWall = 0;				}else{					myPlayer.CheckWall();				}				if((myPlayer.x >= (stage.stageWidth * scrollFraction) && myPlayer.dx > 0) || (myPlayer.x <= (stage.stageWidth * (1-scrollFraction)) && myPlayer.dx < 0))				{					moveEnvironment(myPlayer.dx);				}else{					myPlayer.x += myPlayer.dx;				}			}else{				//do nothing			}						myPlayer.y += myPlayer.dy;			if(myPlayer.y > (600 - myPlayer.height / 2))			{				isPlayerDead = true;				//gameTimer.stop();				dispatchEvent( new AvatarEvent( AvatarEvent.DEAD ) );				/*myPlayer.y = 600 - myPlayer.height / 2;				myPlayer.Land();				upWasPressed = false;*/			}		}		function setKeyPressed(event:KeyboardEvent):void		{			switch (event.keyCode)			{				case Keyboard.UP:				case Keyboard.SPACE:				{					if(upPressed){						//upWasPressed = true;					}else{						upPressed = true;						upWasPressed = false;					}					break;				}				case Keyboard.DOWN:				{					downPressed = true;					break;				}				case Keyboard.LEFT:				{					leftPressed = true;					break;				}				case Keyboard.RIGHT:				{					rightPressed = true;					break;				}			}		}				function unsetKeyPressed(event:KeyboardEvent):void		{			switch (event.keyCode)			{				case Keyboard.UP:				{					upPressed = false;					break;				}				case Keyboard.DOWN:				{					downPressed = false;					break;				}				case Keyboard.LEFT:				{					leftPressed = false;					break;				}				case Keyboard.RIGHT:				{					rightPressed = false;					break;				}			}		}	}	}