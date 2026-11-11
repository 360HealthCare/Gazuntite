package qs.ipeControls
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	import qs.ipeControls.classes.IPEBase;
	
	import spark.components.DropDownList;
	import spark.components.Label;
	import spark.events.IndexChangeEvent;
	
	[Event(name="change", type="flash.events.Event")]
	[Event(name="enter", type="mx.events.FlexEvent")]
	public class IPELabelCombobox extends IPEBase
	{
		[Bindable]
		private var _dataProvider:ArrayCollection = new ArrayCollection([]);
		
		private var _labelField:String;
		
		private var _requireSelection:Boolean = false;
		
		private var selectedItem:String;
		
		public function IPELabelCombobox()
		{
			super();
			nonEditableControl = new Label();
			editableControl = new DropDownList();
			
			facadeEvents(editableControl,"change","enter","valueCommit");
		}
		
		[Bindable]
		public function get requireSelection():Boolean
		{
			return _requireSelection;
		}

		public function set requireSelection(value:Boolean):void
		{
			_requireSelection = value;
			DropDownList(editableControl).requireSelection = value;
		}

		[Bindable]
		public function get labelField():String
		{
			return _labelField;
		}

		public function set labelField(value:String):void
		{
			_labelField = value;
			DropDownList(editableControl).labelField = value;
		}

		public function get dataProvider():ArrayCollection
		{
			return _dataProvider;
		}

		public function set dataProvider(value:ArrayCollection):void
		{
			_dataProvider = value;
			DropDownList(editableControl).dataProvider = _dataProvider;
		}
		
		override protected function commitEditedValue():void
		{
			if(DropDownList(editableControl).selectedItem == null)
			{
				return;
			}
			
			Label(nonEditableControl).text = DropDownList(editableControl).selectedItem[labelField.toString()];
		}
		
		
		private function get dropDownList():DropDownList {return DropDownList(editableControl);}
		private function get label():Label {return Label(nonEditableControl);}
		
		public function set text(value:String):void
		{
			Label(nonEditableControl).text = value;
		}	
		
		public function get text():String { return DropDownList(editableControl).selectedItem; }
		
		
		
		
	}
}