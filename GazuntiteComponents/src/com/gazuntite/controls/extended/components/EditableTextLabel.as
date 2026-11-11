package com.gazuntite.controls.extended.components
{
	import flash.events.MouseEvent;
	
	import spark.components.RichEditableText;
	
	public class EditableTextLabel extends RichEditableText
	{
		public function EditableTextLabel()
		{
			//TODO: implement function
			super();
			this.doubleClickEnabled = true;
			this.editable = false;
			this.addEventListener(MouseEvent.DOUBLE_CLICK, function(event:MouseEvent):void
			{
				this.editable = ! this.editable;
			});
		}
		
		public override function set text(value:String):void
		{
			trace("super.text", super.text, 'length',super.text.length )
			if( value == "" || value.length == 0 )
				value =  '-';
			
			super.text = value;
		}
		
			
		
	}
}