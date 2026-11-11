package com.gazuntite.common.model
{
	import com.adobe.cairngorm.model.ModelLocator;
	import com.gazuntite.common.util.QSConstants;
	import com.gazuntite.common.util.xml.XmlUtils;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	
	[Bindable]
	public class QSCommonModelLocater implements ModelLocator
	{
		private static var model 							:QSCommonModelLocater;
		
		private var logger:ILogger = Log.getLogger("com.gazuntite.common.model.QSCommonModelLocater");
		
		public function QSCommonModelLocater()
		{
		}
		
		public static function getInstance() : QSCommonModelLocater
		{
			if ( model == null )
				model = new QSCommonModelLocater();
			return model;
		}
		
		
		private var _ConfigXML							:XML;
		
		public function get ConfigXML():XML
		{
			return _ConfigXML;
		}
		
		public function set ConfigXML(value:XML):void
		{
			_ConfigXML = value;
			
			
			QSConstants.RESTFULL_SERVICE_BASE_URL 						 			= XmlUtils.getPropertyValueByName( 'RESTFUL_SERVICE_BASE_URL', value );
			QSConstants.RESTFULL_SERVICE_BASE_MAIN_URL 		 						= XmlUtils.getPropertyValueByName( 'RESTFUL_SERVICE_BASE_URL', value );			
			QSConstants.RESTFULL_SERVICE_BASE_URL_FOR_LOAD_MEDICATIONS	 			= XmlUtils.getPropertyValueByName( 'EPRESCRIPTION_RESTFULSERVICE', value );
			QSConstants.EPRESCRIPTION_USER_SERVICE 					 				= XmlUtils.getPropertyValueByName( 'EPRESCRIPTION_USER_SERVICE', value );	
			QSConstants.USER_MANAGER_RESTFULL_SERVICE_BASE_URL 		 				= XmlUtils.getPropertyValueByName( 'USER_MANAGER_RESTFULLSERVICEBASE_URL', value );	
			QSConstants.BILLING_RESTFULL_SERVICE_BASE_URL 			 				= XmlUtils.getPropertyValueByName( 'BILLING_RESTFUL_SERVICE', value );	
			QSConstants.RESTFULL_SERVICE_BASE_URL_dev 				 				= XmlUtils.getPropertyValueByName( 'COMMUNICATION_RESTFUL_SERVICE', value );	
			QSConstants.QI_PATIENT_ALLERGY_RESTFUL_SERVICE			 				= XmlUtils.getPropertyValueByName( 'EPRESCRIPTION_RESTFULSERVICE', value );	
			QSConstants.EPRESCRIPTION_RESTFULL_SERVICE_BASE_URL		 				= XmlUtils.getPropertyValueByName( 'EPRESCRIPTION_RESTFULSERVICE', value );	
			
			
			//log it 
			//logger.debug( "RESTFULL_SERVICE_BASE_URL: " + CommunicationConstant.RESTFULL_SERVICE_BASE_URL  );
			
			
			
			logger.debug( "RESTFUL_SERVICE_BASE_URL: " + QSConstants.RESTFULL_SERVICE_BASE_URL  ); 						
			logger.debug( "RESTFUL_SERVICE_BASE_URL: " + QSConstants.RESTFULL_SERVICE_BASE_MAIN_URL  ); 		 			
			logger.debug( "EPRESCRIPTION_RESTFULSERVICE: " + QSConstants.RESTFULL_SERVICE_BASE_URL_FOR_LOAD_MEDICATIONS	  );
			logger.debug( "EPRESCRIPTION_USER_SERVICE: " + QSConstants.EPRESCRIPTION_USER_SERVICE  ); 					 	
			logger.debug( "USER_MANAGER_RESTFULLSERVICEBASE_URL: " + QSConstants.USER_MANAGER_RESTFULL_SERVICE_BASE_URL  ); 		 	
			logger.debug( "BILLING_RESTFUL_SERVICE: " + QSConstants.BILLING_RESTFULL_SERVICE_BASE_URL  ); 			 	
			logger.debug( "COMMUNICATION_RESTFUL_SERVICE: " + QSConstants.RESTFULL_SERVICE_BASE_URL_dev   );				 	
			logger.debug( "EPRESCRIPTION_RESTFULSERVICE: " + QSConstants.QI_PATIENT_ALLERGY_RESTFUL_SERVICE	  );		 	
			logger.debug( "EPRESCRIPTION_RESTFULSERVICE: " + QSConstants.EPRESCRIPTION_RESTFULL_SERVICE_BASE_URL  );		 	
			
			
		}
	}
}