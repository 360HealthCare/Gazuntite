package com.gazuntite.common.view
{
	import flash.events.Event;
	import flash.events.EventDispatcher;

	[Bindable]
	public class MainContainerViewModel extends EventDispatcher
	{
		public static const EVENT_VIEW_COUNT_CHANGE:String = "EVENT_VIEW_COUNT_CHANGE";
		public static const EVENT_CLOSE_TOPBAR:String = "EVENT_CLOSE_TOPBAR";
		protected static var instance:MainContainerViewModel;
		
		public var topbarViewMinHeight:Number = 66;
		public var topvarViewPercentHeight:Number =0;
		public var topvarViewHeight:Number =360;
		public var patientViewMinHeight:Number = 50;
		public var patientViewMinHeightPreferred:Number = 50;
		public var patientViewPercentHeight:Number = 0;
		public var showBottomFiller:Boolean = true;
		public var showPriacticeManagerView:Boolean = false;
		
		private var _expanedViewCount:Number = 0;

		public function get expanedViewCount():Number
		{
			return _expanedViewCount;
		}

		public function set expanedViewCount(value:Number):void
		{
			_expanedViewCount = value;
			this.dispatchEvent(new Event(EVENT_VIEW_COUNT_CHANGE));
		}

		
		private var _topbarExpended:Boolean = false;
		private var _patientViewExpanded:Boolean = false;
		
		
		
		public function MainContainerViewModel(useSingleton:Number)
		{
		}
		public static function getInstance():MainContainerViewModel
		{
			if (instance==null)
			{
				instance = new MainContainerViewModel(1);
			}
			return instance;
		}

		public function get topbarExpended():Boolean
		{
			return _topbarExpended;
		}

		public function set topbarExpended(value:Boolean):void
		{
			if (_topbarExpended!=value)
			{
				_topbarExpended = value;
				topbarViewMinHeight = _topbarExpended?104:66;
				updateLayout();
			}
		}

		public function get patientViewExpanded():Boolean
		{
			return _patientViewExpanded;
		}

		public function set patientViewExpanded(value:Boolean):void
		{
			if (_patientViewExpanded!=value)
			{
				_patientViewExpanded = value;
				if (_patientViewExpanded)
				{
					patientViewMinHeight = 66;
				}
				else
				{
					patientViewMinHeight = patientViewMinHeightPreferred;
				}
				updateLayout();
			}
		}

		protected function updateLayout():void
		{
			var count:Number = 0;
			if (topbarExpended)
			{
				count ++;
			}
			if (patientViewExpanded)
			{
				count ++;
			}
			expanedViewCount = count;
			switch (expanedViewCount)
			{
				case 0:
					topvarViewPercentHeight = 0;
					patientViewPercentHeight = 0;
					showBottomFiller = true;
					break;
				case 1:
//					topvarViewPercentHeight = topbarExpended?55:0;
//					patientViewPercentHeight = patientViewExpanded?100:0;
					topvarViewPercentHeight = topbarExpended?58:0;
					patientViewPercentHeight = patientViewExpanded?100:42;
					showBottomFiller = false;
					break;
				case 2:
					topvarViewPercentHeight = 48;
					patientViewPercentHeight = 100;
					showBottomFiller = false;
					break;
			}
		}
	}
}