package com.gazuntite.controls.extended.components
{
	import spark.components.ButtonBarButton;
	
	public class CheckButtonBarButton extends ButtonBarButton
	{
		private var m_bHasChange:Boolean;
		
		public function CheckButtonBarButton()
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
	}
}