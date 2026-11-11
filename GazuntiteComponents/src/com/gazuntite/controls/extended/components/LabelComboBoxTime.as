package com.gazuntite.controls.extended.components
{
	import com.gazuntite.controls.extended.skins.comboBoxRegisterationRequiredSkin;
	import com.gazuntite.controls.extended.skins.comboBoxRegisterationSkin;
	
	import mx.collections.ArrayCollection;
	
	import spark.components.ComboBox;
	import spark.events.DropDownEvent;
	
	public class LabelComboBoxTime extends ComboBox
	{
		
		private var _autoWidth:Boolean = true;
		private var _required:Boolean = false;
		
		private var _defaultValue:String = "";
		
		public function LabelComboBoxTime()
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
			
			var timeArrayCol:ArrayCollection = new ArrayCollection();
			
			var starttime:int = 9;
			var endtime:int = 32;
			var k:int;
			
			for(var i:int=starttime; i<=endtime; i++)
			{
				k = i;
				
				var hours:String;
				var ampm:String;
				
				if(i >= 24)
				{
					k = i - 24;
				}
				
				
				
				if(k >= 12)
				{
					hours = (k-12).toString();
					
					if(k == 12)
					{
						hours = "12";
					}
					ampm = "PM";
				}
				else
				{
					hours = k.toString();
					ampm = "AM";
				}
				
				if(hours.length == 1)
				{
					hours = "0"+hours;
				}
				
				
					var obj:Object = new Object();
					obj.time = hours + ":00 "+ampm;
					obj.counter = i;
					timeArrayCol.addItem(obj);
					var obj:Object = new Object();
					obj.time = hours + ":30 "+ampm;
					obj.counter = i;
					timeArrayCol.addItem(obj);
				
				
			}					
			this.labelField="time"
			this.dataProvider = timeArrayCol;
			this.selectedIndex = 0;
			
			
			
			
			//
			
			addEventListener( DropDownEvent.OPEN, function (event:DropDownEvent ):void
			{
				if(dropDown)
				{
					if( textInput.text.length == 0 )
					{
						if( null != dataProvider )
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
		[Bindable]
		public function get defaultValue():String
		{
			return _defaultValue;
		}

		public function set defaultValue(value:String):void
		{
			_defaultValue = value;
			if(defaultValue != "")
			{
				for(var i:int=0; i<this.dataProvider.length; i++)
				{
					//trace( " >> " + this.dataProvider.getItemAt(i).time);
					if(defaultValue == this.dataProvider.getItemAt(i).time)
					{
						this.selectedIndex = i;			
					}
				}
			}
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