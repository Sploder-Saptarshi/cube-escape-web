package
{
   import com.greensock.*;
   import com.greensock.easing.*;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.system.Capabilities;
   import flash.text.AntiAliasType;
   import flash.text.TextFormat;
   
   public class LanguageClass extends MovieClip
   {
      
      private var main:*;
      
      private var myFont:*;
      
      private var myFormat:TextFormat;
      
      private var myXML:XML = null;
      
      private var myFont0:*;
      
      private var myFont2:*;
      
      private var myFont5:*;
      
      private var myFont10:*;
      
      private var myFont12:*;
      
      private var xmlName:* = "";
      
      public var ready:Boolean = false;
      
      private var wordArray:*;
      
      public function LanguageClass(_main:*)
      {
         var changeLanguage:Function;
         var myLoader:URLLoader;
         var path:*;
         this.myFormat = new TextFormat();
         this.myFont0 = new Lettertype0();
         this.myFont2 = new Lettertype2();
         this.myFont5 = new Lettertype5();
         this.myFont10 = new Lettertype10();
         this.myFont12 = new Lettertype12();
         this.wordArray = [];
         super();
         changeLanguage = function(_num:*):*
         {
            if(main.settingArray[4] >= 1)
            {
               return;
            }
            main.languageNum = _num;
            main.settingArray[0] = _num;
         };
         this.main = _main;
         this.xmlName = "assets/cube_escape_translations.xml";
         if(this.main.korean)
         {
            changeLanguage(10);
         }
         else if(Boolean(Capabilities.language) && Capabilities.language == "es")
         {
            changeLanguage(1);
         }
         else if(Boolean(Capabilities.language) && Capabilities.language == "zh-CN")
         {
            changeLanguage(2);
         }
         else if(Boolean(Capabilities.language) && Capabilities.language == "zh-TW")
         {
            changeLanguage(18);
         }
         else if(Boolean(Capabilities.language) && Capabilities.language == "fr")
         {
            changeLanguage(3);
         }
         else if(Boolean(Capabilities.language) && Capabilities.language == "nl")
         {
            changeLanguage(4);
         }
         else if(Boolean(Capabilities.language) && Capabilities.language == "ru")
         {
            changeLanguage(5);
         }
         else if(Boolean(Capabilities.language) && Capabilities.language == "pl")
         {
            changeLanguage(6);
         }
         else if(Boolean(Capabilities.language) && Capabilities.language == "de")
         {
            changeLanguage(7);
         }
         else if(Boolean(Capabilities.language) && Capabilities.language == "pt")
         {
            changeLanguage(8);
         }
         else if(Boolean(Capabilities.language) && Capabilities.language == "it")
         {
            changeLanguage(9);
         }
         else if(Boolean(Capabilities.language) && Capabilities.language == "ko")
         {
            changeLanguage(10);
         }
         else if(Boolean(Capabilities.language) && Capabilities.language == "ja")
         {
            changeLanguage(12);
         }
         else if(Boolean(Capabilities.language) && Capabilities.language == "tr")
         {
            changeLanguage(13);
         }
         else if(Boolean(Capabilities.language) && Capabilities.language == "vi")
         {
            changeLanguage(17);
         }
         else if(this.main.chinese)
         {
            changeLanguage(2);
         }
         myLoader = new URLLoader();
         path = new URLRequest(this.xmlName);
         myLoader.load(path);
         myLoader.addEventListener(IOErrorEvent.IO_ERROR,this.ioErrorHandler);
         myLoader.addEventListener(Event.COMPLETE,this.processXML);
      }
      
      public function fillTranslation() : *
      {
         if(this.myXML == null)
         {
            this.checkLocal();
            return;
         }
         for(var y:* = 0; y < 1000; y++)
         {
            if(this.myXML.TRANSLATION[y])
            {
               this.wordArray[y] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
               if(this.myXML.TRANSLATION[y].@name)
               {
                  this.wordArray[y][0] = this.myXML.TRANSLATION[y].@name;
               }
               if(this.myXML.TRANSLATION[y].Spanish.length() > 0)
               {
                  this.wordArray[y][1] = this.myXML.TRANSLATION[y].Spanish;
               }
               if(this.myXML.TRANSLATION[y].SimChinese.length() > 0)
               {
                  this.wordArray[y][2] = this.myXML.TRANSLATION[y].SimChinese;
               }
               if(this.myXML.TRANSLATION[y].French.length() > 0)
               {
                  this.wordArray[y][3] = this.myXML.TRANSLATION[y].French;
               }
               if(this.myXML.TRANSLATION[y].Dutch.length() > 0)
               {
                  this.wordArray[y][4] = this.myXML.TRANSLATION[y].Dutch;
               }
               if(this.myXML.TRANSLATION[y].Russian.length() > 0)
               {
                  this.wordArray[y][5] = this.myXML.TRANSLATION[y].Russian;
               }
               if(this.myXML.TRANSLATION[y].Polish.length() > 0)
               {
                  this.wordArray[y][6] = this.myXML.TRANSLATION[y].Polish;
               }
               if(this.myXML.TRANSLATION[y].German.length() > 0)
               {
                  this.wordArray[y][7] = this.myXML.TRANSLATION[y].German;
               }
               if(this.myXML.TRANSLATION[y].Portuguese.length() > 0)
               {
                  this.wordArray[y][8] = this.myXML.TRANSLATION[y].Portuguese;
               }
               if(this.myXML.TRANSLATION[y].Italian.length() > 0)
               {
                  this.wordArray[y][9] = this.myXML.TRANSLATION[y].Italian;
               }
               if(this.myXML.TRANSLATION[y].Korean.length() > 0)
               {
                  this.wordArray[y][10] = this.myXML.TRANSLATION[y].Korean;
               }
               if(this.myXML.TRANSLATION[y].Danish.length() > 0)
               {
                  this.wordArray[y][11] = this.myXML.TRANSLATION[y].Danish;
               }
               if(this.myXML.TRANSLATION[y].Japanese.length() > 0)
               {
                  this.wordArray[y][12] = this.myXML.TRANSLATION[y].Japanese;
               }
               if(this.myXML.TRANSLATION[y].Turkish.length() > 0)
               {
                  this.wordArray[y][13] = this.myXML.TRANSLATION[y].Turkish;
               }
               if(this.myXML.TRANSLATION[y].Czech.length() > 0)
               {
                  this.wordArray[y][14] = this.myXML.TRANSLATION[y].Czech;
               }
               if(this.myXML.TRANSLATION[y].Swedish.length() > 0)
               {
                  this.wordArray[y][15] = this.myXML.TRANSLATION[y].Swedish;
               }
               if(this.myXML.TRANSLATION[y].Hindi.length() > 0)
               {
                  this.wordArray[y][16] = this.myXML.TRANSLATION[y].Hindi;
               }
               if(this.myXML.TRANSLATION[y].Vietnamese.length() > 0)
               {
                  this.wordArray[y][17] = this.myXML.TRANSLATION[y].Vietnamese;
               }
               if(this.myXML.TRANSLATION[y].TradChinese.length() > 0)
               {
                  this.wordArray[y][18] = this.myXML.TRANSLATION[y].TradChinese;
               }
               if(this.myXML.TRANSLATION[y].Hungarian.length() > 0)
               {
                  this.wordArray[y][19] = this.myXML.TRANSLATION[y].Hungarian;
               }
            }
            else
            {
               y = 1000;
            }
         }
         this.ready = true;
      }
      
      private function ioErrorHandler(event:IOErrorEvent) : void
      {
         trace("no connection to language");
         this.checkLocal();
      }
      
      private function checkLocal() : *
      {
         var myLoader:URLLoader = new URLLoader();
         var path2:* = new URLRequest(this.xmlName);
         myLoader.load(path2);
         myLoader.addEventListener(IOErrorEvent.IO_ERROR,this.ioErrorOffline);
         myLoader.addEventListener(Event.COMPLETE,this.processXML);
      }
      
      private function ioErrorOffline(event:IOErrorEvent) : void
      {
         trace("no connection to language offline");
      }
      
      private function processXML(e:Event) : void
      {
         this.myXML = new XML(e.target.data);
         trace("xml loaded");
      }
      
      public function checkForLanguage(_num:*) : *
      {
         if(Boolean(this.wordArray[0]) && this.wordArray[0][_num] != 0)
         {
            return true;
         }
         return false;
      }
      
      public function checkWord(_word:String = "null") : *
      {
         for(var y:* = 0; y < this.wordArray.length; y++)
         {
            if(_word == this.wordArray[y][0] && Boolean(this.wordArray[y][this.main.languageNum]))
            {
               return this.wordArray[y][this.main.languageNum];
            }
         }
         return null;
      }
      
      public function changeFont(_txtField:*, _num:int = -1, _speciaal:String = null, _sizeNum:int = 19) : *
      {
         var fontLower:Function = function(_txtField:*, _afstand:*):*
         {
            if(_txtField.y == 2.5)
            {
               _txtField.y += _afstand;
            }
         };
         if(_num == 2 || _num == 18)
         {
            this.myFont = this.myFont2;
            _sizeNum--;
            fontLower(_txtField,3);
         }
         else if(_num == 5)
         {
            this.myFont = this.myFont5;
            fontLower(_txtField,3);
         }
         else if(_num == 10)
         {
            this.myFont = this.myFont10;
            fontLower(_txtField,3);
         }
         else if(_num == 12)
         {
            this.myFont = this.myFont12;
            fontLower(_txtField,3);
         }
         else if(_num >= 0)
         {
            this.myFont = this.myFont0;
         }
         this.myFormat.font = this.myFont.fontName;
         _txtField.selectable = false;
         this.myFormat.size = _sizeNum;
         this.myFormat.font = this.myFont.fontName;
         _txtField.setTextFormat(this.myFormat);
         _txtField.embedFonts = true;
         _txtField.antiAliasType = AntiAliasType.ADVANCED;
         if(_speciaal == "button")
         {
            _txtField.x = -_txtField.textWidth * 0.5 - 4;
         }
      }
   }
}

