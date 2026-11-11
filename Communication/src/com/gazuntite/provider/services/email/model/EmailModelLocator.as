/*
*Class: EmailModelLocator
*Created by: zahid mehmood
*Description: 
*Copyright 2011 Zigron Inc. All right reserved
*/
package com.gazuntite.provider.services.email.model
{
	import com.adobe.cairngorm.model.ModelLocator;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.provider.services.email.dto.EmailDTO;
	import com.gazuntite.provider.services.email.dto.EmailResultList;
	import com.gazuntite.provider.services.email.util.EmailConstant;
	import com.gazuntite.provider.services.email.util.XMLUtil;
	import com.gazuntite.provider.services.email.view.emailview.ReadEmailView;
	
	import mx.binding.utils.BindingUtils;
	import mx.collections.ArrayCollection;
	import mx.logging.ILogger;
	import mx.logging.Log;
	
	[Bindable]
	public class EmailModelLocator implements ModelLocator
	{
		private var logger:ILogger = Log.getLogger("com.zigron.provider.search.services.email.model.EmailModelLocator");
		
		private static var model 	:EmailModelLocator;
		private var _m_oEmailResultList:EmailResultList;
		private var _IsInbox:Boolean=true;
		private var _IsRead:Boolean = false;
		
		public function EmailModelLocator()
		{
			if ( model != null )
				throw new Error( "Only one EmailModelLocator instance should be instantiated" );
		}

		// LOGGED IN USER DATA - START
		private var _loggedInUserId							:int;
		private var _loggedInUserProviderId					:int;
		private var _loggedInUserProviderTypeId				:int;
		private var _loggedInUserSelectedBranchId				:int;
		
		private var _loggedInUserSelectedPracticeName			:String;//clinic branch name
		private var _loggedInUserSelectedStationID			:int;
		
		
		
		

		public function updateModel(loggedInUserId:int, loggedInUserProviderId:int,loggedInUserProviderTypeId:int,loggedInUserSelectedBranchId:int, loggedInUserSelectedBranchName:String,stationName:String ,stationID:int):void
		{
			this.loggedInUserId						= loggedInUserId;
			this.loggedInUserProviderId				= loggedInUserProviderId;
			this.loggedInUserProviderTypeId			= loggedInUserProviderTypeId;
			this.loggedInUserSelectedBranchId		= loggedInUserSelectedBranchId;
			//this.loggedInUserSelectedPracticeName	= userSelectedPracticeName; 
			this.loggedInUserSelectedStationID 	= stationID; 
		}

		public function get IsInbox():Boolean
		{
			return _IsInbox;
		}

		public function set IsInbox(value:Boolean):void
		{
			_IsInbox = value;
		}

		public function get m_oEmailResultList():EmailResultList
		{
			return _m_oEmailResultList;
		}

		public function set m_oEmailResultList(value:EmailResultList):void
		{
			_m_oEmailResultList = value;
		}

		public static function getInstance() : EmailModelLocator
		{
			if ( model == null )
				model = new EmailModelLocator();
			return model;
		}

	 ///////////////////  Email Detail //////////////////////
		private var _message:String;
		private var _subject:String;
		private var _from:String;
		private var _sendto:String;
		private var _hasAttachment:Boolean;
		private var _mailSentAt:String;
		private var _fileName:String;
		private var _emailID:int;
		private var _currentPage:int;
		private var _totalPage:int;
		private var _senderID:int;

		public function get senderID():int
		{
			return _senderID;
		}

		public function set senderID(value:int):void
		{
			_senderID = value;
		}
		
		
		
		public function get message():String
		{
			return _message;
		}
		
		public function set message(value:String):void
		{
			_message = value;
			//ReadEmailView._subject = value;
			
		}
		
		public function get subject():String
		{
			return _subject;
		}

		public function set subject(value:String):void
		{
			_subject = value;
		}

		public function get from():String
		{
			return _from;
		}

		public function set from(value:String):void
		{
			_from = value;
		}

		public function get sendto():String
		{
			return _sendto;
		}

		public function set sendto(value:String):void
		{
			_sendto = value;
		}

		public function get hasAttachment():Boolean
		{
			return _hasAttachment;
		}

		public function set hasAttachment(value:Boolean):void
		{
			_hasAttachment = value;
		}

		public function get currentPage():int
		{
			return _currentPage;
		}

		public function set currentPage(value:int):void
		{
			_currentPage = value;
		}

		public function get totalPage():int
		{
			return _totalPage;
		}

		public function set totalPage(value:int):void
		{
			_totalPage = value;
		}

		public function get mailSentAt():String
		{
			return _mailSentAt;
		}

		public function set mailSentAt(value:String):void
		{
			_mailSentAt = value;
		}

		public function get fileName():String
		{
			return _fileName;
		}

		public function set fileName(value:String):void
		{
			_fileName = value;
		}

		public function get emailID():int
		{
			return _emailID;
		}

		public function set emailID(value:int):void
		{
			_emailID = value;
		}

	
		
		public function get IsRead():Boolean
		{
			return _IsRead;
		}
		
		public function set IsRead(value:Boolean):void
		{
			_IsRead = value;
			
		}

		public function get loggedInUserId():int
		{
			return _loggedInUserId;
		}

		public function set loggedInUserId(value:int):void
		{
			_loggedInUserId = value;
		}

		public function get loggedInUserProviderId():int
		{
			return _loggedInUserProviderId;
		}

		public function set loggedInUserProviderId(value:int):void
		{
			_loggedInUserProviderId = value;
		}

		public function get loggedInUserProviderTypeId():int
		{
			return _loggedInUserProviderTypeId;
		}

		public function set loggedInUserProviderTypeId(value:int):void
		{
			_loggedInUserProviderTypeId = value;
		}

		public function get loggedInUserSelectedBranchId():int
		{
			return _loggedInUserSelectedBranchId;
		}

		public function set loggedInUserSelectedBranchId(value:int):void
		{
			_loggedInUserSelectedBranchId = value;
		}

		public function get loggedInUserSelectedPracticeName():String
		{
			return _loggedInUserSelectedPracticeName;
		}

		public function set loggedInUserSelectedPracticeName(value:String):void
		{
			_loggedInUserSelectedPracticeName = value;
		}

		public function get loggedInUserSelectedStationID():int
		{
			return _loggedInUserSelectedStationID;
		}

		public function set loggedInUserSelectedStationID(value:int):void
		{
			_loggedInUserSelectedStationID = value;
		}

		private var _ConfigXML							:XML;
		
		public function get ConfigXML():XML
		{
			return _ConfigXML;
		}
		
		public function set ConfigXML(value:XML):void
		{
			_ConfigXML = value;
			
			EmailConstant.RESTFULL_SERVICE_BASE_URL 			= XmlUtils.getPropertyValueByName( 'COMMUNICATION_RESTFUL_SERVICE', value );
			
			//log it 
			logger.debug( "RESTFULL_SERVICE_BASE_URL: " + EmailConstant.RESTFULL_SERVICE_BASE_URL  );
		}
		
		
		
	}
}