package
{
   import flash.display.Stage;
   import flash.text.TextField;
   
   public class SteamHandler
   {
      
      public static var steamWorks:* = null;
      
      private static var tf:TextField;
      
      public static var achievementStats:Object = new Object();
      
      private static var debugText:Boolean = true;
      
      public function SteamHandler()
      {
         super();
      }
      
      public static function init(stage:Stage = null) : void
      {
         steamWorks = null;
      }
      
      public static function clearAchievements() : void
      {
      }
      
      public static function log(string:String) : void
      {
      }
      
      public static function initStats() : void
      {
      }
      
      public static function onSteamResponse(e:*) : void
      {
      }
      
      public static function unlockAchievement(achievementName:String) : void
      {
      }
      
      public static function storeStats() : void
      {
      }
      
      public static function getVar(name:String) : int
      {
         return 0;
      }
      
      public static function setVar(name:String, val:int = 1) : void
      {
      }
      
      public static function addVar(name:String, val:int = 1) : void
      {
      }
   }
}
