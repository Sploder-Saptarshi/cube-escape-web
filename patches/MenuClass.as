package
{
   import com.greensock.*;
   import com.greensock.easing.*;
   import flash.desktop.NativeApplication;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.text.TextFormat;
   
   public class MenuClass extends MovieClip
   {
      
      private var main:*;
      
      private var myFormat:TextFormat = new TextFormat();
      
      public function MenuClass(_main:*)
      {
         super();
         this.main = _main;
      }
      
      public function makeTxt(_field:*, _txt:String = "null", _menu:String = "null") : *
      {
         var _codeWord:String = null;
         if(Boolean(Texten.getSentence(this.main.gameID + "_" + _menu + "_" + _txt)) && !this.main.collection)
         {
            _codeWord = this.main.gameID + "_" + _menu + "_" + _txt;
            _txt = Texten.getSentence(this.main.gameID + "_" + _menu + "_" + _txt);
         }
         else if(Texten.getSentence(_menu + "_" + _txt))
         {
            _codeWord = _menu + "_" + _txt;
            _txt = Texten.getSentence(_menu + "_" + _txt);
         }
         else if(Boolean(Texten.getSentence(this.main.gameID + "_" + _menu + "_" + _txt)) && Boolean(this.main.collection))
         {
            _codeWord = this.main.gameID + "_" + _menu + "_" + _txt;
            _txt = Texten.getSentence(this.main.gameID + "_" + _menu + "_" + _txt);
         }
         else if(_menu == "end" && _txt == "txt2")
         {
            _codeWord = "end_social";
            _txt = "Follow us on:";
         }
         else if(_menu == "end2" && _txt == "txt2" && this.main.gameID == 2)
         {
            _codeWord = "end_social";
            _txt = "Follow us on:";
         }
         else if(_menu == "pause")
         {
            _codeWord = _txt;
            if(_txt == "txt1")
            {
               _txt = "Hier staat de tekst.";
            }
            else if(_txt == "txt2")
            {
               _txt = "Informatie over Rusty Lake: andere games? credits? social media?";
            }
            else if(_txt == "txt3" && this.main.onMobile >= 1)
            {
               _txt = "Tap on the arrows to navigate around the room.\nSome objects you can drag\nInteract with objects by tapping.\nSelect found items in your inventory and tap somewhere on screen to use them.";
            }
            else if(_txt == "txt3" && this.main.onMobile <= 0)
            {
               _codeWord = "txt3_desktop";
               _txt = "Click on the arrows or drag to navigate around the room.\nSome objects you can drag\nInteract with objects by clicking.\nSelect found items in your inventory and click somewhere on screen to use them.";
            }
            else if(_txt == "txt4")
            {
               _txt = "Localization not yet available";
            }
            else if(_txt == "txt5")
            {
               _txt = "Credits";
            }
            else if(_txt == "txt21")
            {
               _txt = "Are you sure?";
            }
            else if(_txt == "txt9")
            {
               _txt = "Samsara Room is part of the Rusty Lake & Cube Escape series. Feel free to play more:";
            }
            else if(_txt == "txt90")
            {
               _txt = "Sorry but the exit button is broken due to security restrictions!";
            }
            else if(_txt == "txt41")
            {
               if(Boolean(this.main.collection) && this.main.onMobile >= 1)
               {
                  _codeWord = "txt41d";
                  _txt = "Tap on the eye symbol in settings to activate hints.";
               }
               else if(Boolean(this.main.collection) && this.main.onMobile <= 0)
               {
                  _codeWord = "txt41c";
                  _txt = "Click on the eye symbol in settings to activate hints.";
               }
               else if(this.main.onMobile >= 1)
               {
                  _codeWord = "txt41a";
                  _txt = "Tap on the eye symbol to get a hint. \nWatch an ad or unlock premium to disable ads.";
               }
               else if(this.main.onMobile <= 0)
               {
                  _codeWord = "txt41b";
                  _txt = "Click on the eye symbol to get a hint. \nWatch an ad or unlock premium to disable ads.";
               }
            }
            else if(_txt == "txt42")
            {
               _txt = "You can also ask for advise on Discord or watch  our walkthrough.";
            }
            else if(_txt == "txt43" && Boolean(this.main.settingArray[1]))
            {
               _codeWord == "txt43b";
               _txt = "Thank you for supporting Rusty Lake!";
            }
            else if(_txt == "txt43" && Boolean(this.main.settingArray[1]))
            {
               _codeWord == "txt43b";
               _txt = "Thank you for supporting Rusty Lake!";
            }
            else if(_txt == "txt43")
            {
               _txt = "Unlock premium to remove ads and support Rusty Lake!";
            }
            else if(_txt == "txt81")
            {
               if(Boolean(this.main.collection) && this.main.gameID == 1)
               {
                  _txt = "Cube Escape: Seasons";
               }
               else if(Boolean(this.main.collection) && this.main.gameID == 2)
               {
                  _txt = "Cube Escape: The Lake";
               }
               else if(Boolean(this.main.collection) && this.main.gameID == 3)
               {
                  _txt = "Cube Escape: Harvey\'s Box";
               }
               else if(Boolean(this.main.collection) && this.main.gameID == 4)
               {
                  _txt = "Cube Escape: Arles";
               }
               else if(Boolean(this.main.collection) && this.main.gameID == 5)
               {
                  _txt = "Cube Escape: Case 23";
               }
               else if(Boolean(this.main.collection) && this.main.gameID == 6)
               {
                  _txt = "Cube Escape: The Mill";
               }
               else if(Boolean(this.main.collection) && this.main.gameID == 7)
               {
                  _txt = "Cube Escape: Birthday";
               }
               else if(Boolean(this.main.collection) && this.main.gameID == 8)
               {
                  _txt = "Cube Escape: Theatre";
               }
               else if(Boolean(this.main.collection) && this.main.gameID == 9)
               {
                  _txt = "Cube Escape: The Cave";
               }
               else
               {
                  _txt = "";
               }
            }
            else if(_txt == "txt80")
            {
               if(this.main.collection)
               {
                  _txt = "Achievements";
                  _codeWord = "Achievements";
               }
               else
               {
                  _txt = "Did you find all the achievements?";
                  _field.y -= 10;
               }
            }
            else if(_txt == "txt22")
            {
               _codeWord = _txt = "Credits";
            }
            else if(_txt == "txt23")
            {
               _codeWord = _txt = "Privacy Policy";
            }
            else if(_txt == "txt45")
            {
               if(this.main.settingArray[1])
               {
                  if(Math.random() * 3 < 1)
                  {
                     _codeWord == "txt45a";
                     _txt = "-   \'The past is never dead. It\'s not even past.\'   -";
                  }
                  else if(Math.random() * 2 < 1)
                  {
                     _codeWord == "txt45b";
                     _txt = "-   \'There will be blood.\'   -";
                  }
                  else
                  {
                     _codeWord == "txt45c";
                     _txt = "-   \'All that you touch, you change.\'   -";
                  }
               }
               else if(this.main.product_info[0])
               {
                  _txt = this.main.product_info[0].priceString + "";
               }
               else
               {
                  _txt = "no connection";
               }
            }
         }
         if(Boolean(this.main.languageNum) && Boolean(this.main.languageClass) && Boolean(this.main.languageClass.checkWord(_codeWord)))
         {
            _txt = this.main.languageClass.checkWord(_codeWord);
            _txt = _txt.split("\\n").join("\n");
            _field.text = _txt;
         }
         else
         {
            _field.text = _txt;
         }
         this.main.languageClass.changeFont(_field,this.main.languageNum,"niet speciaal",18);
      }
      
      public function makeButton(_button:*, _num:int = -1, _menu:String = "null") : *
      {
         _button.addEventListener(MouseEvent.MOUSE_UP,this.clickButton,false,0,true);
         _button.addEventListener(MouseEvent.MOUSE_OVER,this.overButton,false,0,true);
         _button.addEventListener(MouseEvent.MOUSE_OUT,this.outButton,false,0,true);
         _button.addEventListener(MouseEvent.MOUSE_DOWN,this.downButton,false,0,true);
         _button.num = _num;
         _button.menu = _menu;
         _button.stop();
         _button.mouseChildren = false;
         if(_num == 1 && _menu == "hints")
         {
            _button.textString = "Watch an ad to unlock a hint";
         }
         else if(_num == 2 && _menu == "hints")
         {
            _button.textString = "Remove ads";
         }
         else if(_num == 0 && _menu == "all")
         {
            _button.textString = "Leave a review";
         }
         else if(_num == 11 && _menu == "all")
         {
            _button.textString = "Reset All";
         }
         else if(_num == 1 && _menu == "resetAll")
         {
            _button.textString = "Yes";
         }
         else if(_num == 2 && _menu == "resetAll")
         {
            _button.textString = "No";
         }
         else if(_num == 1 && _menu == "tussen")
         {
            _button.textString = "Replay chapter";
         }
         else if(_num == 2 && _menu == "tussen")
         {
            _button.textString = "Play next chapter";
         }
         else if(_num == 3 && _menu == "tussen")
         {
            _button.textString = "Main menu";
         }
         else if(_num == 1 && _menu == "main")
         {
            _button.textString = "Samsara";
         }
         else if(_num == 61)
         {
            _button.textString = "Unlock Premium";
         }
         else if(_num == 62)
         {
            _button.textString = "Restore Purchase";
            if(this.main.onMobile <= 1)
            {
               _button.visible = false;
               _button.x = -2000;
            }
         }
         else if(_num == 63)
         {
            _button.textString = "Consume";
         }
         else if(_num == 2 && _menu == "main")
         {
            _button.textString = "The Lake";
         }
         else if(_num == 3 && _menu == "main")
         {
            _button.textString = "Arles";
         }
         else if(_num == 4 && _menu == "main")
         {
            _button.textString = "Help";
         }
         else if(_num == 5 && _menu == "main")
         {
            _button.textString = "About";
         }
         if(_num == 1 && _menu == "pause")
         {
            _button.textString = "Main menu";
         }
         else if(_num == 2 && _menu == "pause")
         {
            if(Boolean(this.main.collection) && this.main.gameID == 1)
            {
               _button.textString = "Reset: Seasons";
            }
            else if(Boolean(this.main.collection) && this.main.gameID == 2)
            {
               _button.textString = "Reset: The Lake";
            }
            else if(Boolean(this.main.collection) && this.main.gameID == 3)
            {
               _button.textString = "Reset: Harvey\'s Box";
            }
            else if(Boolean(this.main.collection) && this.main.gameID == 4)
            {
               _button.textString = "Reset: Arles";
            }
            else if(Boolean(this.main.collection) && this.main.gameID == 5)
            {
               _button.textString = "Reset: Case 23";
            }
            else if(Boolean(this.main.collection) && this.main.gameID == 6)
            {
               _button.textString = "Reset: The Mill";
            }
            else if(Boolean(this.main.collection) && this.main.gameID == 7)
            {
               _button.textString = "Reset: Birthday";
            }
            else if(Boolean(this.main.collection) && this.main.gameID == 8)
            {
               _button.textString = "Reset: Theatre";
            }
            else if(Boolean(this.main.collection) && this.main.gameID == 9)
            {
               _button.textString = "Reset: The Cave";
            }
            else
            {
               _button.textString = "Reset";
            }
         }
         else if(_num == 3 && _menu == "pause")
         {
            _button.textString = "Continue";
         }
         else if(_num == 4 && _menu == "pause")
         {
            _button.textString = "Walkthrough Video";
         }
         else if(_num == 88 && _menu == "pause")
         {
            _button.textString = "Get help on Discord";
         }
         else if(_num == 98 && _menu == "pause")
         {
            _button.textString = "Credits";
         }
         else if(_num == 97 && _menu == "pause")
         {
            _button.textString = "Privacy Policy";
         }
         else if(_num == 93 && _menu == "pause")
         {
            _button.textString = "How to play?";
         }
         else if(_num == 67 && _menu == "pause")
         {
            _button.textString = "All Achievements";
            if(!this.main.collection)
            {
               _button.visible = false;
               _button.x = 2000;
            }
         }
         else if(_num == 83 && _menu == "pause")
         {
            _button.gotoAndStop(this.main.high_performance);
            if(_button.currentFrame == 1)
            {
               _button.textString = "Quality High";
            }
            else if(_button.currentFrame == 2)
            {
               _button.textString = "Quality Medium";
            }
            else if(_button.currentFrame == 3)
            {
               _button.textString = "Quality Low";
            }
         }
         else if(_num == 7 && _menu == "pause")
         {
            _button.textString = "Leave a review";
         }
         else if(_num == 7 && _menu == "tussen")
         {
            _button.textString = "Leave a review";
         }
         else if(_num == 91 && _menu == "pause")
         {
            _button.textString = "Yes";
         }
         else if(_num == 1 && _menu == "end")
         {
            _button.textString = "Leave a review";
         }
         else if(_num == 2 && _menu == "end")
         {
            _button.textString = "More Rusty Lake";
         }
         else if(_num == 3 && _menu == "end" && this.main.gameID == 2 && this.main.settingArray[10] <= 0)
         {
            _button.textString = "Continue";
         }
         else if(_num == 3 && _menu == "end")
         {
            _button.textString = "Main menu";
         }
         else if(_num == 8 && _menu == "end")
         {
            _button.textString = "The White Door";
         }
         else if(_num == 9 && _menu == "end")
         {
            _button.textString = "More Rusty Lake";
         }
         else if(_num == 1 && _menu == "bonus")
         {
            _button.textString = "Win a prize!";
         }
         else if(_num == 3 && _menu == "bonus")
         {
            _button.textString = "Continue";
         }
         else if(_num == 21 && _menu == "pause")
         {
            _button.textString = "Yes";
         }
         else if(_num == 22 && _menu == "pause")
         {
            _button.textString = "No";
         }
         else if(_num == 86 && _menu == "pause")
         {
            _button.textString = "Unlock Premium";
            if(this.main.settingArray[1])
            {
               _button.visible = false;
            }
         }
         else if(_num == 25 && _menu == "pause")
         {
            _button.textString = "Language";
         }
         else if(_num == 12 && (_menu == "pause" || _menu == "end"))
         {
            if(Boolean(_button.binnen) && this.main.languageNum == 2)
            {
               _button.binnen.gotoAndStop(4);
            }
            else if(Boolean(_button.binnen) && this.main.languageNum == 18)
            {
               _button.binnen.gotoAndStop(4);
            }
            else if(Boolean(_button.binnen) && this.main.languageNum == 5)
            {
               _button.binnen.gotoAndStop(5);
            }
            else if(Boolean(_button.binnen) && this.main.languageNum == 12)
            {
               _button.binnen.gotoAndStop(6);
            }
            else if(Boolean(_button.binnen) && this.main.languageNum == 10)
            {
               _button.binnen.gotoAndStop(7);
            }
         }
         else if(_num == 81 && _menu == "pause")
         {
            if(Sounds.musicMute)
            {
               _button.gotoAndStop(2);
            }
         }
         else if(_num == 82 && _menu == "pause")
         {
            if(Sounds.soundMute)
            {
               _button.gotoAndStop(2);
            }
         }
         else if(_num == 84 && _menu == "pause")
         {
            if(this.main.settingArray[2] < 2)
            {
               _button.gotoAndStop(2);
            }
         }
         else if(_num == 85 && _menu == "pause")
         {
            if(this.main.onMobile >= 1)
            {
               _button.visible = false;
               _button.x = 1000;
            }
            if(this.main.isFullscreen)
            {
               _button.gotoAndStop(2);
            }
         }
         else if(_menu == "language")
         {
            if(_num == 0)
            {
               _button.textString = "English";
            }
            else if(_num == 1)
            {
               _button.textString = "Español";
            }
            else if(_num == 2)
            {
               _button.textString = "简体中文";
            }
            else if(_num == 3)
            {
               _button.textString = "Français";
            }
            else if(_num == 4)
            {
               _button.textString = "Nederlands";
            }
            else if(_num == 5)
            {
               _button.textString = "Русский";
            }
            else if(_num == 6)
            {
               _button.textString = "Polski";
            }
            else if(_num == 7)
            {
               _button.textString = "Deutsch";
            }
            else if(_num == 8)
            {
               _button.textString = "Português ";
            }
            else if(_num == 9)
            {
               _button.textString = "Italiano";
            }
            else if(_num == 10)
            {
               _button.textString = "한국어";
            }
            else if(_num == 11)
            {
               _button.textString = "Dansk";
            }
            else if(_num == 12)
            {
               _button.textString = "日本語";
            }
            else if(_num == 13)
            {
               _button.textString = "Türkçe";
            }
            else if(_num == 14)
            {
               _button.textString = "Čeština";
            }
            else if(_num == 15)
            {
               _button.textString = "Svenska";
            }
            else if(_num == 16)
            {
               _button.textString = "हिन्दी";
            }
            else if(_num == 17)
            {
               _button.textString = "tiếng Việt";
            }
            else if(_num == 18)
            {
               _button.textString = "繁體中文";
            }
            _button.parent.parent.resetLanguageButtons();
         }
         if(_button.txt == undefined)
         {
            return;
         }
         _button.txt.width = 5000;
         var _size:* = 25;
         if(_button.textString)
         {
            _button.txt.text = _button.textString;
            if(Boolean(this.main.languageNum > 0) && Boolean(this.main.languageClass) && Boolean(this.main.languageClass.checkWord(_button.textString)))
            {
               _button.textString = this.main.languageClass.checkWord(_button.textString);
               _button.txt.text = _button.textString;
               this.main.languageClass.changeFont(_button.txt,this.main.languageNum,"button");
            }
            else if(_num == 2 && _menu == "language")
            {
               this.main.languageClass.changeFont(_button.txt,2,"button");
            }
            else if(_num == 5 && _menu == "language")
            {
               this.main.languageClass.changeFont(_button.txt,5,"button");
            }
            else if(_num == 10 && _menu == "language")
            {
               this.main.languageClass.changeFont(_button.txt,10,"button");
            }
            else if(_num == 12 && _menu == "language")
            {
               this.main.languageClass.changeFont(_button.txt,12,"button");
            }
            else if(_num == 14 && _menu == "language")
            {
               this.main.languageClass.changeFont(_button.txt,14,"button");
            }
            else if(_num == 16 && _menu == "language")
            {
               this.main.languageClass.changeFont(_button.txt,2,"button");
            }
            else if(_num == 17 && _menu == "language")
            {
               this.main.languageClass.changeFont(_button.txt,17,"button");
            }
            else if(_num == 18 && _menu == "language")
            {
               this.main.languageClass.changeFont(_button.txt,2,"button");
            }
            else
            {
               this.main.languageClass.changeFont(_button.txt,0,"button");
            }
            _button.txt.width = _button.txt.textWidth + 10;
            if(_button.achter)
            {
               _button.achter.scaleX = (_button.txt.textWidth + 45) / 100;
            }
            return;
         }
      }
      
      public function destroyButton(_button:*, _num:int = -1, _menu:String = "null") : *
      {
         _button.removeEventListener(MouseEvent.MOUSE_UP,this.clickButton);
         _button.removeEventListener(MouseEvent.MOUSE_OVER,this.overButton);
         _button.removeEventListener(MouseEvent.MOUSE_OUT,this.outButton);
         _button.removeEventListener(MouseEvent.MOUSE_DOWN,this.downButton);
      }
      
      private function overButton(e:MouseEvent) : void
      {
         if(e.currentTarget.num > 80)
         {
            return;
         }
         e.currentTarget.gotoAndStop(2);
      }
      
      private function outButton(e:MouseEvent) : void
      {
         if(e.currentTarget.num > 80)
         {
            return;
         }
         e.currentTarget.gotoAndStop(1);
      }
      
      private function downButton(e:MouseEvent) : void
      {
         if(e.currentTarget.num > 80)
         {
            return;
         }
         e.currentTarget.gotoAndStop(3);
         if(e.currentTarget.wit)
         {
            TweenLite.from(e.currentTarget.wit,0.3,{"alpha":0});
         }
      }
      
      private function clickButton(e:MouseEvent) : void
      {
         var _game:int = 0;
         var z:* = undefined;
         var path:URLRequest = null;
         var _urlName:* = null;
         var _num:* = e.currentTarget.num;
         var _menu:* = e.currentTarget.menu;
         if(_num == 1 && _menu == "main")
         {
            this.main.selectGame("Samsara");
            this.main.openScreen("manager");
         }
         else if(_num == 2 && _menu == "main")
         {
            this.main.selectGame("The Lake");
            this.main.openScreen("cubeTest");
         }
         else if(_num == 3 && _menu == "main")
         {
            this.main.selectGame("Arles");
            this.main.openScreen("cubeTest");
         }
         else if(_num >= 51 && _num <= 60 && _menu == "pause")
         {
            e.currentTarget.parent.openBox(_num - 50);
         }
         else if(_num == 1 && _menu == "pause")
         {
            this.main.openScreen("main");
         }
         else if(_num == 61)
         {
            e.currentTarget.visible = false;
            this.main.startPurchase();
         }
         else if(_num == 62)
         {
            e.currentTarget.visible = false;
            this.main.restorePurchase();
         }
         else if(_num == 63)
         {
            this.main.consumePurchase();
         }
         else if(_num == 99 && _menu == "pause")
         {
            this.main.openScreen("all");
         }
         else if(_num == 99 && _menu == "all")
         {
            e.currentTarget.parent.openInfo();
         }
         else if(_num == 11 && _menu == "all")
         {
            if(e.currentTarget.parent.alpha >= 1)
            {
               this.main.openScreen("resetAll");
            }
         }
         else if(_num == 1 && _menu == "resetAll")
         {
            this.main.resetAchievements();
            this.main.resetAll();
            this.main.settingArray[8] = 1;
            this.main.openScreen("all");
         }
         else if(_num == 2 && _menu == "resetAll")
         {
            this.main.openScreen("all");
         }
         else if(_num == 0 && _menu == "all")
         {
            if(this.main.chinese)
            {
               _urlName = "http://www.rustylake.com/301/cube-escape-collection-ios-china.html";
            }
            else if(this.main.itch)
            {
               _urlName = "https://rustylake.itch.io/cube-escape-collection";
            }
            else if(this.main.gog)
            {
               _urlName = "https://www.gog.com/game/cube_escape_collection";
            }
            else if(this.main.onMobile == 1)
            {
               _urlName = "https://play.google.com/store/apps/details?id=air.com.RustyLake.CubeEscapeCollection";
            }
            else if(this.main.onMobile == 2)
            {
               _urlName = "https://apps.apple.com/app/id1555267021";
            }
            else
            {
               _urlName = "https://store.steampowered.com/app/1292940/Cube_Escape_Collection/";
            }
         }
         else if(_menu == "all" && e.currentTarget.alpha >= 1)
         {
            this.main.gameID = _num;
            this.main.settingArray[8] = _num;
            if(_num == 1)
            {
               this.main.gameName = "Seasons";
            }
            else if(_num == 2)
            {
               this.main.gameName = "The Lake";
            }
            else if(_num == 3)
            {
               this.main.gameName = "Harvey\'s Box";
            }
            else if(_num == 4)
            {
               this.main.gameName = "Arles";
            }
            else if(_num == 5)
            {
               this.main.gameName = "Case23";
            }
            else if(_num == 6)
            {
               this.main.gameName = "The Mill";
            }
            else if(_num == 7)
            {
               this.main.gameName = "Birthday";
            }
            else if(_num == 8)
            {
               this.main.gameName = "Theatre";
            }
            else if(_num == 9)
            {
               this.main.gameName = "The Cave";
            }
            this.main.openScreen("main");
         }
         else if(_num == 86 && _menu == "pause")
         {
            e.currentTarget.parent.parent.openBox(7);
         }
         else if(_num == 98 && _menu == "pause")
         {
            e.currentTarget.parent.parent.openBox(5);
         }
         else if(_num == 67 && _menu == "pause")
         {
            e.currentTarget.parent.parent.openBox(10);
         }
         else if(_num == 97 && _menu == "pause")
         {
            _urlName = "http://www.rustylake.com/301/privacy-policy.html";
         }
         else if(_num == 93 && _menu == "pause")
         {
            e.currentTarget.parent.parent.openBox(9);
         }
         else if(_num == 21 && _menu == "pause")
         {
            this.main.resetGame();
            this.main.openScreen("main");
            if(this.main.settingArray[8] == 1)
            {
               this.main.gameName = "Seasons";
            }
            else if(this.main.settingArray[8] == 2)
            {
               this.main.gameName = "The Lake";
            }
            else if(this.main.settingArray[8] == 3)
            {
               this.main.gameName = "Harvey\'s Box";
            }
            else if(this.main.settingArray[8] == 4)
            {
               this.main.gameName = "Arles";
            }
            else if(this.main.settingArray[8] == 5)
            {
               this.main.gameName = "Case23";
            }
            else if(this.main.settingArray[8] == 6)
            {
               this.main.gameName = "The Mill";
            }
            else if(this.main.settingArray[8] == 7)
            {
               this.main.gameName = "Birthday";
            }
            else if(this.main.settingArray[8] == 8)
            {
               this.main.gameName = "Theatre";
            }
            else if(this.main.settingArray[8] == 9)
            {
               this.main.gameName = "The Cave";
            }
            if(e.currentTarget.parent.parent.ach_reset)
            {
               _game = 0;
               if(this.main.collection)
               {
                  _game = this.main.gameID * 10;
               }
               if(this.main.settingArray[11])
               {
                  for(z = 1; z < 9; z++)
                  {
                     this.main.settingArray[11][_game + z] = 0;
                  }
               }
               this.main.saveToDisk();
            }
         }
         else if(_num == 2 && _menu == "pause")
         {
            e.currentTarget.parent.parent.openReset();
         }
         else if(_num == 22 && _menu == "pause")
         {
            e.currentTarget.parent.parent.closeReset();
         }
         else if(_num == 11 && (_menu == "pause" || _menu == "end"))
         {
            _urlName = this.main.socialArray[1];
         }
         else if(_num == 12 && (_menu == "pause" || _menu == "end"))
         {
            if(Boolean(e.currentTarget.binnen) && e.currentTarget.binnen.currentFrame >= 4)
            {
               _urlName = this.main.socialArray[e.currentTarget.binnen.currentFrame];
            }
            else
            {
               _urlName = this.main.socialArray[2];
            }
         }
         else if(_num == 13 && (_menu == "pause" || _menu == "end"))
         {
            _urlName = this.main.socialArray[3];
         }
         else if(_num == 7 && _menu == "pause")
         {
            if(this.main.collection)
            {
               if(this.main.chinese)
               {
                  _urlName = "http://www.rustylake.com/301/cube-escape-collection-ios-china.html";
               }
               else if(this.main.itch)
               {
                  _urlName = "https://rustylake.itch.io/cube-escape-collection";
               }
               else if(this.main.gog)
               {
                  _urlName = "https://www.gog.com/game/cube_escape_collection";
               }
               else if(this.main.onMobile == 1)
               {
                  _urlName = "https://play.google.com/store/apps/details?id=air.com.RustyLake.CubeEscapeCollection";
               }
               else if(this.main.onMobile == 2)
               {
                  _urlName = "https://apps.apple.com/app/id1555267021";
               }
               else
               {
                  _urlName = "https://store.steampowered.com/app/1292940/Cube_Escape_Collection/";
               }
            }
            else
            {
               _urlName = this.main.gamesArray[this.main.gameID][this.main.onMobile];
            }
         }
         else if(_num == 7 && _menu == "tussen")
         {
            if(this.main.collection)
            {
               if(this.main.chinese)
               {
                  _urlName = "http://www.rustylake.com/301/cube-escape-collection-ios-china.html";
               }
               else if(this.main.itch)
               {
                  _urlName = "https://rustylake.itch.io/cube-escape-collection";
               }
               else if(this.main.gog)
               {
                  _urlName = "https://www.gog.com/game/cube_escape_collection";
               }
               else if(this.main.onMobile == 1)
               {
                  _urlName = "https://play.google.com/store/apps/details?id=air.com.RustyLake.CubeEscapeCollection";
               }
               else if(this.main.onMobile == 2)
               {
                  _urlName = "https://apps.apple.com/app/id1555267021";
               }
               else
               {
                  _urlName = "https://store.steampowered.com/app/1292940/Cube_Escape_Collection/";
               }
            }
            else
            {
               _urlName = this.main.gamesArray[this.main.gameID][this.main.onMobile];
            }
         }
         else if(_num == 1 && _menu == "end")
         {
            if(this.main.collection)
            {
               if(this.main.chinese)
               {
                  _urlName = "http://www.rustylake.com/301/cube-escape-collection-ios-china.html";
               }
               else if(this.main.itch)
               {
                  _urlName = "https://rustylake.itch.io/cube-escape-collection";
               }
               else if(this.main.gog)
               {
                  _urlName = "https://www.gog.com/game/cube_escape_collection";
               }
               else if(this.main.onMobile == 1)
               {
                  _urlName = "https://play.google.com/store/apps/details?id=air.com.RustyLake.CubeEscapeCollection";
               }
               else if(this.main.onMobile == 2)
               {
                  _urlName = "https://apps.apple.com/app/id1555267021";
               }
               else
               {
                  _urlName = "https://store.steampowered.com/app/1292940/Cube_Escape_Collection/";
               }
            }
            else
            {
               _urlName = this.main.gamesArray[this.main.gameID][this.main.onMobile];
            }
         }
         else if(_num == 8 && _menu == "pause")
         {
            if(Boolean(this.main.itch) && this.main.onMobile <= 0)
            {
               _urlName = this.main.gamesArray[14][3];
            }
            else if(Boolean(this.main.gog) && this.main.onMobile <= 0)
            {
               _urlName = this.main.gamesArray[14][4];
            }
            else
            {
               _urlName = this.main.gamesArray[14][this.main.onMobile];
            }
         }
         else if(_num == 9 && _menu == "pause")
         {
            if(Boolean(this.main.itch) && this.main.onMobile <= 0)
            {
               _urlName = this.main.urlArray[3];
            }
            else if(Boolean(this.main.gog) && this.main.onMobile <= 0)
            {
               _urlName = this.main.urlArray[4];
            }
            else
            {
               _urlName = this.main.urlArray[this.main.onMobile];
            }
         }
         else if(_num == 10 && _menu == "pause")
         {
            _urlName = e.currentTarget.urlName;
         }
         else if(_num == 10 && _menu == "end")
         {
            _urlName = e.currentTarget.urlName;
         }
         else if(_num == 8 && _menu == "end")
         {
            _urlName = this.main.gamesArray[14][this.main.onMobile];
         }
         else if(_num == 9 && _menu == "end")
         {
            _urlName = this.main.urlArray[this.main.onMobile];
         }
         else if(_num == 4 && _menu == "pause")
         {
            if(this.main.languageNum == 2 || this.main.languageNum == 18)
            {
               _urlName = this.main.gamesArray[this.main.gameID][4];
            }
            else
            {
               _urlName = this.main.gamesArray[this.main.gameID][3];
            }
         }
         else if(_num == 25 && _menu == "pause")
         {
            e.currentTarget.parent.parent.gotoLanguage();
         }
         else if(_num == 88 && _menu == "pause")
         {
            if(this.main.languageNum == 12)
            {
               _urlName = "https://discordapp.com/invite/87suKGR";
            }
            else if(this.main.languageNum == 10)
            {
               _urlName = "https://discordapp.com/invite/6ZWVwQA";
            }
            else if(this.main.languageNum == 5)
            {
               _urlName = "https://discordapp.com/invite/hhyYuEs";
            }
            else
            {
               _urlName = "https://discord.com/invite/vj27kjp";
            }
         }
         else if(_num == 3 && _menu == "pause")
         {
            if(this.main.gameName == "Samsara")
            {
               this.main.openScreen("manager");
            }
            else if(this.main.gameName == "The Lake")
            {
               this.main.openScreen("cubeTest");
            }
         }
         else if(_num == 1 && _menu == "tussen")
         {
            this.main.resetGame();
            this.main.openScreen("main");
         }
         else if(_num == 2 && _menu == "tussen" && e.currentTarget.used == null)
         {
            e.currentTarget.used = true;
            this.main.resetGame();
            if(this.main.settingArray[8] == 1)
            {
               this.main.settingArray[8] = 2;
            }
            else if(this.main.settingArray[8] == 2)
            {
               this.main.settingArray[8] = 4;
            }
            else if(this.main.settingArray[8] == 4)
            {
               this.main.settingArray[8] = 3;
            }
            else if(this.main.settingArray[8] == 3)
            {
               this.main.settingArray[8] = 5;
            }
            else if(this.main.settingArray[8] == 5)
            {
               this.main.settingArray[8] = 6;
            }
            else if(this.main.settingArray[8] == 6)
            {
               this.main.settingArray[8] = 7;
            }
            else if(this.main.settingArray[8] == 7)
            {
               this.main.settingArray[8] = 8;
            }
            else if(this.main.settingArray[8] == 8)
            {
               this.main.settingArray[8] = 9;
            }
            this.main.gameID = this.main.settingArray[8];
            if(this.main.gameID == 1)
            {
               this.main.gameName = "Seasons";
            }
            else if(this.main.gameID == 2)
            {
               this.main.gameName = "The Lake";
            }
            else if(this.main.gameID == 3)
            {
               this.main.gameName = "Harvey\'s Box";
            }
            else if(this.main.gameID == 4)
            {
               this.main.gameName = "Arles";
            }
            else if(this.main.gameID == 5)
            {
               this.main.gameName = "Case23";
            }
            else if(this.main.gameID == 6)
            {
               this.main.gameName = "The Mill";
            }
            else if(this.main.gameID == 7)
            {
               this.main.gameName = "Birthday";
            }
            else if(this.main.gameID == 8)
            {
               this.main.gameName = "Theatre";
            }
            else if(this.main.gameID == 9)
            {
               this.main.gameName = "The Cave";
            }
            this.main.openScreen("main");
         }
         else if(_num == 3 && _menu == "tussen")
         {
            this.main.resetGame();
            this.main.openScreen("all");
         }
         else if(!(_num == 1 && _menu == "end"))
         {
            if(_num == 2 && _menu == "end")
            {
               _urlName = this.main.urlArray[this.main.onMobile];
            }
            else if(_num == 3 && _menu == "end" && this.main.gameID == 2 && this.main.settingArray[10] <= 0)
            {
               this.main.openScreen("cubeTest");
            }
            else if(_num == 3 && _menu == "end")
            {
               this.main.resetGame();
               if(this.main.collection)
               {
                  this.main.openScreen("all");
               }
               else
               {
                  this.main.openScreen("main");
               }
            }
            else if(_num == 1 && _menu == "bonus")
            {
               _urlName = "https://docs.google.com/forms/d/e/1FAIpQLSc93-rS4lqC0U-L6PazepAEP_mmxXIZm6VaXx9MzAn7XTmMxw/viewform";
            }
            else if(_num == 3 && _menu == "bonus")
            {
               this.main.openScreen("manager");
            }
            else if(_menu == "language")
            {
               this.main.languageNum = _num;
               this.main.settingArray[0] = _num;
               this.main.settingArray[4] = 1;
               e.currentTarget.parent.parent.openBox(1);
            }
            else if(_num == 91)
            {
               navigateToURL(new URLRequest("javascript:window.close();"),"_self");
            }
            else if(_num == 83)
            {
               if(e.currentTarget.currentFrame == 1)
               {
                  e.currentTarget.gotoAndStop(3);
                  this.main.high_performance = 3;
                  this.main.settingArray[3] = 3;
                  this.main.makeQuality();
               }
               else if(e.currentTarget.currentFrame == 2)
               {
                  e.currentTarget.gotoAndStop(1);
                  this.main.high_performance = 1;
                  this.main.settingArray[3] = 1;
                  this.main.makeQuality();
               }
               else if(e.currentTarget.currentFrame == 3)
               {
                  e.currentTarget.gotoAndStop(2);
                  this.main.high_performance = 2;
                  this.main.settingArray[3] = 2;
                  this.main.makeQuality();
               }
               this.makeButton(e.currentTarget,e.currentTarget.num,"pause");
            }
            else if(_num == 85)
            {
               this.main.switchfullScreen();
               if(e.currentTarget.currentFrame == 1)
               {
                  e.currentTarget.gotoAndStop(2);
               }
               else if(e.currentTarget.currentFrame == 2)
               {
                  e.currentTarget.gotoAndStop(1);
               }
            }
            else if(_num == 84)
            {
               if(e.currentTarget.currentFrame == 1)
               {
                  e.currentTarget.gotoAndStop(2);
                  this.main.settingArray[2] = 1;
                  e.currentTarget.parent.parent.showEyetxt(1);
               }
               else if(e.currentTarget.currentFrame == 2)
               {
                  e.currentTarget.gotoAndStop(1);
                  this.main.settingArray[2] = 2;
                  e.currentTarget.parent.parent.showEyetxt(2);
               }
            }
            else if(_num > 80)
            {
               if(this.main.gameName == "Albert")
               {
                  this.main.switchfullScreen();
                  return;
               }
               if(e.currentTarget.currentFrame == 1)
               {
                  e.currentTarget.gotoAndStop(2);
                  if(_num == 81)
                  {
                     Sounds.musicMute = true;
                     Sounds.muteMusic(0);
                     this.main.settingArray[5] = 1;
                  }
                  else if(_num == 82)
                  {
                     Sounds.soundMute = true;
                     this.main.settingArray[6] = 1;
                  }
               }
               else if(e.currentTarget.currentFrame == 2)
               {
                  e.currentTarget.gotoAndStop(1);
                  if(_num == 81)
                  {
                     Sounds.musicMute = false;
                     Sounds.muteMusic(1);
                     this.main.settingArray[5] = 0;
                  }
                  else if(_num == 82)
                  {
                     Sounds.soundMute = false;
                     this.main.settingArray[6] = 0;
                  }
               }
            }
         }
         if(_urlName)
         {
            path = new URLRequest(_urlName);
            navigateToURL(path,"_blank");
            this.main.trackThis(1,_urlName);
         }
         Sounds.playSound("menuSelect",0.3);
      }
   }
}

