package com.gazuntite.controls.extended.components
{
	import com.gazuntite.controls.skins.resize.ResizeHandleDots;
	import com.gazuntite.controls.skins.resize.ResizeManager;
	
	import mx.core.UIComponent;
	
	import spark.components.Group;
	
	public class ResizeableGroup extends Group
	{
		private var resizeManager:ResizeManager;
		
		private var _resizeHandle:UIComponent;
		
		private var createdChildren:Boolean;
		
		
		public function ResizeableGroup()
		{
			super();
			
			mouseChildren = true; // required for the resizeHandle to accept mouse events
			minWidth = 13;
			minHeight = 13;
			resizeManager = new ResizeManager(this, null);
			
		}
		
		public function get resizeDirection():String 
		{
			return resizeManager.resizeDirection;
		}
		
		public function set resizeDirection(value:String):void 
		{
			resizeManager.resizeDirection = value;
			//this.setStyle( "resizeDirection", value);
		}
			
		[Bindable]
		public function get resizeHandle():UIComponent 
		{
			return _resizeHandle;
		}
		
		public function set resizeHandle(value:UIComponent):void 
		{
			if (_resizeHandle) {
				removeChild(_resizeHandle);
			}
			_resizeHandle = value;
			if (createdChildren && _resizeHandle) {
				addElement(_resizeHandle);
				resizeManager.resizeHandle = _resizeHandle;
			}
		}
		
		override protected function createChildren():void 
		{
			super.createChildren();
			createdChildren = true;
			if (!resizeHandle) {
				resizeHandle = createResizeHandle();
			} else {
				addElement(resizeHandle);
				resizeManager.resizeHandle = _resizeHandle;
			}
		}
		
		protected function createResizeHandle():UIComponent 
		{
			var handle:ResizeHandleDots = new ResizeHandleDots();//ResizeHandleLines();
			return handle;
		}
		
		override protected function updateDisplayList(w:Number, h:Number):void 
		{
			super.updateDisplayList(w, h);
			
			if (resizeHandle) 
			{
				resizeHandle.x = 0; //w/2 ; //- resizeHandle.width/2;
				resizeHandle.y = h - resizeHandle.height - 10;
				//resizeHandle.width = 55;
			}
		}
	}
}