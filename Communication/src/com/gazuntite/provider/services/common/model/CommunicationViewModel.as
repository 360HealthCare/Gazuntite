package com.gazuntite.provider.services.common.model
{
	[Bindable]
	public class CommunicationViewModel
	{
		public var communicationViewMenuShown:Boolean = false;
		public var emailMenuShown:Boolean = false;
		public var communicationViewSectionName:String = "PROFILE"; // profile, email, sms, etc
		
		
		private static var model :CommunicationViewModel;
		
		public function CommunicationViewModel() : void 
		{
			if ( CommunicationViewModel.model != null )
				throw new Error( "Only one CommunicationViewModel instance should be instantiated" );
		}
		
		public static function getInstance() : CommunicationViewModel 
		{
			if ( model == null )
				model = new CommunicationViewModel();
			
			return model;
		}
	}
}