package events 
{
	import starling.events.Event;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Navigation extends Event 
	{	
		public static const Change_Screen:String="Change_Screen";
		public var params:Object;
		
		public function Navigation(type:String, bubbles:Boolean=false,_params:Object=null) 
		{
			super(type, bubbles, data);
			this.params = _params;
		}
	}

}