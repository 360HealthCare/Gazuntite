package com.gazuntite.common.view.components.reviewofsystem
{
	import com.gazuntite.viewModel.PatientDictationNoteViewModel;

	[Bindable]
	public class PatientInputPhysicalReviewOfSystemViewModel
	{
		protected static var instance:PatientInputPhysicalReviewOfSystemViewModel;
		
		public var showRosItemDetailViewTopLevel:Boolean = false;
		public var showRosItemViewHeentLevel:Boolean = false;
		public var showRosItemViewHeentDetailLevel:Boolean = false;
		private var m_acshowRosItemLevel2DetailView:Boolean = false;
		public var rosSelectedItemIndex:Number = -1;
		public var rosHeentSelectedItemIndex:Number = -1;
		public var rosDetailSelectedItemIndex:Number = -1;
		public var rosDictationNoteViewModel:PatientDictationNoteViewModel;
		public var rosDictatioNoteHistoryViewModel:PatientDictationNoteViewModel;
		public var physicalDictationNoteViewModel:PatientDictationNoteViewModel;
		public var physicalDictationNoteHistoryViewModel:PatientDictationNoteViewModel;
		public var heentListItemWidth:Number = 300;
		
		public function get showRosItemLevel2DetailView():Boolean
		{
			return m_acshowRosItemLevel2DetailView;
		}

		public function set showRosItemLevel2DetailView(value:Boolean):void
		{
			m_acshowRosItemLevel2DetailView = value;
		}

		public function PatientInputPhysicalReviewOfSystemViewModel()
		{
			rosDictationNoteViewModel = new PatientDictationNoteViewModel();
			rosDictatioNoteHistoryViewModel = new PatientDictationNoteViewModel();
			
			physicalDictationNoteViewModel = new PatientDictationNoteViewModel();
			physicalDictationNoteHistoryViewModel = new PatientDictationNoteViewModel();
		}
		
		
		public static function getInstance():PatientInputPhysicalReviewOfSystemViewModel
		{
			if (instance == null)
			{
				instance = new PatientInputPhysicalReviewOfSystemViewModel();
			}
			
			return instance;
		}
	}
}