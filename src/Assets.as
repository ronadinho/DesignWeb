package  
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	public class Assets 
	{	
		private static var gameTextures:Dictionary = new Dictionary();
		private static var juegoTexturas:TextureAtlas;
		
		[Embed(source = "../media/images/dibujos.png")]
		public static const AtlasTexturas:Class;
		
		[Embed(source = "../media/images/dibujos.xml",mimeType="application/octet-stream")]
		public static const AtlasXml:Class;
		
		
		public static function getAtlas():TextureAtlas
		{
			if (juegoTexturas == null)
			{
				var textura:Texture = getTexture("AtlasTexturas");
				var xml:XML = XML(new AtlasXml());
				juegoTexturas = new TextureAtlas(textura,xml);
			}
			return juegoTexturas;
		}
		public static function getTexture(name:String):Texture
		{
			if (gameTextures[name] == undefined)
			{
				var bitmap:Bitmap = new Assets[name]();
				gameTextures[name] = Texture.fromBitmap(bitmap);
			}
			return gameTextures[name];
		}
		
	}

}