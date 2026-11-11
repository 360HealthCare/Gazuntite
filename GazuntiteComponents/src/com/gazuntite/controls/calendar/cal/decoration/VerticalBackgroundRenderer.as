package com.gazuntite.controls.calendar.cal.decoration
{
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.geom.Matrix;
	
	public class VerticalBackgroundRenderer
	{
		public static const ALPHA:Number = 0.4;
		private static const H:Number = 255 / 24;
		public static const colors:Array = [0xFFFFFF, 0xFFFFFF, 0xFFFFFF,  0xeeeeee, 0xeeeeee, 0xdddddd, 0xddddddd, 0xdddddd, 0xdddddd];
		
		public static function alphas(alpha:Number):Array 
		{
			return [   alpha,    alpha,    alpha,     alpha,    alpha,    alpha,    alpha,    alpha,    alpha];
		}
		
		public static const positn:Array = [ 0, 5*H, 6*H, 7*H, 12*H, 18*H, 19*H, 20*H, 24*H ];
		
		public var myColors:Array = colors;
		
		public function drawRuler(g:Graphics, yOffset:Number, dayHeight:Number, width:Number, height:Number):void 
		{
			var matrix:Matrix = new Matrix();
			matrix.createGradientBox(width, dayHeight, Math.PI / 2, 0, -yOffset);
			g.beginGradientFill(GradientType.LINEAR, myColors, alphas(ALPHA), positn, matrix );
			g.drawRect(0, 0, width, height);
			g.endFill();

			var skip30MinLine:Boolean = dayHeight/24/2 <= 10;
						
			for (var hour:int = 0; hour < 24; hour++) 
			{
				var y:int = hour * dayHeight / 24 - yOffset; 
				if (0 < y && y < height) 
				{
					g.lineStyle(1, 0, .5);
					g.moveTo(0, y);
					g.lineTo(width, y);
				}
			
				y = y + dayHeight/24 / 2;
				if (0 < y && y < height && !skip30MinLine) 
				{
					g.lineStyle(1, 0, .25);
					g.moveTo(0, y);
					g.lineTo(width, y);
				}
			}
		}
	}
}