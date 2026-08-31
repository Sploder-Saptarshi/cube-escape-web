package
{
   import flash.net.SharedObject;
   
   public class SaveGameClass
   {
      
      public function SaveGameClass()
      {
         super();
      }
      
      public static function getOS() : String
      {
         return "WEB";
      }
      
      public static function getBaseFile(os:String) : Object
      {
         return null;
      }
      
      public static function saveToFile(basePath:Object, path:String, data:Object) : void
      {
         try
         {
            var so:SharedObject = SharedObject.getLocal("CubeEscapeCollection");
            so.data.savedData = data;
            so.flush();
         }
         catch(e:Error)
         {
         }
      }
      
      public static function loadFromFile(basePath:Object, path:String) : *
      {
         try
         {
            var so:SharedObject = SharedObject.getLocal("CubeEscapeCollection");
            return so.data.savedData;
         }
         catch(e:Error)
         {
         }
         return null;
      }
   }
}
