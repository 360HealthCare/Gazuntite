package com.gazuntite.document.model
{
	import com.adobe.cairngorm.model.ModelLocator;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class DMModelLocator implements ModelLocator
	{
		
		private static var model 							:DMModelLocator;
		
		
		public function DMModelLocator() : void 
		{
			if ( model != null )
				throw new Error( "Only one SearchPatientModelLocator instance should be instantiated" );
		}
		
		public static function getInstance() : DMModelLocator
		{
			if ( model == null )
				model = new DMModelLocator();
			return model;
		}
		
		
		public function resetModel():void
		{
			
		}
		
		public function updateModel(/*Arguments*/):void
		{
			
		}
		
		public var PatientDocomentsDTOList:ArrayCollection;
		public var SelectedPatientDocomentList:ArrayCollection;
		
		public var isSearchByDocument:Boolean = false;
	}
	
}