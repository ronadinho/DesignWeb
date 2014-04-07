package  
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import flash.utils.getTimer;
	
	public class GamePlay extends Sprite 
	{
		private var muralla:Image;
		private var terreno:Image;
		private var sky:Image;
		private var enemigo:Enemigos;
		
		private var timePrevious:Number;
		private var timeCurrent:Number;
		private var elapsed:Number
		
		private var velocidad_movimiento:Number = 0.5;
		
		
		public function GamePlay() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,initGamePlay);
		}
		
		private function initGamePlay(e:Event):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, initGamePlay);
		}
		public function hideScreen():void
		{
			this.visible = false;
		}
		public function init():void
		{
			this.visible = true;
			
			//Añadimos el cielo a la pantalla de juego
			sky = new Image(Assets.getAtlas().getTexture("cielo1"));
			sky.scaleX = 2;
			this.addChild(sky);
			
			//Añadimos el terreno
			terreno = new Image(Assets.getAtlas().getTexture("cesped1"));
			this.addChild(terreno);
			terreno.y = 255;
			terreno.scaleX = 2;
			
			//Añadimos el la muralla
			muralla = new Image(Assets.getAtlas().getTexture("Muralla"));
			muralla.y = 150;
			muralla.scaleY = 0.75;
			this.addChild(muralla);
			
			//Creamos el enemigo
			enemigo = new Enemigos();
			enemigo.x = 710;
			enemigo.y = 200;
			enemigo.scaleX = 1.5;
			enemigo.scaleY = 1.5;
			this.addChild(enemigo);
			//Movemos de forma automatica a los enemigos
			this.addEventListener(Event.ENTER_FRAME,checkElapsed);
			enemigo.addEventListener(Event.ENTER_FRAME,mover);
			
		}
		private function mover(e:Event):void 
		{
			this.removeEventListener(Event.ENTER_FRAME, mover);
			enemigo.x -= velocidad_movimiento;
			trace("Tiempo pasado : " + elapsed);
			trace("Tiempo previo : " + timePrevious);
			trace("Tiempo actual : " +timeCurrent);
		}
		private function checkElapsed(event:Event):void 
		{
			timePrevious=timeCurrent;
			timeCurrent = getTimer();
			elapsed=(timeCurrent-timePrevious)*1;
		}
		
		
	}

}