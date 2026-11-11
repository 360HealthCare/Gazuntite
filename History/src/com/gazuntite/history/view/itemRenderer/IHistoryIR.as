package com.gazuntite.history.view.itemRenderer
{
	import com.gazuntite.history.view.views.HistoryListButtons;
	

	public interface IHistoryIR
	{
		function deselectAllButton():void;
		
		function get listButtonBar():HistoryListButtons;
	}
}