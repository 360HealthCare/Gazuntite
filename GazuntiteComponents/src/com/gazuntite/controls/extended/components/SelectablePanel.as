package com.gazuntite.controls.extended.components
{
	import spark.components.Panel;
	
	public class SelectablePanel extends Panel
	{
		
		private var _focused:Boolean 			= false;
		
		private var m_bAllowContents:Boolean 	= false;
		private var m_bIsSelected:Boolean 		= false;
		
		private var m_bHasChange:Boolean;
		
		public function SelectablePanel()
		{
			super();
		}
		
		[Bindable]
		public function get hasChange():Boolean
		{
			return m_bHasChange;
		}
		
		public function set hasChange(value:Boolean):void
		{
			m_bHasChange = value;
		}
		
		[Bindable]
		public function get IsSelected():Boolean
		{
			return m_bIsSelected;
		}
		
		public function set IsSelected(value:Boolean):void
		{
			m_bIsSelected = value;
		}
		
		[Bindable]
		public function get AllowContents():Boolean
		{
			return m_bAllowContents;
		}
		
		public function set AllowContents(value:Boolean):void
		{
			m_bAllowContents = value;
		}
		
		[Bindable]
		public function get focused():Boolean
		{
			return _focused;
		}
		
		public function set focused(value:Boolean):void
		{
			_focused = value;
		}

	}
}