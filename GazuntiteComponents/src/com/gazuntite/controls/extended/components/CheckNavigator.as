package com.gazuntite.controls.extended.components
{
	import spark.components.NavigatorContent;
	
	public class CheckNavigator extends NavigatorContent
	{
		private var m_bAllowContents:Boolean 	= false;
		private var m_bIsSelected:Boolean 		= false;
		private var m_bHasChange:Boolean		= false;
		
		public function CheckNavigator()
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
	}
}