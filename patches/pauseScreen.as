package
{
   import com.greensock.*;
   import com.greensock.easing.*;
   
   public class pauseScreen extends pauseScreenMC
   {
      
      private var main:*;
      
      private var button_info:Array = [];
      
      private var button_icon:*;
      
      public var game_selected:int = 1;
      
      public var ach_reset:Boolean = false;
      
      public function pauseScreen(_main:*)
      {
         super();
         this.main = _main;
         if(this.main.onMobile <= 0)
         {
            stop();
         }
         else if(this.main.chinese)
         {
            gotoAndStop(3);
         }
         else if(this.main.korean)
         {
            gotoAndStop(4);
         }
         else if(Boolean(this.main.onMobile) && Boolean(this.main.collection))
         {
            gotoAndStop(4);
         }
         else
         {
            gotoAndStop(2);
         }
         if(this.main.collection)
         {
            this.game_selected = this.main.gameID = this.main.settingArray[8];
         }
         else
         {
            this.game_selected = this.main.gameID;
         }
         for(var r:* = 0; r < 100; r++)
         {
            if(this.getChildByName("knop" + r))
            {
               this.main.menuClass.makeButton(this.getChildByName("knop" + r),r,"pause");
               if(r == 57 && Boolean(this.main.settingArray[1]))
               {
                  knop57.binnen.gotoAndStop(2);
               }
               if(r == 99 && Boolean(this.main.collection))
               {
                  knop99.binnen.gotoAndStop(this.game_selected);
               }
            }
            if(this.getChildByName("txt" + r))
            {
               this.main.menuClass.makeTxt(this.getChildByName("txt" + r),"txt" + r,"pause");
            }
         }
         if(this.main.settingArray[12])
         {
            this.main.settingArray[12] = 0;
            this.setBox(box,7);
            if(Boolean(pijl) && Boolean(this.getChildByName("knop57")))
            {
               pijl.x = knop57.x;
            }
         }
         else
         {
            this.setBox(box,1);
            pijl.x = knop51.x;
         }
         TweenLite.to(this,Math.random() * 3 + 0.5,{"onComplete":this.wobble});
      }
      
      public function wobble() : *
      {
         if(this.main == undefined)
         {
            trace("stop wobble");
            return;
         }
         if(box.currentFrame == 2)
         {
            return;
         }
         if(this.getChildByName("knop52"))
         {
            knop52.play();
            TweenMax.to(knop52,0.9,{
               "rotation":20,
               "x":knop52.x + 10,
               "yoyo":true,
               "repeat":1
            });
         }
         TweenLite.to(this,Math.random() * 3 + 3,{"onComplete":this.wobble});
      }
      
      public function openBox(_num:*, _force:Boolean = false) : *
      {
         if(_num == box.currentFrame && !_force)
         {
            return;
         }
         if(Boolean(this.main.collection) && Boolean(this.game_selected == 0) && _num == 8)
         {
            TweenLite.to(black,0.3,{
               "alpha":1,
               "onComplete":this.setBox,
               "onCompleteParams":[box,10,true]
            });
         }
         else
         {
            TweenLite.to(black,0.3,{
               "alpha":1,
               "onComplete":this.setBox,
               "onCompleteParams":[box,_num,true]
            });
         }
         black.visible = true;
         black.alpha = 0;
         if(Boolean(pijl) && Boolean(this.getChildByName("knop" + (_num + 50))))
         {
            TweenLite.to(pijl,0.3,{"x":this.getChildByName("knop" + (_num + 50)).x});
         }
      }
      
      public function openReset() : *
      {
         if(box.txt21.visible)
         {
            return;
         }
         box.txt21.visible = true;
         box.knop21.visible = true;
         box.knop22.visible = true;
         box.achievement_reset.visible = true;
         box.txt21.alpha = 1;
         box.knop21.alpha = 1;
         box.knop22.alpha = 1;
         box.achievement_reset.alpha = 1;
         TweenLite.from(box.txt21,0.5,{"alpha":0});
         TweenLite.from(box.knop21,1,{"alpha":0});
         TweenLite.from(box.knop22,1,{"alpha":0});
         TweenLite.from(box.achievement_reset,1,{
            "delay":0.3,
            "alpha":0
         });
         box.achievement_reset.gotoAndStop(1);
         this.ach_reset = false;
      }
      
      public function closeReset() : *
      {
         var hideReset:Function = null;
         hideReset = function():*
         {
            box.txt21.visible = false;
            box.knop21.visible = false;
            box.knop22.visible = false;
            box.achievement_reset.visible = false;
         };
         TweenLite.to(box.txt21,0.5,{
            "alpha":0,
            "onComplete":hideReset
         });
         TweenLite.to(box.knop21,0.5,{"alpha":0});
         TweenLite.to(box.knop22,0.5,{"alpha":0});
         TweenLite.to(box.achievement_reset,0.5,{"alpha":0});
      }
      
      public function resetLanguageButtons() : *
      {
         for(var r:* = 0; r < 100; r++)
         {
            if(box.getChildByName("l" + r))
            {
               if(this.main.languageNum == r)
               {
                  box["l" + r].achter.gotoAndStop(10);
               }
               else
               {
                  box["l" + r].achter.gotoAndStop(1);
               }
            }
         }
      }
      
      public function gotoLanguage() : *
      {
         this.openBox(4);
      }
      
      private function clickedOn(_ding:*) : *
      {
         if(_ding == null)
         {
            return false;
         }
         if(_ding.hitTestPoint(stage.mouseX,stage.mouseY,true))
         {
            return true;
         }
         return false;
      }
      
      public function getPurchase() : *
      {
         if(box.txt43)
         {
            this.main.menuClass.makeTxt(box.txt43,"txt43","pause");
         }
         if(box.txt45)
         {
            this.main.menuClass.makeTxt(box.txt45,"txt45","pause");
         }
         if(box.knop61)
         {
            box.knop61.visible = false;
         }
         if(box.loading1)
         {
            box.loading1.visible = false;
         }
         if(box.knop62)
         {
            box.knop62.visible = false;
         }
         if(box.loading2)
         {
            box.loading2.visible = false;
         }
         if(Boolean(knop57) && Boolean(knop57.binnen))
         {
            knop57.binnen.gotoAndStop(2);
         }
      }
      
      public function readyPurchase() : *
      {
         if(Boolean(box.knop61) && this.main.settingArray[1] <= 0)
         {
            box.knop61.visible = true;
         }
      }
      
      public function readyRestore() : *
      {
         if(Boolean(box.knop62) && this.main.settingArray[1] <= 0)
         {
            box.knop62.visible = true;
         }
      }
      
      public function setBox(_box:*, _num:*, _move:Boolean = false) : *
      {
         var r:*;
         var removeBlack:Function = null;
         removeBlack = function():*
         {
            black.visible = false;
         };
         black.alpha = 0;
         TweenLite.from(black,0.3,{
            "alpha":1,
            "onComplete":removeBlack
         });
         _box.gotoAndStop(_num);
         _box.x = 0;
         if(_box.currentFrame == 2)
         {
            this.orderMore();
         }
         if(_box.currentFrame == 5)
         {
            this.makeCredits();
         }
         if(_box.currentFrame == 2)
         {
            this.bounceSocials();
         }
         if(_box.currentFrame == 8)
         {
            this.makeAchievements();
         }
         if(_box.currentFrame == 10)
         {
            this.makeAll();
         }
         if(_box.currentFrame == 1)
         {
            this.makeSettings();
         }
         if(Boolean(_box.loading1) && Boolean(this.main.settingArray[1]))
         {
            _box.loading1.visible = false;
         }
         if(Boolean(_box.loading2) && Boolean(this.main.settingArray[1]))
         {
            _box.loading2.visible = false;
         }
         if(Boolean(_box.loading2) && this.main.onMobile <= 1)
         {
            _box.loading2.visible = false;
         }
         for(r = 0; r < 100; r++)
         {
            if(_box.getChildByName("knop" + r))
            {
               this.main.menuClass.makeButton(_box.getChildByName("knop" + r),r,"pause");
               if(r == 21)
               {
                  _box.knop21.visible = false;
               }
               else if(r == 22)
               {
                  _box.knop22.visible = false;
               }
               if(r == 61 && Boolean(this.main.settingArray[1]))
               {
                  _box.knop61.visible = false;
               }
               if(r == 62 && Boolean(this.main.settingArray[1]))
               {
                  _box.knop62.visible = false;
               }
            }
            if(_box.getChildByName("l" + r))
            {
               if(_box.currentFrame == 4)
               {
                  this.main.menuClass.makeButton(_box.getChildByName("l" + r),r,"language");
               }
            }
            if(_box.getChildByName("txt" + r))
            {
               this.main.menuClass.makeTxt(_box.getChildByName("txt" + r),"txt" + r,"pause");
               if(r == 21)
               {
                  _box.txt21.visible = false;
               }
            }
         }
         if(Boolean(_box.getChildByName("discord")) && Boolean(_box.getChildByName("knop88")))
         {
            _box.discord.x = _box.knop88.x - _box.knop88.width / 2 - 10;
         }
         if(Boolean(_box.getChildByName("youtube")) && Boolean(_box.getChildByName("knop4")))
         {
            _box.youtube.x = _box.knop4.x - _box.knop4.width / 2 - 10;
         }
         if(Boolean(_box.getChildByName("joystick")) && Boolean(_box.getChildByName("knop93")))
         {
            _box.joystick.x = _box.knop93.x - _box.knop93.width / 2 - 10;
         }
         if(Boolean(_box.getChildByName("language")) && Boolean(_box.getChildByName("knop25")))
         {
            _box.language.x = _box.knop25.x - _box.knop25.width / 2 - 10;
         }
         if(Boolean(_box.getChildByName("bar")) && Boolean(_box.getChildByName("knop83")))
         {
            _box.bar.x = _box.knop83.x + _box.knop83.width / 2 + 3;
         }
         if(Boolean(_box.getChildByName("knop85")) && _box.getChildByName("knop85").visible == false)
         {
            _box.knop81.x += 31;
            _box.knop82.x += 31;
            _box.knop84.x -= 31;
            _box.eyeTxt.x -= 31;
         }
      }
      
      public function clickScreen() : *
      {
         var r:* = undefined;
         var showTxt:Function = function(r:*):*
         {
            if(box.achTxt)
            {
               main.makeTxtfield("achievement_" + game_selected + "_" + r,box.achTxt,20);
               box.achTxt.alpha = 1;
               TweenLite.from(box.achTxt,0.6,{"alpha":0});
            }
            for(var p:* = 0; p < 100; p++)
            {
               if(box.getChildByName("achievement" + p))
               {
                  box["achievement" + p].rand.visible = false;
               }
            }
            box["achievement" + r].rand.visible = true;
         };
         if(box.currentFrame == 5)
         {
            this.openBox(2);
         }
         else if(box.currentFrame == 9 && Boolean(this.clickedOn(box.pijl)))
         {
            this.openBox(3);
         }
         else if(box.currentFrame == 4 && Boolean(this.clickedOn(box.pijl)))
         {
            this.openBox(1);
         }
         else if(box.currentFrame == 10 && this.main.gameID >= 1 && Boolean(this.clickedOn(box.pijl)))
         {
            this.openBox(8);
         }
         else if(Boolean(box.currentFrame == 1) && Boolean(box.achievement_reset.visible) && Boolean(this.clickedOn(box.achievement_reset)))
         {
            if(box.achievement_reset.currentFrame == 1)
            {
               box.achievement_reset.gotoAndStop(2);
               this.ach_reset = true;
            }
            else if(box.achievement_reset.currentFrame == 2)
            {
               box.achievement_reset.gotoAndStop(1);
               this.ach_reset = false;
            }
         }
         if(box.currentFrame == 8)
         {
            for(r = 0; r < 100; r++)
            {
               if(box.getChildByName("achievement" + r))
               {
                  if(Boolean(this.clickedOn(box.getChildByName("achievement" + r))) && Boolean(box["achievement" + r].rand.visible))
                  {
                     box["achievement" + r].rand.visible = false;
                     if(box.achTxt)
                     {
                        this.main.makeTxtfield(" ",box.achTxt,20);
                     }
                  }
                  else if(this.clickedOn(box.getChildByName("achievement" + r)))
                  {
                     showTxt(r);
                  }
               }
            }
            if(Boolean(box.getChildByName("list")) && Boolean(this.clickedOn(box.list)) && Boolean(box.list.visible))
            {
               this.openBox(10);
            }
         }
      }
      
      public function showEyetxt(_num:*) : *
      {
         if(box.eyeTxt.txt)
         {
            TweenLite.killTweensOf(box.eyeTxt);
            box.eyeTxt.alpha = 1;
            if(_num == 1)
            {
               this.main.makeTxtfield("hints disabled",box.eyeTxt.txt,15);
            }
            else if(_num == 2)
            {
               this.main.makeTxtfield("hints enabled",box.eyeTxt.txt,15);
            }
            TweenLite.to(box.eyeTxt,0.5,{
               "alpha":0,
               "delay":2
            });
         }
      }
      
      private function bounceSocials() : *
      {
         var _delay:* = 0.5;
         if(Math.random() * 2 < 2)
         {
            if(box.knop11)
            {
               TweenMax.to(box.knop11,0.2,{
                  "delay":_delay + 0.4,
                  "y":box.knop11.y - 10,
                  "yoyo":true,
                  "repeat":1
               });
            }
            if(box.knop12)
            {
               TweenMax.to(box.knop12,0.2,{
                  "delay":_delay + 0.2,
                  "y":box.knop12.y - 10,
                  "yoyo":true,
                  "repeat":1
               });
            }
            if(box.knop13)
            {
               TweenMax.to(box.knop13,0.2,{
                  "delay":_delay + 0,
                  "y":box.knop13.y - 10,
                  "yoyo":true,
                  "repeat":1
               });
            }
         }
      }
      
      private function makeAll() : *
      {
         var r:* = undefined;
         if(this.main.gameID == 0 && Boolean(box.getChildByName("pijltje")))
         {
            box.pijltje.visible = false;
         }
         var _names:* = ["","Seasons","The Lake","Harvey\'s Box","Arles","Case 23","The Mill","Birthday","Theatre","The Cave"];
         for(var t:* = 0; t < 100; t++)
         {
            if(box.getChildByName("deel" + t))
            {
               this.main.makeTxtfield(_names[t],box["deel" + t].txt,23);
               for(r = 0; r < 100; r++)
               {
                  if(box["deel" + t].getChildByName("achievement" + r))
                  {
                     box["deel" + t]["achievement" + r].gotoAndStop(r + t * 10);
                     box["deel" + t]["achievement" + r].kleur.gotoAndStop(r);
                     if(Boolean(this.main.settingArray[11]) && Boolean(this.main.settingArray[11][r + 10 * t]))
                     {
                        box["deel" + t]["achievement" + r].masker.x = 3000;
                        box["deel" + t]["achievement" + r].kleur.visible = true;
                     }
                     else
                     {
                        box["deel" + t]["achievement" + r].masker.x = 4;
                        box["deel" + t]["achievement" + r].kleur.visible = false;
                     }
                  }
               }
            }
         }
      }
      
      private function makeAchievements() : *
      {
         var _fout:int = 0;
         for(var r:* = 0; r < 100; r++)
         {
            if(box.getChildByName("achievement" + r))
            {
               box["achievement" + r].gotoAndStop(r + this.game_selected * 10);
               box["achievement" + r].kleur.gotoAndStop(r);
               if(Boolean(!this.main.collection) && Boolean(this.main.settingArray[11]) && Boolean(this.main.settingArray[11][r]))
               {
                  box["achievement" + r].masker.x = 3000;
               }
               else if(Boolean(this.main.collection) && Boolean(this.main.settingArray[11]) && Boolean(this.main.settingArray[11][r + 10 * this.game_selected]))
               {
                  box["achievement" + r].masker.x = 3000;
                  box["achievement" + r].kleur.visible = true;
               }
               else
               {
                  box["achievement" + r].masker.x = 4;
                  box["achievement" + r].kleur.visible = false;
                  _fout++;
               }
            }
         }
         if(box.achTxt)
         {
            this.main.makeTxtfield(" " + r,box.achTxt);
         }
         if(box.symbool)
         {
            box.symbool.gotoAndStop(this.game_selected);
            if(_fout)
            {
               box.symbool.visible = false;
            }
         }
      }
      
      private function orderMore() : *
      {
         this.main.makeTxtfield("The White Door",box.knop8.titel,17);
         this.main.makeTxtfield("More Rusty Lake",box.knop9.titel,17);
         if(Boolean(this.main.button_info[0]) && Boolean(this.main.button_info[3]))
         {
            this.main.makeTxtfield(this.main.button_info[0],box.knop10.titel,17);
            box.knop10.urlName = this.main.button_info[1];
            box.knop8.x += 93;
            box.knop9.x += 93;
            box.knop10.x += 93;
            box.knop10.binnen.addChild(this.main.button_info[3]);
            this.main.button_info[3].scaleX = this.main.button_info[3].scaleY = 68 / 180;
            box.knop10.binnen.mask = box.knop10.masker;
         }
         else
         {
            box.knop10.visible = false;
            box.knop10.x = -2000;
         }
      }
      
      private function makeSettings() : *
      {
         box.achievement_reset.visible = false;
         box.achievement_reset.gotoAndStop(1);
         if(box.achievement_reset.txt)
         {
            this.main.makeTxtfield("Achievements",box.achievement_reset.txt,14);
         }
      }
      
      private function makeCredits() : *
      {
         box.credits.gotoAndStop(this.main.gameID);
         var _titels:* = ["","A game by","Music","Voice-acting","Translations","Background Art","Special Thanks",""];
         var _namen:* = [];
         for(var r:* = 0; r < 20; r++)
         {
            if(box.credits.getChildByName("titel" + r))
            {
               this.main.makeTxtfield(_titels[r],box.credits["titel" + r],16);
            }
         }
      }
      
      public function update() : *
      {
         if(box.credits)
         {
            --box.credits.y;
         }
      }
      
      public function remove() : void
      {
         this.main = null;
      }
   }
}

