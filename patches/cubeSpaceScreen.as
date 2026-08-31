package
{
   import com.greensock.*;
   import com.greensock.easing.*;
   import flash.events.MouseEvent;
   import flash.display.MovieClip;
   
   public class cubeSpaceScreen extends cubeSpaceScreenMC
   {
      
      private var mouseDown:Boolean = false;
      
      private var rotSpeed:int = 3;
      
      private var size:int = 120;
      
      private var breed:int = 4;
      
      private var hoog:int = 1;
      
      private var diep:int = 1;
      
      private var cubesArray:Array;
      
      private var turning:Boolean = false;
      
      private var stageHeight:int = 480;
      
      private var stageWidth:int = 800;
      
      private var _progressNum:*;
      
      private var main:*;
      
      private static const FOCAL:Number = 320;
      
      public function cubeSpaceScreen(_main:*)
      {
         var z:* = undefined;
         var g:* = undefined;
         var cube:* = undefined;
         var cubeTxt:* = undefined;
         this.cubesArray = [];
         super();
         this.main = _main;
         this._progressNum = this.main.progressArray[this.main.gameID][0];
         for(var r:* = 0; r < this.breed; r++)
         {
            for(z = 0; z < this.hoog; z++)
            {
               for(g = 0; g < this.diep; g++)
               {
                  cube = new cube_seasonsMC();
                  addChild(cube);
                  cube.opened = false;
                  cube.played = false;
                  cube.num = r;
                  if(this._progressNum >= 4)
                  {
                     cube.opened = true;
                     this.makeCube(cube);
                  }
                  else if(r == this._progressNum)
                  {
                     cube.opened = true;
                     this.makeCube(cube);
                  }
                  else if(r < this._progressNum)
                  {
                     cube.played = true;
                     this.makeCube(cube,false,true);
                  }
                  else
                  {
                     this.makeCube(cube,false);
                  }
                  if(this._progressNum >= 10 && r > 0)
                  {
                     cube.visible = false;
                  }
                  cube.x = this.size * r - this.size * (this.breed - 1) / 2 + this.stageWidth / 2;
                  cube.posX = r;
                  cube.y = this.size * z - this.size * (this.hoog - 1) / 2 + this.stageHeight / 2 + 50;
                  cube.posY = z;
                  cube.clicked = false;
                  cube.startY = cube.y;
                  cube.posZ = g;
                  cube.startScale = cube.scaleX * 1.5;
                  cube.scaleX = cube.scaleY = cube.scaleZ = cube.startScale;
                  cube.rotationY = Math.round(Math.random() * 180);
                  this.cubesArray.push(cube);
                  this.startZweef(cube);
                  cube.buttonMode = true;
                  cubeTxt = new cubeTxtMC();
                  addChild(cubeTxt);
                  cubeTxt.x = cube.x;
                  cubeTxt.y = cube.y - 100;
                  if(r == 0)
                  {
                     this.main.makeTxtfield("Spring",cubeTxt.txt1,20);
                     this.main.makeTxtfield("1964",cubeTxt.txt2,20);
                  }
                  else if(r == 1)
                  {
                     this.main.makeTxtfield("Summer",cubeTxt.txt1,20);
                     this.main.makeTxtfield("1971",cubeTxt.txt2,20);
                  }
                  else if(r == 2)
                  {
                     this.main.makeTxtfield("Fall",cubeTxt.txt1,20);
                     this.main.makeTxtfield("1971",cubeTxt.txt2,20);
                  }
                  else if(r == 3)
                  {
                     this.main.makeTxtfield("Winter",cubeTxt.txt1,20);
                     this.main.makeTxtfield("1981",cubeTxt.txt2,20);
                  }
               }
            }
         }
         this.main.makeTxtfield("Pick your memory:",txt,20);
         for(var w:* = 0; w < this.cubesArray.length; w++)
         {
            this.rotateCube(this.cubesArray[w]);
         }
         addEventListener(MouseEvent.MOUSE_UP,this.stageMouseUp,false,0,true);
         addEventListener(MouseEvent.MOUSE_DOWN,this.stageMouseDown,false,0,true);
         addEventListener("enterFrame",this.onEnterFrame,false,0,true);
         this.fadeAchter();
         TweenLite.to(this,1,{"onComplete":this.savingProgress});
      }
      
      private function onEnterFrame(e:*) : void
      {
         for(var z:* = 0; z < this.cubesArray.length; z++)
         {
            this.projectCube(this.cubesArray[z]);
         }
      }
      
      private function savingProgress() : void
      {
         this.main.saveToDisk();
      }
      
      private function rotateCube(_cube:*, _speed:Number = 6, _delay:int = 0) : *
      {
         if(_speed < 0.1)
         {
            _speed = 0.1;
         }
         TweenLite.to(_cube,_speed,{
            "delay":_delay,
            "rotationY":_cube.rotationY + 360,
            "ease":Linear.easeNone,
            "onComplete":this.rotateCube,
            "onCompleteParams":[_cube,_speed,0]
         });
      }
      
      private function startZweef(_cube:*, _speed:Number = 3) : *
      {
         _speed = Math.ceil(Math.random() * 4) + 5;
         var _gotoY:* = _cube.y + Math.round(Math.random() * 100) - 50;
         if(_cube.y != _cube.startY)
         {
            _gotoY = _cube.startY;
         }
         TweenLite.to(_cube,_speed,{
            "y":_gotoY,
            "ease":Linear.easeNone,
            "onComplete":this.startZweef,
            "onCompleteParams":[_cube]
         });
      }
      
      private function chooseLevel(_num:*) : void
      {
         this.main.progressArray[this.main.gameID][5] = _num;
         this.main.openScreen("cubeTest");
      }
      
      private function fadeAchter() : *
      {
         var _speed:* = Math.ceil(Math.random() * 2) + 2;
         var _gotoAlpha:* = Math.random() * 1;
         if(this.getChildByName("achter1"))
         {
            TweenLite.to(this.getChildByName("achter1"),_speed,{
               "alpha":_gotoAlpha,
               "onComplete":this.fadeAchter
            });
         }
         if(this.getChildByName("achter2"))
         {
            TweenLite.to(this.getChildByName("achter2"),_speed,{"rotation":this.getChildByName("achter2").rotation + 10});
         }
      }
      
      private function toggleCube(cube:*, _up:Boolean = false) : *
      {
         if(_up && Boolean(cube.opened))
         {
            this.chooseLevel(cube.num + 1);
            cube.clicked = false;
         }
         else
         {
            cube.clicked = true;
            if(cube.played)
            {
               cube.light1.gotoAndStop(2);
               cube.light2.gotoAndStop(2);
            }
            else if(cube.opened)
            {
               this.rotateCube(cube,1);
               TweenLite.to(cube,0.2,{
                  "scaleX":cube.startScale * 1.3,
                  "scaleY":cube.startScale * 1.3,
                  "scaleZ":cube.startScale * 1.3
               });
            }
         }
      }
      
      private function makeCube(cube:*, _open:Boolean = true, _lightOn:Boolean = false) : *
      {
         cube.wall0.gotoAndStop(1);
         cube.wall2.gotoAndStop(2);
         cube.wall1.gotoAndStop(3);
         cube.wall3.gotoAndStop(4);
         cube.wall5.gotoAndStop(5);
         cube.wallBase.gotoAndStop(6);
         if(cube.num + 1 == 2)
         {
            cube.wall3.gotoAndStop(14);
         }
         if(cube.num + 1 == 3)
         {
            cube.wall3.gotoAndStop(18);
            cube.wall1.gotoAndStop(13);
         }
         if(cube.num + 1 == 4)
         {
            cube.wall3.gotoAndStop(14);
            cube.wall5.gotoAndStop(15);
         }
         if(!_open)
         {
            cube.wall0.gotoAndStop(50);
            cube.wall2.gotoAndStop(50);
            cube.wall1.gotoAndStop(50);
            cube.wall3.gotoAndStop(50);
            cube.wall5.gotoAndStop(50);
            cube.wallBase.gotoAndStop(50);
         }
         if(_lightOn)
         {
            cube.wall0.gotoAndStop(51);
            cube.wall2.gotoAndStop(51);
            cube.wall1.gotoAndStop(51);
            cube.wall3.gotoAndStop(51);
            cube.wall5.gotoAndStop(51);
            cube.wallBase.gotoAndStop(51);
         }
         var walls:Array = [cube.wall0, cube.wall1, cube.wall2, cube.wall3, cube.wall5, cube.wallBase];
         var big:MovieClip = cube.wall1;
         for(var wi:* = 0; wi < walls.length; wi++)
         {
            if(walls[wi] != big)
            {
               walls[wi].visible = false;
            }
         }
         big.visible = true;
         var s:Number = big.width / 2;
         if(isNaN(s) || s <= 0)
         {
            s = 20;
         }
         cube._s = s;
         cube._wallData = null;
         big.scaleX = 1;
         big.scaleY = 1;
         big.x = -s;
         big.y = -s + s;
         cube.light1.visible = false;
         cube.light2.visible = false;
         cube.addEventListener(MouseEvent.MOUSE_UP,this.clickCubeUp,false,0,true);
         cube.addEventListener(MouseEvent.MOUSE_DOWN,this.clickCubeDown,false,0,true);
      }
      
      private function projectPt(x:Number, y:Number, z:Number, cosY:Number, sinY:Number) : Object
      {
         return {x: 0, y: 0, z: 0};
      }
      
      private function projectCube(cube:*) : void
      {
         cube;
      }
      
      private function clickCubeUp(e:MouseEvent) : void
      {
         var _cube:* = e.currentTarget;
         this.toggleCube(_cube,true);
      }
      
      private function clickCubeDown(e:MouseEvent) : void
      {
         var _cube:* = e.currentTarget;
         this.toggleCube(_cube,false);
         Sounds.playSound("menuSelect",0.3);
      }
      
      private function unselectAll() : void
      {
         for(var r:* = 0; r < this.cubesArray.length; r++)
         {
            this.cubesArray[r].clicked = false;
            this.cubesArray[r].light1.gotoAndStop(1);
            this.cubesArray[r].light2.gotoAndStop(1);
            if(this.cubesArray[r].scaleX != this.cubesArray[r].startScale)
            {
               TweenLite.to(this.cubesArray[r],0.2,{
                  "scaleX":this.cubesArray[r].startScale,
                  "scaleY":this.cubesArray[r].startScale,
                  "scaleZ":this.cubesArray[r].startScale
               });
               this.rotateCube(this.cubesArray[r]);
            }
         }
      }
      
      private function stageMouseDown(e:MouseEvent) : void
      {
         this.mouseDown = true;
      }
      
      private function stageMouseUp(e:MouseEvent) : void
      {
         this.mouseDown = false;
         this.unselectAll();
      }
      
      public function update() : *
      {
      }
      
      public function openTxtWolk(_wolk:*, _delete:Boolean = false, _time:Number = 2) : *
      {
         if(_delete)
         {
            TweenLite.to(_wolk,0.5,{
               "alpha":0,
               "onComplete":this.deleteTxtWolk,
               "onCompleteParams":[_wolk]
            });
            return;
         }
         TweenLite.to(_wolk,0.5,{"alpha":1});
         TweenLite.to(_wolk,0.5,{
            "delay":_time,
            "alpha":0,
            "onComplete":this.deleteTxtWolk,
            "onCompleteParams":[_wolk]
         });
      }
      
      public function deleteTxtWolk(_wolk:*) : void
      {
         removeChild(_wolk);
      }
      
      public function remove() : void
      {
         for(var r:* = 0; r < this.cubesArray.length; r++)
         {
            this.cubesArray[r].removeEventListener(MouseEvent.MOUSE_UP,this.clickCubeUp);
            this.cubesArray[r].removeEventListener(MouseEvent.MOUSE_DOWN,this.clickCubeDown);
         }
         removeEventListener(MouseEvent.MOUSE_UP,this.stageMouseUp);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.stageMouseDown);
      }
   }
}
