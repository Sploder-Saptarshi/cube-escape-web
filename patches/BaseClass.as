package
{
   import com.google.analytics.AnalyticsTracker;
   import com.google.analytics.GATracker;
   import com.greensock.*;
   import com.greensock.easing.*;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.StageDisplayState;
   import flash.display.StageQuality;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.net.SharedObject;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.Capabilities;
   import flash.utils.getDefinitionByName;
   
   public class BaseClass extends MovieClip
   {
      
      public static const MAX_REQUESTS:uint = 500;
      
      public static const DEBUG:Boolean = false;
      
      public var testingMode:Boolean = false;
      
      public var onMobile:int = 2;
      
      public var languageNum:int = 0;
      
      public var collection:Boolean = false;
      
      public var itch:Boolean = false;
      
      public var gog:Boolean = false;
      
      public var korean:Boolean = false;
      
      public var chinese:Boolean = false;
      
      public var tracker:AnalyticsTracker;
      
      public var runningScreen:*;
      
      public var pauseKnop:*;
      
      public var kader:*;
      
      public var currentScreen:String = null;
      
      public var lastScreen:String = null;
      
      public var blackScreen:*;
      
      private var bmd:BitmapData;
      
      public var menuClass:MenuClass;
      
      public var languageClass:LanguageClass;
      
      private var gameLoaded:Boolean = false;
      
      private var saveObj:*;
      
      private var collectionSaves:Array;
      
      private var collectionObjects:Array;
      
      private var saveDataObject:*;
      
      private var hint:* = null;
      
      private var hintArray:Array;
      
      private var hintNumber:*;
      
      public var hintKnop:*;
      
      private var hintKnoppen:*;
      
      public var levelArray:Array;
      
      public var worldArray:Array;
      
      public var settingArray:Array;
      
      public var progressArray:Array;
      
      public var inventNumArray:Array;
      
      public var button_info:Array;
      
      public var product_info:Array;
      
      public var socialArray:Array;
      
      public var urlArray:Array;
      
      public var gamesArray:Array;
      
      public var analyticsArray:Array;
      
      public var high_performance:int = 1;
      
      public var gameName:* = "test";
      
      public var saveName:* = "test";
      
      public var gameID:int = 0;
      
      public var savePath:String;
      
      public var basePath:Object;
      
      private var talkZinnen:Array;
      
      private var Main:*;
      
      public function BaseClass(_main:*, _game:String = null, _onMobile:int = 0)
      {
         var soundMuted:* = undefined;
         var musicMuted:* = undefined;
         var onAppActivated:Function = null;
         var onAppDeactivated:Function = null;
         var m:* = undefined;
         var savePartObject:* = undefined;
         var savePart:* = undefined;
         this.bmd = new BitmapData(1400,1000,false,0);
         this.collectionSaves = [];
         this.collectionObjects = [];
         this.hintArray = [];
         this.levelArray = [];
         this.worldArray = [];
         this.settingArray = [];
         this.progressArray = [];
         this.inventNumArray = [];
         this.button_info = [];
         this.product_info = [];
         this.socialArray = ["http://www.rustylake.com","https://www.facebook.com/pages/Rusty-Lake/381141388737583","https://twitter.com/rustylakecom","https://www.instagram.com/rustylakecom/","https://m.weibo.cn/u/6371040559","https://vk.com/rustylake","https://twitter.com/rustylake_jp","https://twitter.com/rustylake_kr"];
         this.urlArray = ["https://store.steampowered.com/franchise/rustylake","https://play.google.com/store/apps/dev?id=5341269538359321555","https://apps.apple.com/developer/rusty-lake/id979777164","https://rustylake.itch.io/","https://www.gog.com/games?devpub=rusty_lake"];
         this.gamesArray = [[],["http://www.rustylake.com/room-escape-games/cube-escape-seasons.html","http://www.rustylake.com/301/cube-escape-seasons-android.html","http://www.rustylake.com/301/cube-escape-seasons-ios.html","http://www.rustylake.com/walkthroughs/cube-escape-seasons/"],["http://www.rustylake.com/room-escape-games/cube-escape-the-lake.html","http://www.rustylake.com/301/cube-escape-the-lake-android.html","http://www.rustylake.com/301/cube-escape-the-lake-ios.html","http://www.rustylake.com/walkthroughs/cube-escape-the-lake/"],["http://www.rustylake.com/room-escape-games/cube-escape-harveys-box.html","http://www.rustylake.com/301/cube-escape-harveys-box-android.html","http://www.rustylake.com/301/cube-escape-harveys-box-ios.html","http://www.rustylake.com/walkthroughs/cube-escape-harveys-box/"],["http://www.rustylake.com/room-escape-games/cube-escape-arles.html","http://www.rustylake.com/301/cube-escape-arles-android.html","http://www.rustylake.com/301/cube-escape-arles-ios.html"
         ,"http://www.rustylake.com/walkthroughs/cube-escape-arles/"],["http://www.rustylake.com/room-escape-games/cube-escape-case-23.html","http://www.rustylake.com/301/cube-escape-case-23-android.html","http://www.rustylake.com/301/cube-escape-case-23-ios.html","http://www.rustylake.com/walkthroughs/cube-escape-case-23/"],["http://www.rustylake.com/room-escape-games/cube-escape-the-mill.html","http://www.rustylake.com/301/cube-escape-the-mill-android.html","http://www.rustylake.com/301/cube-escape-the-mill-ios.html","http://www.rustylake.com/walkthroughs/cube-escape-the-mill/"],["http://www.rustylake.com/room-escape-games/cube-escape-birthday.html","http://www.rustylake.com/301/cube-escape-birthday-android.html","http://www.rustylake.com/301/cube-escape-birthday-ios.html","http://www.rustylake.com/walkthroughs/cube-escape-birthday/"],["http://www.rustylake.com/room-escape-games/cube-escape-theatre.html","http://www.rustylake.com/301/cube-escape-theatre-android.html","http://www.rustylake.com/301/cube-escape-theatre-ios.html"
         ,"http://www.rustylake.com/walkthroughs/cube-escape-theatre/"],["http://www.rustylake.com/room-escape-games/cube-escape-the-cave.html","http://www.rustylake.com/301/cube-escape-the-cave-android.html","http://www.rustylake.com/301/cube-escape-the-cave-ios.html","http://www.rustylake.com/walkthroughs/cube-escape-the-cave/"],["https://store.steampowered.com/app/909080/Cube_Escape_Paradox/","http://www.rustylake.com/301/cube-escape-paradox-android.html","http://www.rustylake.com/301/cube-escape-paradox-ios.html"],["https://store.steampowered.com/app/435120/Rusty_Lake_Hotel/","http://www.rustylake.com/301/rusty-lake-hotel-android.html","http://www.rustylake.com/301/rusty-lake-hotel-ios.html"],["https://store.steampowered.com/app/532110/Rusty_Lake_Roots/","http://www.rustylake.com/301/rusty-lake-roots-android.html","http://www.rustylake.com/301/rusty-lake-roots-ios.html"],["https://store.steampowered.com/app/744190/Rusty_Lake_Paradise/","http://www.rustylake.com/301/rusty-lake-paradise-android.html"
         ,"http://www.rustylake.com/301/rusty-lake-paradise-ios.html"],["http://www.rustylake.com/301/the-white-door-steam.html","http://www.rustylake.com/301/the-white-door-android.html","http://www.rustylake.com/301/the-white-door-ios.html","https://secondmaze.itch.io/the-white-door","https://www.gog.com/game/the_white_door"],[],[],[],[],[],[],["http://www.rustylake.com/301/samsara-room-steam.html","http://www.rustylake.com/301/samsara-room-android.html","http://www.rustylake.com/301/samsara-room-ios.html","http://www.rustylake.com/walkthroughs/samsara-room/","http://www.rustylake.com/301/samsara-room-china.html"],[],[],[]];
         this.analyticsArray = [[],["UA-146810092-3","UA-146810092-3","UA-146810092-3"],["UA-146810092-3","UA-146810092-3","UA-146810092-3"],["UA-146810092-3","UA-146810092-3","UA-146810092-3"],["UA-146810092-3","UA-146810092-3","UA-146810092-3"],["UA-146810092-3","UA-146810092-3","UA-146810092-3"],["UA-146810092-3","UA-146810092-3","UA-146810092-3"],["UA-146810092-3","UA-146810092-3","UA-146810092-3"],["UA-146810092-3","UA-146810092-3","UA-146810092-3"],["UA-146810092-3","UA-146810092-3","UA-146810092-3"],["UA-146810092-3","UA-146810092-3","UA-146810092-3"],["UA-146810092-3","UA-146810092-3","UA-146810092-3"],["UA-146810092-3","UA-146810092-3","UA-146810092-3"],["UA-146810092-3","UA-146810092-3","UA-146810092-3"],["UA-146810092-3","UA-146810092-3","UA-146810092-3"],[],[],[],[],[],[]];
         this.basePath = SaveGameClass.getBaseFile(SaveGameClass.getOS());
         this.talkZinnen = [];
         super();
         onAppActivated = function(e:Event):void
         {
            if(musicMuted)
            {
               Sounds.musicMute = false;
               Sounds.muteMusic(1);
               musicMuted = false;
            }
            if(soundMuted)
            {
               Sounds.soundMute = false;
               soundMuted = false;
            }
         };
         onAppDeactivated = function(e:Event):void
         {
            if(Sounds.musicMute == false)
            {
               musicMuted = true;
            }
            if(Sounds.soundMute == false)
            {
               soundMuted = true;
            }
            Sounds.soundMute = true;
            Sounds.musicMute = true;
            Sounds.muteMusic(0);
            Sounds.stopSound();
         };
         this.selectGame(_game);
         this.onMobile = _onMobile;
         this.savePath = "Rusty Lake/" + this.saveName + "/" + "saveGame" + ".sav";
         this.tracker = new GATracker(_main,"UA-164792059-2","AS3",DEBUG);
         this.gameName = _game;
         this.Main = _main;
         if(this.onMobile == 0)
         {
            this.saveObj = SaveGameClass.loadFromFile(this.basePath,this.savePath);
         }
         else if(this.onMobile >= 2 && this.collection)
         {
            for(m = 0; m < 40; m++)
            {
               savePartObject = SharedObject.getLocal(this.saveName + "l" + m);
               this.collectionObjects.push(savePartObject);
               savePart = savePartObject.data;
               this.collectionSaves.push(savePart);
            }
         }
         else
         {
            this.saveDataObject = SharedObject.getLocal(this.saveName);
            this.saveObj = this.saveDataObject.data;
         }
         if(this.saveObj == null)
         {
            this.saveObj = new Object();
         }
         addEventListener(Event.ENTER_FRAME,this.update);
         this.loadFromDisk();
         this.makeStage();
         this.menuClass = new MenuClass(this);
         this.languageClass = new LanguageClass(this);
         this.getButton();
         this.Main.stage.addEventListener(MouseEvent.MOUSE_UP,this.stageMouseUp,false,0,true);
         this.Main.stage.addEventListener(MouseEvent.MOUSE_DOWN,this.stageMouseDown,false,0,true);
         this.Main.stage.addEventListener(Event.ACTIVATE,onAppActivated);
         this.Main.stage.addEventListener(Event.DEACTIVATE,onAppDeactivated);
         soundMuted = false;
         musicMuted = false;
      }
      
      public function selectGame(_game:*) : *
      {
         this.gameName = _game;
         if(_game == "Samsara")
         {
            this.saveName = "SamsaraRoom";
            this.gameID = 21;
         }
         else if(_game == "Albert")
         {
            this.saveName = "Albert_sav6";
            this.gameID = 1;
         }
         else if(_game == "Seasons")
         {
            this.saveName = "Seasons_sav";
            this.gameID = 1;
         }
         else if(_game == "The Lake")
         {
            this.saveName = "TheLake_sav1";
            this.gameID = 2;
         }
         else if(_game == "Harvey\'s Box")
         {
            this.saveName = "HB_sav";
            this.gameID = 3;
         }
         else if(_game == "Arles")
         {
            this.saveName = "Arles_sav";
            this.gameID = 4;
         }
         else if(_game == "Case23")
         {
            this.saveName = "Case23_sav";
            this.gameID = 5;
         }
         else if(_game == "The Mill")
         {
            this.saveName = "TheMill_sav";
            this.gameID = 6;
         }
         else if(_game == "Birthday")
         {
            this.saveName = "Birthday_sav1";
            this.gameID = 7;
         }
         else if(_game == "Theatre")
         {
            this.saveName = "Theatre_sav";
            this.gameID = 8;
         }
         else if(_game == "The Cave")
         {
            this.saveName = "TheCave_sav1";
            this.gameID = 9;
         }
         else if(_game == "All")
         {
            this.saveName = "CubeEscapeCollection";
            this.collection = true;
         }
      }
      
      private function getButton() : *
      {
         var ioErrorHandler:Function = null;
         var processXML:Function = null;
         ioErrorHandler = function(event:IOErrorEvent):void
         {
            trace("no connection to button xml");
         };
         processXML = function(e:Event):void
         {
            var loader:Loader = null;
            var loadingError:Function = null;
            var doneLoad:Function = null;
            loadingError = function(e:IOErrorEvent):void
            {
               loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,doneLoad);
               loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,loadingError);
            };
            doneLoad = function(e:Event):void
            {
               button_info.push(loader);
               loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,doneLoad);
               loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,loadingError);
            };
            var myXML:* = new XML(e.target.data);
            button_info.push(myXML.name,myXML.url,myXML.icon);
            if(onMobile == 2 && korean)
            {
               button_info[1] = myXML.url_ios;
            }
            else if(onMobile == 2 && chinese)
            {
               button_info[1] = myXML.url_ios_china;
            }
            else if(onMobile == 2)
            {
               button_info[1] = myXML.url_ios_kr;
            }
            else if(onMobile == 0 && itch)
            {
               button_info[1] = myXML.url_itch;
            }
            else if(onMobile == 0 && gog)
            {
               button_info[1] = myXML.url_gog;
            }
            else if(onMobile == 0)
            {
               button_info[1] = myXML.url_steam;
            }
            loader = new Loader();
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE,doneLoad);
            loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,loadingError);
            loader.load(new URLRequest(myXML.icon));
         };
         var myLoader:URLLoader = new URLLoader();
         var path:* = new URLRequest("https://panel.loyaltygame.com/promo_game.xml");
         myLoader.load(path);
         myLoader.addEventListener(IOErrorEvent.IO_ERROR,ioErrorHandler);
         myLoader.addEventListener(Event.COMPLETE,processXML);
      }
      
      public function startGame() : *
      {
         if(this.testingMode)
         {
            this.openStart();
         }
         else
         {
            this.openScreenNow("rusty");
         }
      }
      
      public function openStart() : *
      {
         if(this.gameName == "Samsara")
         {
            this.openScreenNow(this.gameName);
         }
         else if(this.korean)
         {
            this.openScreenNow("adult");
         }
         else if(this.gameName == "All")
         {
            this.openScreenNow("all");
         }
         else if(this.gameName == "Albert")
         {
            this.openScreenNow("manager");
         }
         else
         {
            this.openScreenNow("main");
         }
      }
      
      public function afterMain() : *
      {
         if(this.gameName == "Seasons")
         {
            this.openScreen("cubeSpace");
         }
         else if(this.gameName == "Case23")
         {
            this.openScreen("levelSelect");
         }
         else if(this.gameName == "The Mill")
         {
            this.openScreen("millSelect");
         }
         else if(this.gameName == "Birthday" && this.progressArray[this.gameID][6] < 3)
         {
            this.openScreen("birthdayIntro");
         }
         else if(this.gameName == "Birthday" && this.progressArray[this.gameID][6] >= 3)
         {
            this.openScreen("birthday");
         }
         else if(this.gameName == "Theatre" && this.progressArray[this.gameID][6] < 4)
         {
            this.openScreen("theatreIntro");
         }
         else if(this.gameName == "Theatre" && this.progressArray[this.gameID][6] >= 4)
         {
            this.openScreen("theatre");
         }
         else if(this.gameName == "The Cave" && this.progressArray[this.gameID][6] < 10)
         {
            this.openScreen("caveIntro");
         }
         else if(this.gameName == "The Cave" && this.progressArray[this.gameID][6] >= 10)
         {
            this.openScreen("cave");
         }
         else if(this.gameName == "Albert")
         {
            this.openScreen("manager");
         }
         else
         {
            this.openScreen("cubeTest");
         }
      }
      
      private function makeArrays() : *
      {
         var g:* = undefined;
         for(var m:* = 0; m < 40; m++)
         {
            this.worldArray[m] = [];
            this.levelArray[m] = [];
            if(this.gameID == m || this.gameID == 5 && m >= 21 && m <= 25 || this.gameID == 1 && m >= 11 && m <= 15 || this.gameID == 6 && m >= 15 && m <= 18 || this.collection)
            {
               for(g = 0; g < 140; g++)
               {
                  this.worldArray[m][g] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
                  this.levelArray[m][g] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
               }
               this.inventNumArray[m] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
               this.progressArray[m] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
            }
         }
      }
      
      public function saveToDisk(_all:Boolean = false) : *
      {
         var m:* = undefined;
         if(this.gameLoaded && this.onMobile >= 2 && this.collection && this.collectionSaves.length > 0)
         {
            for(m = 0; m < 40; m++)
            {
               if(this.gameID == m || this.gameID == 5 && m >= 21 && m <= 25 || this.gameID == 1 && m >= 11 && m <= 15 || this.gameID == 6 && m >= 15 && m <= 18 || _all)
               {
                  this.collectionSaves[m].levelArray = this.levelArray[m];
                  this.collectionSaves[m].worldArray = this.worldArray[m];
                  this.collectionSaves[m].inventNumArray = this.inventNumArray[m];
                  this.collectionSaves[m].progressArray = this.progressArray[m];
                  this.collectionObjects[m].flush();
               }
            }
            this.collectionSaves[0].settingArray = this.settingArray;
            this.collectionObjects[0].flush();
         }
         else if(this.gameLoaded && this.saveObj != null)
         {
            this.saveObj.levelArray = this.levelArray;
            this.saveObj.worldArray = this.worldArray;
            this.saveObj.settingArray = this.settingArray;
            this.saveObj.inventNumArray = this.inventNumArray;
            this.saveObj.progressArray = this.progressArray;
            if(this.onMobile == 0)
            {
               SaveGameClass.saveToFile(this.basePath,this.savePath,this.saveObj);
            }
            else
            {
               this.saveDataObject.flush();
            }
         }
         else
         {
            this.loadFromDisk();
         }
      }
      
      public function loadFromDisk() : *
      {
         var m:* = undefined;
         if(!this.gameLoaded)
         {
            if(this.onMobile >= 2 && this.collection && this.collectionSaves[0].settingArray != null)
            {
               for(m = 0; m < this.collectionSaves.length; m++)
               {
                  this.levelArray[m] = this.collectionSaves[m].levelArray;
                  this.worldArray[m] = this.collectionSaves[m].worldArray;
                  this.inventNumArray[m] = this.collectionSaves[m].inventNumArray;
                  this.progressArray[m] = this.collectionSaves[m].progressArray;
               }
               this.settingArray = this.collectionSaves[0].settingArray;
            }
            else if(this.saveObj.levelArray != null)
            {
               this.levelArray = this.saveObj.levelArray;
               this.worldArray = this.saveObj.worldArray;
               this.settingArray = this.saveObj.settingArray;
               this.inventNumArray = this.saveObj.inventNumArray;
               this.progressArray = this.saveObj.progressArray;
            }
            else
            {
               this.settingArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
               this.makeArrays();
               this.gameLoaded = true;
               this.saveToDisk(true);
            }
            this.gameLoaded = true;
         }
         this.makeSettings();
      }
      
      private function makeSettings() : *
      {
         if(this.settingArray[5])
         {
            Sounds.musicMute = true;
         }
         if(this.settingArray[6])
         {
            Sounds.soundMute = true;
         }
         if(this.settingArray[0])
         {
            this.languageNum = this.settingArray[0];
         }
         this.makeQuality();
         if(this.collection && this.settingArray[2] <= 0 && this.onMobile <= 0)
         {
            this.settingArray[2] = 2;
         }
      }
      
      public function makeQuality() : *
      {
         if(this.settingArray[3] == 3)
         {
            this.Main.stage.quality = StageQuality.LOW;
         }
         else if(this.settingArray[3] == 2)
         {
            this.Main.stage.quality = StageQuality.MEDIUM;
         }
         else if(this.settingArray[3] == 1)
         {
            if(this.onMobile == 1 && this.gameID == 8)
            {
               this.Main.stage.quality = StageQuality.MEDIUM;
            }
            else
            {
               this.Main.stage.quality = StageQuality.HIGH;
            }
         }
      }
      
      private function stageMouseDown(e:MouseEvent) : void
      {
         if(this.clickedOn(this.pauseKnop))
         {
            this.pauseKnop.hit = true;
         }
         if(Boolean(this.clickedOn(this.hintKnop)) && Boolean(this.hintKnop.visible) && this.hintKnop.alpha >= 1)
         {
            this.hintKnop.hit = true;
         }
         if(this.currentScreen == "birthday")
         {
            this.runningScreen.mouseDownNow();
         }
         else if(this.currentScreen == "manager")
         {
            this.runningScreen.mouseDownNow();
         }
      }
      
      private function stageMouseUp(e:MouseEvent) : void
      {
         if(Boolean(this.clickedOn(this.pauseKnop)) && Boolean(this.pauseKnop.hit))
         {
            this.goBack();
            Sounds.playSound("menuSelect",0.3);
         }
         if(Boolean(this.clickedOn(this.hintKnop)) && Boolean(this.hintKnop.hit) && Boolean(this.hintKnop.visible) && this.hintKnop.alpha >= 1)
         {
            if(this.hintKnoppen)
            {
               this.closeHintKnoppen();
            }
            else if(this.runningScreen.progressArray[4])
            {
               this.openHint(this.runningScreen.progressArray[4]);
            }
            Sounds.playSound("menuSelect",0.3);
         }
         else if(this.hint)
         {
            this.closeHint();
         }
         else if(Boolean(this.hintKnoppen) && Boolean(this.clickedOn(this.hintKnoppen.knop1)))
         {
            this.loadHint();
         }
         else if(Boolean(this.hintKnoppen) && Boolean(this.clickedOn(this.hintKnoppen.knop2)))
         {
            this.settingArray[12] = 1;
            this.openScreen("pause");
         }
         else if(this.hintKnoppen)
         {
            this.closeHintKnoppen();
         }
         else if(this.currentScreen == "pause" && this.Main.stage.mouseY > 100)
         {
            this.runningScreen.clickScreen();
         }
         this.pauseKnop.hit = null;
         this.makeParticle();
         if(this.currentScreen == "birthday")
         {
            this.runningScreen.mouseUpNow();
         }
         else if(this.currentScreen == "manager")
         {
            this.runningScreen.mouseUpNow();
         }
      }
      
      public function checkHint(_num:*) : *
      {
         var array:* = [[],[[],[5,6,7,8,13,21,24,111,112,114,32,52,120,121,122,123,124,125,126,127,128],[5,6,7,8,11,14,24,111,112,114,32,25,1,2,41,101,102,103,104,105,106,107,108,109,111,112,113,114,115],[5,6,7,8,13,21,24,25,32,111,112,114,1,2,41],[5,6,7,8,13,32,111,112,114,1,2]],[5,6,7,8,12,14,24],[5,6,7,8,11,13,51,101,102,103,104,105,106,107,108,109,110],[5,6,7,8,101,102,103,105,106],[[],[3,4,5,6,7,8,34],[1,2,3,4,5,6,7,8,21,24],[1,2,4,5,6,7,8,41],[5,6,7,8,11,14,21,2],[101,102]],[[],[1,2,7,8],[2,3,4,5,6,7,8,11,14,24,43,73,41,42,22,53],[3,5,6,7,8]],[1,3,4,17,31,34,43,52,53,54,64,70,74,83,84,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116],[1,2,3,4,13,17,20,21,22,32,33,34,43,53,65,71,81,91,92,101,102,103,104,105,106,107,108,109,110,111],[[],[1,2,3,4,15,16,23,33,61,63,71,72,73,83],[1,2,3,4,11,13,21,32,55,58,65,66,67,68,69,71,74],[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18],[]],[]];
         var _array:* = array[this.gameID];
         if(this.gameID == 1 || this.gameID == 5 || this.gameID == 6 || this.gameID == 9)
         {
            _array = array[this.gameID][this.progressArray[this.gameID][5]];
         }
         if(_array.indexOf(_num) >= 0)
         {
            this.hintKnop.alpha = 0.3;
         }
         else
         {
            this.hintKnop.alpha = 1;
            if(Boolean(this.hintArray.indexOf(this.progressArray[this.gameID][5] + "_" + _num) >= 0) || Boolean(this.settingArray[1]) || this.collection && this.onMobile <= 0)
            {
               this.hintKnop.gotoAndStop(2);
            }
            else
            {
               this.hintKnop.gotoAndStop(1);
            }
         }
      }
      
      public function showHint() : *
      {
         var hintsClass:Class = null;
         trace("show hint?");
         if(this.hint)
         {
            this.closeHint();
            return;
         }
         if(this.hintKnoppen)
         {
            this.closeHintKnoppen();
         }
         var _name:* = "hints_" + this.gameID;
         if(this.gameID == 1)
         {
            _name = "hints_" + this.gameID + "_" + this.progressArray[this.gameID][5];
         }
         else if(this.gameID == 5)
         {
            _name = "hints_" + this.gameID + "_" + this.progressArray[this.gameID][5];
         }
         else if(this.gameID == 6)
         {
            _name = "hints_" + this.gameID + "_" + this.progressArray[this.gameID][5];
         }
         else if(this.gameID == 9)
         {
            _name = "hints_" + this.gameID + "_" + this.progressArray[this.gameID][5];
         }
         if(ApplicationDomain.currentDomain.hasDefinition(_name) == false)
         {
            trace("HINTS NOT AVAILABLE");
            return;
         }
         hintsClass = getDefinitionByName(_name) as Class;
         this.hint = new hintsClass();
         this.hint.x = 350;
         this.hint.y = 120;
         this.hint.gotoAndStop(this.hintNumber);
         this.Main.addChild(this.hint);
         TweenLite.from(this.hint,1,{"alpha":0});
         this.Main.setChildIndex(this.pauseKnop,this.Main.numChildren - 1);
         this.Main.setChildIndex(this.hintKnop,this.Main.numChildren - 1);
         this.hintKnop.gotoAndStop(5);
         this.hintArray.push(this.progressArray[this.gameID][5] + "_" + this.hintNumber);
      }
      
      public function startPurchase() : *
      {
         if(this.onMobile >= 1)
         {
            this.Main.startPurchase();
         }
      }
      
      public function restorePurchase() : *
      {
         if(this.onMobile >= 1)
         {
            this.Main.restorePurchase();
         }
      }
      
      public function consumePurchase() : *
      {
      }
      
      public function getPurchase() : *
      {
         this.settingArray[1] = 1;
         if(Boolean(this.runningScreen) && this.currentScreen == "pause")
         {
            this.runningScreen.getPurchase();
         }
         else
         {
            this.showHint();
         }
      }
      
      public function readyPurchase() : *
      {
         if(Boolean(this.runningScreen) && this.currentScreen == "pause")
         {
            this.runningScreen.readyPurchase();
         }
      }
      
      public function readyRestore() : *
      {
         if(Boolean(this.runningScreen) && this.currentScreen == "pause")
         {
            this.runningScreen.readyRestore();
         }
      }
      
      private function loadHint() : *
      {
         if(this.onMobile >= 1)
         {
            this.hintKnop.gotoAndStop(3);
            this.Main.loadHint();
         }
      }
      
      private function openHint(_num:*) : *
      {
         if(this.hint)
         {
            this.closeHint();
            return;
         }
         this.hintNumber = _num;
         if(this.hintKnop.currentFrame == 2 || this.collection && this.onMobile <= 0)
         {
            this.showHint();
            return;
         }
         this.hintKnoppen = new hintMenu();
         this.hintKnop.gotoAndStop(5);
         this.hintKnoppen.x = 350;
         this.hintKnoppen.y = 120;
         this.Main.addChild(this.hintKnoppen);
         this.menuClass.makeButton(this.hintKnoppen.knop1,1,"hints");
         if(Boolean(this.onMobile) && this.chinese)
         {
            this.hintKnoppen.knop1.y += 50;
            this.hintKnoppen.knop2.y += 3000;
         }
         else
         {
            this.menuClass.makeButton(this.hintKnoppen.knop2,2,"hints");
         }
         TweenLite.from(this.hintKnoppen,1,{"alpha":0});
         this.Main.setChildIndex(this.pauseKnop,this.Main.numChildren - 1);
         this.Main.setChildIndex(this.hintKnop,this.Main.numChildren - 1);
      }
      
      public function closeHintKnoppen() : *
      {
         if(this.hintKnoppen == null)
         {
            return;
         }
         this.Main.removeChild(this.hintKnoppen);
         this.hintKnoppen = null;
         if(this.hintArray.indexOf(this.progressArray[this.gameID][5] + "_" + this.hintNumber) >= 0)
         {
            this.hintKnop.gotoAndStop(2);
         }
         else
         {
            this.hintKnop.gotoAndStop(1);
         }
      }
      
      private function closeHint() : *
      {
         this.Main.removeChild(this.hint);
         this.hint = null;
         if(this.hintArray.indexOf(this.progressArray[this.gameID][5] + "_" + this.hintNumber) >= 0)
         {
            this.hintKnop.gotoAndStop(2);
         }
         else
         {
            this.hintKnop.gotoAndStop(1);
         }
      }
      
      public function makeTxtfield(_string:*, _field:*, _size:int = 1) : *
      {
         if(Boolean(this.languageNum > 0) && Boolean(this.languageClass) && Boolean(this.languageClass.checkWord(_string)))
         {
            _string = this.languageClass.checkWord(_string);
            trace(_string);
            _string = _string.split("\\n").join("\n");
         }
         else if(Texten.getSentence(_string))
         {
            _string = Texten.getSentence(_string);
         }
         _field.text = _string;
         this.languageClass.changeFont(_field,this.languageNum,"field",_size);
      }
      
      public function makeTxt(_string:*, _num:int = 1, _x:Number = 0) : *
      {
         var _woord:* = undefined;
         var z:* = undefined;
         var _old:* = undefined;
         if(_num != 10 && _num != 4)
         {
            this.removeZinnen(false);
         }
         if(Boolean(this.languageNum > 0) && Boolean(this.languageClass) && Boolean(this.languageClass.checkWord(_string)))
         {
            _string = this.languageClass.checkWord(_string);
         }
         else if(Texten.getSentence(_string))
         {
            _string = Texten.getSentence(_string);
         }
         var _posX:* = 0;
         var _posY:* = 0;
         if(_num == 1 || _num == 3 || _num == 4)
         {
            _posX = 20;
            _posY = 80;
         }
         else if(_num == 10)
         {
            _posX = 33;
            _posY = 47;
         }
         else if(_num == 2)
         {
            _posX = 670 + _x;
            _posY = 80;
         }
         for(var p:* = -1; p < this.talkZinnen.length; p++)
         {
            if(Boolean(this.talkZinnen[p]) && Boolean(this.talkZinnen[p].x < 300) && _num != 2)
            {
               _posY += 70;
            }
         }
         if(String(_string).length >= 50)
         {
            for(z = 50; z < String(_string).length; z++)
            {
               if(String(_string).charAt(z) == " ")
               {
                  _old = String(_string);
                  _string = _old.slice(0,z) + "...";
                  TweenLite.to(this,0.3,{
                     "onComplete":this.makeTxt,
                     "onCompleteParams":["..." + _old.slice(z,_old.length),4]
                  });
                  z = 1000;
               }
            }
         }
         var wolkje:* = new Wolk(_string,_num,_posX,_posY);
         this.talkZinnen.push(wolkje);
         if(Boolean(this.runningScreen) && _num < 10)
         {
            this.runningScreen.addChild(wolkje);
         }
         else
         {
            this.Main.addChild(wolkje);
         }
         wolkje.woord = _woord;
         if(wolkje.txt)
         {
            this.languageClass.changeFont(wolkje.txt,this.languageNum,"wolkje");
         }
         wolkje.setUp(_string);
      }
      
      public function removeZinnen(_now:Boolean = false) : *
      {
         for(var z:* = 0; z < this.talkZinnen.length; z++)
         {
            if(this.talkZinnen[z].parent == null)
            {
               this.talkZinnen.splice(z,1);
            }
         }
         while(this.talkZinnen.length > 0 && this.talkZinnen[0].currentFrame != 3 && this.talkZinnen[0].currentFrame != 10)
         {
            if(_now)
            {
               this.talkZinnen[0].deleteWolk();
            }
            else
            {
               this.talkZinnen[0].removeWolk();
            }
            this.talkZinnen.splice(0,1);
         }
      }
      
      public function androidBack() : *
      {
         if(this.currentScreen == "Samsara" || this.currentScreen == "rusty")
         {
            return;
         }
         this.goBack(true);
      }
      
      public function goBack(_android:Boolean = false) : *
      {
         if(this.currentScreen == "manager" && this.gameName == "Albert")
         {
            this.resetGame();
            this.openScreen("manager");
            return;
         }
         if(Boolean(this.currentScreen == "manager") && Boolean(this.runningScreen) && _android)
         {
            this.runningScreen.goBack();
            return;
         }
         if(this.currentScreen == "manager" && _android == false)
         {
            this.openScreen("pause");
         }
         else if(this.currentScreen == "main")
         {
            this.openScreen("pause");
         }
         else if(this.currentScreen == "all")
         {
            this.openScreen("pause");
         }
         else if(this.currentScreen == "cubeTest")
         {
            this.openScreen("pause");
         }
         else if(this.currentScreen == "mill")
         {
            this.openScreen("pause");
         }
         else if(this.currentScreen == "millSelect")
         {
            this.openScreen("pause");
         }
         else if(this.currentScreen == "birthday")
         {
            this.openScreen("pause");
         }
         else if(this.currentScreen == "birthdayIntro")
         {
            this.openScreen("pause");
         }
         else if(this.currentScreen == "theatre")
         {
            this.openScreen("pause");
         }
         else if(this.currentScreen == "theatreIntro")
         {
            this.openScreen("pause");
         }
         else if(this.currentScreen == "cave")
         {
            this.openScreen("pause");
         }
         else if(this.currentScreen == "caveIntro")
         {
            this.openScreen("pause");
         }
         else if(this.currentScreen == "cubeSpace")
         {
            this.openScreen("pause");
         }
         else if(this.currentScreen == "levelSelect")
         {
            this.openScreen("pause");
         }
         else if(this.currentScreen == "pause" && this.lastScreen == "Samsara")
         {
            this.openScreen("Samsara");
         }
         else if(this.currentScreen == "pause" && this.lastScreen == "main")
         {
            this.openScreen("main");
         }
         else if(this.currentScreen == "pause" && this.lastScreen == "all")
         {
            this.openScreen("all");
         }
         else if(this.currentScreen == "pause")
         {
            this.backToGame();
         }
         else if(this.currentScreen == "Samsara")
         {
            this.openScreen("pause");
         }
         else if(this.currentScreen == "tussen")
         {
            this.openScreen("pause");
         }
         else
         {
            if(this.currentScreen != "resetAll")
            {
               return;
            }
            this.openScreen("pause");
         }
      }
      
      public function backToGame() : *
      {
         if(this.gameName == "Samsara")
         {
            this.openScreen("manager");
         }
         else if(this.gameName == "Albert")
         {
            this.openScreen("manager");
         }
         else if(this.gameName == "The Mill")
         {
            this.openScreen("mill");
         }
         else if(this.gameName == "Birthday")
         {
            this.openScreen("birthday");
         }
         else if(this.gameName == "The Cave")
         {
            this.openScreen("cave");
         }
         else if(this.gameName == "Theatre")
         {
            this.openScreen("theatre");
         }
         else
         {
            this.openScreen("cubeTest");
         }
      }
      
      public function resetGame() : *
      {
         if(this.collection)
         {
            this.resetLevel(this.gameID);
            if(this.gameID == 1)
            {
               this.resetLevel(11);
               this.resetLevel(12);
               this.resetLevel(13);
               this.resetLevel(14);
            }
            else if(this.gameID == 5)
            {
               this.resetLevel(21);
               this.resetLevel(22);
               this.resetLevel(23);
               this.resetLevel(24);
               this.resetLevel(25);
            }
            else if(this.gameID == 6)
            {
               this.resetLevel(15);
               this.resetLevel(16);
               this.resetLevel(17);
               this.resetLevel(18);
            }
            this.saveToDisk();
         }
         else
         {
            this.resetAll();
         }
      }
      
      public function resetAchievements() : *
      {
         this.settingArray[11] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
      }
      
      public function resetLevel(_num:*) : *
      {
         this.worldArray[_num] = [];
         this.levelArray[_num] = [];
         for(var g:* = 0; g < 150; g++)
         {
            this.worldArray[_num][g] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
            this.levelArray[_num][g] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
         }
         this.inventNumArray[_num] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
         this.progressArray[_num] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
      }
      
      public function resetAll() : *
      {
         this.makeArrays();
         this.saveToDisk(true);
         this.hintArray = [];
      }
      
      private function clickedOn(_ding:*) : *
      {
         if(_ding == null)
         {
            return false;
         }
         if(_ding.hitTestPoint(this.Main.stage.mouseX,this.Main.stage.mouseY,true))
         {
            return true;
         }
         return false;
      }
      
      private function makeStage() : *
      {
         var screenWidth:Number = Capabilities.screenResolutionX;
         var screenHeight:Number = Capabilities.screenResolutionY;
         this.Main.stage.color = 0;
         this.pauseKnop = new pauseKnopMC();
         this.Main.addChild(this.pauseKnop);
         this.pauseKnop.x = 800 - 23;
         this.pauseKnop.y = 23;
         this.pauseKnop.buttonMode = true;
         this.hintKnop = new hintKnopMC();
         this.Main.addChild(this.hintKnop);
         this.hintKnop.x = 800 - 75;
         this.hintKnop.y = 23;
         this.hintKnop.buttonMode = true;
         this.kader = new kaderMC();
         this.Main.addChild(this.kader);
      }
      
      public function makeParticle(_num:int = 0, _placeX:Number = -1, _placeY:Number = -1, _ding:MovieClip = null) : *
      {
         var particle:* = undefined;
         var removeParticle:Function = null;
         var fadeParticle:Function = function(_particle:*):*
         {
            TweenLite.to(particle,0.3,{
               "alpha":0,
               "onComplete":removeParticle,
               "onCompleteParams":[particle]
            });
         };
         removeParticle = function(_particle:*):*
         {
            if(_particle.parent != null)
            {
               _particle.parent.removeChild(_particle);
            }
            if(_particle != null)
            {
               _particle = null;
            }
         };
         particle = new partMC();
         particle.x = this.Main.stage.mouseX;
         particle.y = this.Main.stage.mouseY;
         if(_placeX != -1)
         {
            particle.x = _placeX;
         }
         if(_placeY != -1)
         {
            particle.y = _placeY;
         }
         if(_ding != null)
         {
            _ding.addChild(particle);
         }
         else
         {
            this.Main.stage.addChild(particle);
         }
         particle.gotoAndStop(_num);
         if(_num <= 1)
         {
            particle.alpha = 0;
            TweenLite.from(particle,0.5,{
               "scaleX":0,
               "scaleY":0,
               "alpha":0.5,
               "onComplete":removeParticle,
               "onCompleteParams":[particle]
            });
         }
         else if(_num == 2 || _num == 3)
         {
            particle.scaleX = particle.scaleY = 0.3;
            particle.rotation = Math.random() * 300;
            TweenLite.to(particle,0.3,{
               "scaleX":1,
               "scaleY":1,
               "alpha":0,
               "onComplete":removeParticle,
               "onCompleteParams":[particle]
            });
         }
      }
      
      public function openScreen(_num:*, _level:int = 0) : *
      {
         if(this.blackScreen)
         {
            return;
         }
         this.blackScreen = new Bitmap(this.bmd);
         this.Main.addChild(this.blackScreen);
         this.blackScreen.x = -300;
         this.blackScreen.y = -300;
         this.blackScreen.alpha = 0;
         TweenLite.to(this.blackScreen,0.4,{
            "alpha":1,
            "onComplete":this.openScreenNow,
            "onCompleteParams":[_num,_level]
         });
      }
      
      public function closeBlackScreen() : *
      {
         if(this.blackScreen == null)
         {
            return;
         }
         this.Main.setChildIndex(this.blackScreen,this.Main.numChildren - 1);
         TweenLite.to(this.blackScreen,0.4,{
            "alpha":0,
            "onComplete":this.removeBlackScreen
         });
      }
      
      public function removeBlackScreen() : *
      {
         if(this.blackScreen == null)
         {
            return;
         }
         this.blackScreen.parent.removeChild(this.blackScreen);
         this.blackScreen = null;
      }
      
      public function trackThis(_num:*, _txt:*, _value:int = 0, _value2:int = 0) : *
      {
         if(!this.collection)
         {
            return;
         }
         if(_num == 0)
         {
            this.tracker.trackPageview(_txt);
         }
         else if(_num == 1)
         {
            this.tracker.trackEvent(_txt,"" + this.onMobile,"" + _value);
         }
      }
      
      public function unlockAchievement(_num:*) : *
      {
         if(this.collection)
         {
            this.Main.unlockAchievement("achievement_" + this.gameID + "_" + _num);
            _num += this.gameID * 10;
         }
         if(this.settingArray[11] == 0)
         {
            this.settingArray[11] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
         }
         if(this.settingArray[11][_num] <= 0)
         {
            this.settingArray[11][_num] = 1;
            this.makeTxt("ach",10);
            Sounds.playSound("win",0.2);
            this.saveToDisk();
         }
         this.trackThis(1,"achievement_" + _num);
      }
      
      public function openScreenNow(_name:*, _level:int = 0) : *
      {
         if(_name == "end" && this.collection)
         {
            _name = "tussen";
         }
         if(ApplicationDomain.currentDomain.hasDefinition(_name + "ScreenMC") == false)
         {
            trace(_name + " menu class not found first");
            _name = "main";
         }
         this.settingArray[10] = _level;
         if(ApplicationDomain.currentDomain.hasDefinition(_name + "ScreenMC") == false)
         {
            trace(_name + " menu class not found");
            return;
         }
         if((Boolean(_name == "Samsara" || _name == "manager" || _name == "pause" || _name == "main" || _name == "all")) && Boolean(this.languageClass) && !this.languageClass.ready)
         {
            this.languageClass.fillTranslation();
         }
         if(_name == "end" || _name == "tussen")
         {
            if(this.settingArray[11] == 0)
            {
               this.settingArray[11] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
            }
            this.settingArray[11][this.gameID * 10] = 1;
         }
         if(this.runningScreen)
         {
            Sounds.stopSound();
            this.runningScreen.remove();
            this.Main.removeChild(this.runningScreen);
            this.runningScreen = null;
         }
         this.lastScreen = this.currentScreen;
         this.currentScreen = _name;
         var screen:Class = getDefinitionByName(_name + "Screen") as Class;
         this.runningScreen = new screen(this);
         this.Main.addChild(this.runningScreen);
         this.closeBlackScreen();
         if(Boolean(this.kader && _name != "main" && _name != "pause" && _name != "end" && _name != "all") && Boolean(_name != "tussen") && _name != "resetAll")
         {
            this.Main.setChildIndex(this.kader,this.Main.numChildren - 1);
         }
         if(Boolean(this.hintKnop) && this.settingArray[2] >= 2)
         {
            this.hintKnop.visible = false;
         }
         else if(Boolean(this.hintKnop) && _name == "cubeTest")
         {
            this.Main.setChildIndex(this.hintKnop,this.Main.numChildren - 1);
            this.hintKnop.visible = true;
         }
         else if(Boolean(this.hintKnop) && _name == "theatre")
         {
            this.Main.setChildIndex(this.hintKnop,this.Main.numChildren - 1);
            this.hintKnop.visible = true;
         }
         else if(Boolean(this.hintKnop) && _name == "mill")
         {
            this.Main.setChildIndex(this.hintKnop,this.Main.numChildren - 1);
            this.hintKnop.visible = true;
         }
         else if(Boolean(this.hintKnop) && _name == "birthday")
         {
            this.Main.setChildIndex(this.hintKnop,this.Main.numChildren - 1);
            this.hintKnop.visible = true;
         }
         else if(Boolean(this.hintKnop) && _name == "cave")
         {
            this.Main.setChildIndex(this.hintKnop,this.Main.numChildren - 1);
            this.hintKnop.visible = true;
         }
         else if(Boolean(this.hintKnop) && this.hintKnop.currentFrame >= 2)
         {
            this.hintKnop.gotoAndStop(1);
         }
         else
         {
            this.hintKnop.visible = false;
         }
         if(Boolean(this.pauseKnop) && _name == "rusty")
         {
            this.Main.setChildIndex(this.pauseKnop,0);
         }
         else if(Boolean(this.pauseKnop) && _name == "end")
         {
            this.Main.setChildIndex(this.pauseKnop,0);
         }
         else if(Boolean(this.pauseKnop) && _name == "adult")
         {
            this.Main.setChildIndex(this.pauseKnop,0);
         }
         else
         {
            this.Main.setChildIndex(this.pauseKnop,this.Main.numChildren - 1);
         }
         if(_name == "pause" && Boolean(this.pauseKnop))
         {
            this.pauseKnop.gotoAndStop(2);
         }
         else if(_name == "Samsara")
         {
            this.pauseKnop.gotoAndStop(4);
         }
         else
         {
            this.pauseKnop.gotoAndStop(1);
         }
         if(_name == "main" || _name == "pause" || _name == "end" || _name == "all" || _name == "levelSelect" || _name == "tussen")
         {
            Sounds.playMusic(10);
         }
         else if(_name == "cubeSpace")
         {
            Sounds.playMusic(11);
         }
         this.saveToDisk();
         this.trackThis(1,_name);
      }
      
      public function switchfullScreen() : void
      {
         if(!this.isFullscreen)
         {
            this.Main.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
         }
         else
         {
            this.Main.stage.displayState = StageDisplayState.NORMAL;
         }
      }
      
      public function get isFullscreen() : Boolean
      {
         return this.Main.stage.displayState == StageDisplayState.FULL_SCREEN_INTERACTIVE;
      }
      
      private function update(e:Event) : *
      {
         if(this.runningScreen)
         {
            this.runningScreen.update();
         }
      }
   }
}

