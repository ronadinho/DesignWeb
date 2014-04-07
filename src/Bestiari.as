package  
{
	import flash.events.Event;
	import starling.display.Image;
	import starling.display.Sprite;

	public class Bestiari extends Sprite 
	{
		private var fondoBestiari:Image;
		
		public function Bestiari() 
		{
			super();
			this.removeEventListener(Event.ADDED_TO_STAGE,initBestiari);
		}
		
		private function initBestiari(e:Event):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, initBestiari);
		}
		public function hideScreen():void
		{
			this.visible = false;
		}
		public function init():void
		{
			this.visible = true;
			fondoBestiari = new Image(Assets.getAtlas().getTexture("cesped3"));
			this.addChild(fondoBestiari);
		}
		
	}

}