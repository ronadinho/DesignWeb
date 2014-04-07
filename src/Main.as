package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import net.hires.debug.Stats;
	import starling.core.Starling;
	
	[SWF(frameRate="60",width="800",height="600",backgroundcolor="0x333333")]
	public class Main extends Sprite 
	{
		private var stats:Stats;
		private var my_starling:Starling;
		
		public function Main():void 
		{
			stats = new Stats();
			this.addChild(stats);
			
			my_starling = new Starling(Game,stage);
			my_starling.antiAliasing=-1;
			my_starling.start();
		}		
		
	}
	
}