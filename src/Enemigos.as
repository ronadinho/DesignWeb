package  
{
	import starling.animation.Juggler;
	import starling.animation.Tween;
	import starling.animation.Transitions;
	import starling.core.Starling;
	import starling.events.Event;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import com.greensock.TweenLite;
	
	
	public class Enemigos extends Sprite 
	{
		private var enemigo:MovieClip;
		private var pos_x:Number = 1;
		
		public function Enemigos() 
		{
			super();
			this.addEventListener(Event.ENTER_FRAME,anyadirEnemigo);
		}
		
		private function anyadirEnemigo(e:Event):void 
		{
			removeEventListener(Event.ENTER_FRAME, anyadirEnemigo);
			crearEnemigo();
		}
		
		private function crearEnemigo():void 
		{
			enemigo = new MovieClip(Assets.getAtlas().getTextures("maloarmaduracaminando"), 48);
			Starling.juggler.add(enemigo);
			this.addChild(enemigo);
			//enemigo.addEventListener(Event.ENTER_FRAME,mover);
		}
		
		//private function mover(e:Event):void 
		//{
			//removeEventListener(Event.ENTER_FRAME, mover);
			//enemigo.x -= 0.5;
		//}
		
	}

}