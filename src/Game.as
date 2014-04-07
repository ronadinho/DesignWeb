package  
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import screens.Welcome;
	import events.Navigation;

	
	public class Game extends Sprite 
	{
		private var pantallaInicial:Welcome;
		private var pantallaGamePlay:GamePlay;
		private var pantallaOptions:Options;
		private var pantallaBestiari:Bestiari;
		
		private var enemigo:Enemigos;
		private var enemyMov:Number;

		
		public function Game() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,inicializarGame);
		}
		private function inicializarGame(event:Event):void 
		{
			trace("Inicializando el framework Starling");
			//Añadimos un evento para el cambio de pantalla
			this.addEventListener(Navigation.Change_Screen,ChangeScreen);
			
			//Cargammos y ocultamos la pantalla de gamplay
			pantallaGamePlay = new GamePlay();
			pantallaGamePlay.hideScreen();
			this.addChild(pantallaGamePlay);
			
			//Cargamos y ocultamos la pantalla de Bestiari
			pantallaBestiari = new Bestiari();
			pantallaBestiari.hideScreen();
			this.addChild(pantallaBestiari);
			
			//Cargamos y ocultamos la pantalla de options
			pantallaOptions = new Options();
			pantallaOptions.hideScreen();
			this.addChild(pantallaOptions);
			
			
			//Cargamos y Visualizamos el fondo inicial
			pantallaInicial = new Welcome();
			this.addChild(pantallaInicial);
		}
		
		private function ChangeScreen(e:Navigation):void 
		{
			switch(e.params.id)
			{
				case "play":
					pantallaInicial.hideScreen();
					pantallaGamePlay.init();
					break;
				case "bestiari":
					pantallaInicial.hideScreen();
					pantallaBestiari.init();
					break;
				case "options":
					pantallaInicial.hideScreen();
					pantallaOptions.init();
					break;
			}
			
		}
			
		
		
	}

}