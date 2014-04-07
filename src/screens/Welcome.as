package screens 
{
	import events.Navigation;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	//import com.greensock.TweenLite;
	
	public class Welcome extends Sprite 
	{
		private var fondoInicio:Image;
		
		private var botonStart:Button;
		private var buttonBestiari:Button;
		private var buttonOptions:Button;
		
		public function Welcome() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, inicializarWelcome);
		}
		private function inicializarWelcome():void 
		{
			trace("Pantalla de bienvenida inicializada!!");
			dibujarPantalla();
		}
		private function dibujarPantalla():void 
		{
			//Dibujamos el boton en la pantalla Inicial
			fondoInicio = new Image(Assets.getAtlas().getTexture("iniciofinalefectofinal"));
			this.addChild(fondoInicio);
			
			//Dibujamos y pintamos el boton de start en la pantalla Inicial
			botonStart = new Button(Assets.getAtlas().getTexture("welcome_playButton"));
			botonStart.x = 525;
			botonStart.y = 150;
			this.addChild(botonStart);
			
			//Dibujamos y pintamos el boton de bestiari en la pantalla Inicial
			buttonBestiari = new Button(Assets.getAtlas().getTexture("bestiary"));
			buttonBestiari.x = 525;
			buttonBestiari.y = 300;
			this.addChild(buttonBestiari);
			
			//Dibujamos y pintamos el boton de options en la pantalla Inicial
			buttonOptions = new Button(Assets.getAtlas().getTexture("options"));
			buttonOptions.x = 525;
			buttonOptions.y = 450;
			this.addChild(buttonOptions);
			
			//Añadimos la funcionalidad del botón start para cambiar de pantalla
			this.addEventListener(Event.TRIGGERED, clickSButton);
			
		}
		public function hideScreen():void
		{
			this.visible = false;
		}
		private function clickSButton(e:Event):void 
		{
			var botonClickado:Button = e.target as Button;
			
			switch(botonClickado)
			{
				case botonStart: 
					this.dispatchEvent(new Navigation(Navigation.Change_Screen,true,{id:"play"}));
					break;
				case buttonBestiari:
					this.dispatchEvent(new Navigation(Navigation.Change_Screen,true,{id:"bestiari"}));
					break;
				case buttonOptions:
					this.dispatchEvent(new Navigation(Navigation.Change_Screen,true,{id:"options"}));
					break;
			}
		}
	}

}