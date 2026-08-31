package
{
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   
   public class allCubes extends MovieClip
   {
      
      private var onMobile:int = 0;
      
      private var chinese:Boolean = false;
      
      private var base:BaseClass = null;
      
      private var testingMode:Boolean = false;
      
      public var itch:Boolean = false;
      
      public var gog:Boolean = false;
      
      public function allCubes()
      {
         var loadAsset:Function;
         super();
         loadAsset = function(_name:*):*
         {
            var loaderContext:LoaderContext;
            var _loader:Loader = null;
            var loaderCompleteHandler:Function = null;
            loaderCompleteHandler = function(event:Event):void
            {
               _loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,loaderCompleteHandler);
            };
            _loader = new Loader();
            _loader.contentLoaderInfo.addEventListener(Event.COMPLETE,loaderCompleteHandler);
            loaderContext = new LoaderContext(false,ApplicationDomain.currentDomain);
            _loader.load(new URLRequest(_name),loaderContext);
         };
         loadAsset("assets/sounds.swf");
         this.base = new BaseClass(this,"All",this.onMobile);
         this.base.testingMode = this.testingMode;
         this.base.itch = this.itch;
         this.base.gog = this.gog;
         this.loadChinese();
         this.base.startGame();
      }
      
      public function unlockAchievement(_name:*) : *
      {
      }
      
      private function loadChinese() : *
      {
         if(!this.chinese)
         {
            return;
         }
         this.base.collection = true;
         this.base.chinese = true;
      }
      
      public function loadHint() : *
      {
      }
      
      public function startPurchase() : *
      {
      }
      
      public function restorePurchase() : *
      {
      }
   }
}
