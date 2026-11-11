package com.gazuntite.common.view
{
	import com.gazuntite.common.appController.QSCommonController;
	import com.gazuntite.common.dto.PatientDTO;

	[Bindable]
	public class PatientViewModel
	{
		protected static var instance:PatientViewModel = null;
		
		public static const MAIN_TAB_NONE:Number = -1;
		public static const MAIN_TAB_PROFILE:Number = 0;
		public static const MAIN_TAB_HISTORY:Number = 1;
		public static const MAIN_TAB_INPUT:Number = 2;
		
		protected var mainContainerViewModel:MainContainerViewModel;
		
		public var patientMainContainerHeight:Number = 0;
		public var patientInputContainerHeight:Number = 0;
		

		private var _examBarHeight:Number = 35;

		public function get examBarHeight():Number
		{
			return _examBarHeight;
		}

		public function set examBarHeight(value:Number):void
		{
			_examBarHeight = value;
			updatePreferredMinHeight();
		}

		private var _DetailViewShown:Boolean = false;
		public function get DetailViewShown():Boolean
		{
			return _DetailViewShown;
		}

		public function set DetailViewShown(value:Boolean):void
		{
			_DetailViewShown = value;
			updatePreferredMinHeight();
			mainContainerViewModel.patientViewExpanded = _DetailViewShown;
		}
		
		public function updatePreferredMinHeight():void
		{
			if (!_DetailViewShown)
			{
				if (showMainInputTab || showMainHistoryTab || showMainProfileTab)
				{
					mainContainerViewModel.patientViewMinHeightPreferred = examBarHeight + 40;
				}
				else
				{
					mainContainerViewModel.patientViewMinHeightPreferred = examBarHeight;
				}
				mainContainerViewModel.patientViewExpanded = !mainContainerViewModel.patientViewExpanded;
				mainContainerViewModel.patientViewExpanded = !mainContainerViewModel.patientViewExpanded;
			}
			else
			{
				mainContainerViewModel.patientViewMinHeightPreferred = examBarHeight + 86;
			}
		}

 		
		private var _selectedPatient:PatientDTO = null;

		public function get selectedPatient():PatientDTO
		{
			return _selectedPatient;
		}

		public function set selectedPatient(value:PatientDTO):void
		{
			_selectedPatient = value;
		}


		protected var selectedTabList:Array = new Array();
		private var _showMainHistoryTab:Boolean = false;

		public function get showMainHistoryTab():Boolean
		{
			return _showMainHistoryTab;
		}

		public function set showMainHistoryTab(value:Boolean):void
		{
			_showMainHistoryTab = value;
			if (!_showMainHistoryTab)
			{
				expandMainHistory = true;
			}
			updateSelectedTab(MAIN_TAB_HISTORY, _showMainHistoryTab);
		}

		private var _showMainProfileTab:Boolean = false;

		public function get showMainProfileTab():Boolean
		{
			return _showMainProfileTab;
		}

		public function set showMainProfileTab(value:Boolean):void
		{
			_showMainProfileTab = value;
			if (!_showMainProfileTab)
			{
				expandMainProfile = true;
			}
			updateSelectedTab(MAIN_TAB_PROFILE, _showMainProfileTab);
		}

		private var _showMainInputTab:Boolean = false;

		public function get showMainInputTab():Boolean
		{
			return _showMainInputTab;
		}

		public function set showMainInputTab(value:Boolean):void
		{
			_showMainInputTab = value;
			if (!_showMainInputTab)
			{
				expandMainInput = true;
			}
			updateSelectedTab(MAIN_TAB_INPUT, _showMainInputTab);
		}

		public var expandMainHistory:Boolean = true;
		public var expandMainProfile:Boolean = true;
		private var _expandMainInput:Boolean = true;

		public function get expandMainInput():Boolean
		{
			return _expandMainInput;
		}

		public function set expandMainInput(value:Boolean):void
		{
			_expandMainInput = value;
			updateDetailShownState();
		}

		
		public function PatientViewModel(useSingleton:Number)
		{
			mainContainerViewModel = MainContainerViewModel.getInstance();
//			BindingUtils.bindSetter(onMainViewCountChange, mainContainerViewModel, "expanedViewCount", false, true);
			mainContainerViewModel.addEventListener(MainContainerViewModel.EVENT_VIEW_COUNT_CHANGE, onMainViewCountChange, false, 0, true);
		}
		public static function getInstance():PatientViewModel
		{
			if (instance == null)
			{
				instance = new PatientViewModel(1);
				QSCommonController.getInstance();
			}
			return instance;
		}
		
		public function onMainViewCountChange(param:*):void
		{
			if (mainContainerViewModel.expanedViewCount==2 && selectedTabList.length==2)
			{
				//there are 2 views (top bar and patient) in display, so only one sub view is allowed in patient view
				var old_tab:Number = selectedTabList[1];
				switch (old_tab)
				{
					case MAIN_TAB_HISTORY:
						showMainHistoryTab = false;
						expandMainHistory = true;
						break;
					case MAIN_TAB_PROFILE:
						showMainProfileTab = false;
						expandMainProfile = true;
						break;
					case MAIN_TAB_INPUT:
						showMainInputTab = false;
						expandMainInput = true;
						break;
				}
			}
		}
		protected function updateSelectedTab(updatedTab:Number, tabSelected:Boolean):void
		{
			updateDetailShownState();
			if (!tabSelected)
			{
				for (var i:Number=0; i< selectedTabList.length; i++)
				{
					if (selectedTabList[i] == updatedTab)
					{
						selectedTabList.splice(i,1);
						break;
					}
				}
			}
			else
			{
				selectedTabList.unshift(updatedTab);
				var unselect_start_index:Number = mainContainerViewModel.expanedViewCount==1?2:1;
				for (i=unselect_start_index; i< selectedTabList.length; i++)
				{
					switch (selectedTabList[i])
					{
						case MAIN_TAB_HISTORY:
							showMainHistoryTab = false;
							expandMainHistory = true;
							break;
						case MAIN_TAB_PROFILE:
							showMainProfileTab = false;
							expandMainProfile = true;
							break;
						case MAIN_TAB_INPUT:
							showMainInputTab = false;
							expandMainInput = true;
							break;
					}
				}
				selectedTabList = selectedTabList.slice(0, unselect_start_index);
			}
			updateDetailShownState();
		}
		
		protected function updateDetailShownState():void
		{
			var result:Boolean = false;
			result = (showMainHistoryTab && expandMainHistory)
					|| (showMainProfileTab && expandMainProfile)
					|| (showMainInputTab && expandMainInput);
			updatePreferredMinHeight();
			DetailViewShown = result;
			
		}
		public function closeAllTabs():void
		{
			showMainHistoryTab = false;
			expandMainHistory = true;
			showMainProfileTab = false;
			expandMainProfile = true;
			showMainInputTab = false;
			expandMainInput = true;
			selectedTabList = new Array();
			updateDetailShownState();
		}
		
	}
}