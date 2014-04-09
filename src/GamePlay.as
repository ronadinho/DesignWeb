package  
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchPhase;
	import starling.events.TouchEvent;
	import flash.utils.getTimer;
	
	public class GamePlay extends Sprite 
	{
		private var muralla:Image;
		private var terreno:Image;
		private var sky:Image;
		private var flecha:Image;
		private var enemigo:Enemigos;
		
		private var touch:Touch;
		private var touchX:Number;
		private var touchY:Number;
		
		private var timePrevious:Number;
		private var timeCurrent:Number;
		private var elapsed:Number
		
		private var velocidad_movimiento:Number = 1.0;
		
		//Array de enemigos
		private var enemigosAnimados:Vector.<Enemigos>;
		
		
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
			
			//Añadimos la flecha
			//flecha = new Image(Assets.getAtlas().getTexture("flecha"));
			//flecha.y = 150;
			//flecha.scaleX = 0.25;
			//this.addChild(flecha);
			
			enemigosAnimados = new Vector.<Enemigos>();
			//this.addEventListener(Event.ENTER_FRAME,checkElapsed);95-x//255-y
			addEventListener(TouchEvent.TOUCH,onTouch);
			generarEnemigos();
		}
		private function onTouch(event:TouchEvent):void 
		{
			touch = event.getTouch(stage);
			//Comprobamos que se pulsa dentro de la pantalla
			if (touch!=null) {
				//Capturamos el evento cuando se deja de pulsar
				if (touch.phase == "ended") {
					touchX = touch.globalX;
					touchY = touch.globalY;
					trace("Has pulsado en x: " + touchX + " y en y : " + touchY);
					//flecha.x = touchX;
					//flecha.y = touchY;
				}
			}
			
		}
		private function mover(e:Event):void 
		{
			//this.removeEventListener(Event.ENTER_FRAME, mover);
			for (var i:int = 0; i < enemigosAnimados.length; i++) {
				enemigosAnimados[i].x -= velocidad_movimiento;
			}
		}
		//private function checkElapsed(event:Event):void 
		//{
			//timePrevious=timeCurrent;
			//timeCurrent = getTimer();
			//elapsed=(timeCurrent-timePrevious)*1;
		//}
		private function generarEnemigos():void
		{	
			for (var i:int = 0; i < 10; i++) {
				enemigo = new Enemigos();
				if (i % 2 != 0) {
					enemigo.x = 710;
					}
				else {
					enemigo.x = 780;
				}
				enemigo.scaleX = 1.5;
				enemigo.scaleY = 1.5;
				enemigo.y = i * 30 + 200;
				this.addChild(enemigo);
				enemigosAnimados.push(enemigo);
			}
			addEventListener(Event.ENTER_FRAME, mover);
		}
	}

}