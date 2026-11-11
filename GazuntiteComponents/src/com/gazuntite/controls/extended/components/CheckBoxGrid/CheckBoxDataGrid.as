package com.gazuntite.controls.extended.components.CheckBoxGrid
{
	import com.gazuntite.controls.extended.components.LabelDataGrid;
	
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.controls.CheckBox;
	import mx.controls.listClasses.IListItemRenderer;
	
	/** 
	 *  DataGrid that uses checkboxes for multiple selection
	 */
	public class CheckBoxDataGrid extends LabelDataGrid
	{
		
		override protected function selectItem(item:IListItemRenderer,
											   shiftKey:Boolean, ctrlKey:Boolean,
											   transition:Boolean = true):Boolean
		{
			// only run selection code if a checkbox was hit and always
			// pretend we're using ctrl selection
			if (item is CheckBox)
			{
				return super.selectItem(item, shiftKey, true, transition);
			}
			return false;
		}
		
		override protected function mouseDownHandler(event:MouseEvent):void
		{
			event.ctrlKey = true;
			if( event.target is CheckBoxRenderer )
			{
				
				if( (event.target as CheckBoxRenderer).selected == true )
				{
					var sel:ArrayCollection = new ArrayCollection( selectedItems );
					var idx:int = sel.getItemIndex( (event.target as CheckBox).data );
					sel.removeItemAt( idx );
					selectedItems = sel.source;
					return;
				}
			}
			//event.shiftKey = false;
			super.mouseDownHandler(event);
		}
		
		//turn off selection indicator
		/*override protected function drawSelectionIndicator(
			indicator:Sprite, x:Number, y:Number,
			width:Number, height:Number, color:uint,
			itemRenderer:IListItemRenderer):void
		{
		}*/
		
		// whenever we draw the renderer, make sure we re-eval the checked state
		override protected function drawItem(item:IListItemRenderer,
											 selected:Boolean = false,
											 highlighted:Boolean = false,
											 caret:Boolean = false,
											 transition:Boolean = false):void
		{
			if (item is CheckBox)
			{
				(item as CheckBox).invalidateProperties();
				(item as CheckBox).selected = selected;
			}
			super.drawItem(item, selected, highlighted, caret, transition);
		}
		
		// fake all keyboard interaction as if it had the ctrl key down
		override protected function keyDownHandler(event:KeyboardEvent):void
		{
			// this is technically illegal, but works
			event.ctrlKey = true;
			//event.shiftKey = false;
			super.keyDownHandler(event);
		}
		
	}
	
}