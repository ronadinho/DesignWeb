package  
{
	import starling.events.Event;
	import starling.display.Image;
	import starling.display.Sprite;

	public class Options extends Sprite 
	{
		private var fondoOptions:Image;
		
		public function Options() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,initOptions);
		}
		
		private function initOptions(e:Event):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,initOptions);
		}
		public function hideScreen():void
		{
			this.visible = false;
		}
		public function init():void
		{
			this.visible = true;
			fondoOptions = new Image(Assets.getAtlas().getTexture("cesped2"));
			this.addChild(fondoOptions);
		}
	}

}