package com.zigron.gazuntite.view.topbar.rapidaccess
{
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.common.event.rapidAccess.LoadAllQuickLinksEvent;
	import com.zigron.gazuntite.model.ApplicationModel;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class RapidAccessModel extends EventDispatcher
	{
		protected static var instance:RapidAccessModel = null;
		public var model : ApplicationModel
		
		public function RapidAccessModel(useSingleton:Number)
		{
			model = ApplicationModel.getInstance();
		}
		
		public static function getInstance():RapidAccessModel
		{
			if (instance == null)
			{
				instance = new RapidAccessModel(1);
			}
			return instance;
		}
		
		public function LoadAllQuickLinks():void
		{
			var evts:LoadAllQuickLinksEvent = new LoadAllQuickLinksEvent(onLoadAllQuickLinksEvent);
			CairngormEventDispatcher.getInstance().dispatchEvent(evts);
		}
		private function onLoadAllQuickLinksEvent(arr:ArrayCollection):void
		{
			if(null == model.allQuickLinksList)
				model.allQuickLinksList = new ArrayCollection();
			else if(model.allQuickLinksList)
				model.allQuickLinksList.removeAll();
			
			model.allQuickLinksList = arr;
		}
		
	}
}