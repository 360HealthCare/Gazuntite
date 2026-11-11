package com.gazuntite.controls.extended.components
{
	import com.gazuntite.controls.extended.skins.comboBoxRegisterationRequiredSkin;
	import com.gazuntite.controls.extended.skins.comboBoxRegisterationSkin;
	import com.gazuntite.controls.extended.components.autoCompleteComboBox.AutoCompleteComboBoxLite;
	
	import mx.collections.ArrayCollection;
	
	import spark.components.ComboBox;
	import spark.events.DropDownEvent;
	
	public class LabelComboBox extends AutoCompleteComboBoxLite
	{
		
		private var _autoWidth:Boolean = true;
		private var _required:Boolean = false;
		
		public function LabelComboBox()
		{
			super();
			
			
			if(required)
			{
				this.setStyle("skinClass", comboBoxRegisterationRequiredSkin);
			}
			else
			{
				this.setStyle("skinClass", comboBoxRegisterationSkin);	
			}
			
			//
			
			addEventListener( DropDownEvent.OPEN, function (event:DropDownEvent ):void
			{
				if(dropDown)
				{
					if( textInput.text.length == 0 )
					{
						if( null != dataProvider && dataProvider is ArrayCollection && null != ArrayCollection( dataProvider ).filterFunction )
						{
							ArrayCollection( dataProvider ).filterFunction = null;
							ArrayCollection( dataProvider ).refresh();
						}
					}
					
					/*if(autoWidth)
					{
					dropDown.width = scroller.horizontalScrollBar.explicitMaxWidth;
					}
					else
					{
					if(dropDown.width < scroller.viewport.contentWidth)
					dropDown.width = scroller.viewport.contentWidth
					}*/
					
					/*	if(dropDown.width < 100)
					{
					//dropDown.width = dropdownOriginalWidth;
					}*/
					
					if(scroller.viewport.contentWidth > scroller.width)
					{
						dropDown.width = scroller.viewport.contentWidth + 20;
						scroller.horizontalScrollBar.visible = false;
						
					}
					else
					{
						dropDown.width = scroller.width;
						scroller.horizontalScrollBar.visible = false;
					}
					
					
					
					
				}
			});
		}
		
		public function get required():Boolean
		{
			return _required;
		}

		public function set required(value:Boolean):void
		{
			_required = value;
			if(value)
			{
				this.setStyle("skinClass", comboBoxRegisterationRequiredSkin);
			}
			else
			{
				this.setStyle("skinClass", comboBoxRegisterationSkin);	
			}
		}

		public function get autoWidth():Boolean
		{
			return _autoWidth;
		}
		
		public function set autoWidth(value:Boolean):void
		{
			_autoWidth = value;
		}

		
		override protected function partRemoved(partName:String, instance:Object):void
		{
			try
			{
				super.partRemoved( partName, instance );
			}
			catch(e:Error)
			{
				trace(this.name, e.errorID, e.name, e.message );
			}
			//super.super.partRemoved(partName, instance:Object)
		}
	}
		
}