/*
*Class: EmailDTO
*Created by: zahid mehmood
*Description: 
*Copyright 2011 Zigron Inc. All right reserved
*/
package com.gazuntite.provider.services.email.dto
{
	import com.gazuntite.provider.services.email.util.EmailConstant;
	import com.gazuntite.provider.services.email.util.XMLUtil;
	import com.gazuntite.provider.services.email.util.XmlConstants;
	
	import flashx.textLayout.conversion.ConversionType;
	
	import mx.utils.XMLUtil;

	[Bindable]
	public class EmailDTO
	{
		private var _m_EmailID				:int
		private var m_EmailTemplateID		:int;
		private var m_UserId				:int;
		private var m_RECIEVERID			:int;
		private var m_ClinicBranchID 		:int;
		private var m_Subject 				:String;
		private var m_Message 				:String;
		private var _StationID				:int;
		//Attachment Bytes
		private var m_AttachedFileName 		:String;
		private var m_HasAttachment 		:String;
		//private var m_HasAttachment 		:String;
		//RecipientEmail  
		private var _m_SENDERID 			:int;
		private var _m_EmailStateID 		:int;
		private var _m_EmailTypeID 			:int;
		private var _m_Token_ID 			:int;
		private var _m_MailSentAt			:String;
		private var _m_From					:String;
		private var _sendto					:String;
		private var _m_currentPage 			:int;
		private var _m_totalpages			:int;
		private var _isSelected				:Boolean;
		private var _firstRecord:int;
		private var _lastRecord:int;
		//private var m_Attachemnts				:int;   // DTO List
		
		public function EmailDTO()
		{
		}
		
		public function get EmailID():int
		{
			return _m_EmailID;
		}

		public function set EmailID(value:int):void
		{
			_m_EmailID = value;
		}

		public function get totalpages():int
		{
			return _m_totalpages;
		}

		public function set totalpages(value:int):void
		{
			_m_totalpages = value;
		}

		public function get currentPage():int
		{
			return _m_currentPage;
		}

		public function set currentPage(value:int):void
		{
			_m_currentPage = value;
		}

		public function get From():String
		{
			return _m_From;
		}

		public function set From(value:String):void
		{
			_m_From = value;
		}

		public function get MailSentAt():String
		{
			return _m_MailSentAt;
		}

		public function set MailSentAt(value:String):void
		{
			_m_MailSentAt = value;
		}

		public function get EmailStateID():int
		{
			return _m_EmailStateID;
		}

		public function set EmailStateID(value:int):void
		{
			_m_EmailStateID = value;
		}

		public function get SENDERID():int
		{
			return _m_SENDERID;
		}

		public function set SENDERID(value:int):void
		{
			_m_SENDERID = value;
		}

		public function get EmailTemplateID():int
		{
			return m_EmailTemplateID;
		}
		
		public function set EmailTemplateID(value:int):void
		{
			m_EmailTemplateID = value;
		}
		
		public function get UserId():int
		{
			return m_UserId;
		}
		
		public function set UserId(value:int):void
		{
			m_UserId = value;
		}
		
		public function get RECIEVERID():int
		{
			return m_RECIEVERID;
		}
		
		public function set RECIEVERID(value:int):void
		{
			m_RECIEVERID = value;
		}
		
		public function get ClinicBranchID():int
		{
			return m_ClinicBranchID;
		}
		
		public function set ClinicBranchID(value:int):void
		{
			m_ClinicBranchID = value;
		}
		
		public function get Subject():String
		{
			return m_Subject;
		}
		
		public function set Subject(value:String):void
		{
			m_Subject = value;
		}
		
		public function get Message():String
		{
			return m_Message;
		}
		
		public function set Message(value:String):void
		{
			m_Message = value;
		}
		
		public function get HasAttachment():String
		{
			return m_HasAttachment;
		}
		
		public function set HasAttachment(value:String):void
		{
			m_HasAttachment = value;
		}
		
		public function get AttachedFileName():String
		{
			return m_AttachedFileName;
		}
		
		public function set AttachedFileName(value:String):void
		{
			m_AttachedFileName = value;
		}

		public function get EmailTypeID():int
		{
			return _m_EmailTypeID;
		}

		public function set EmailTypeID(value:int):void
		{
			_m_EmailTypeID = value;
		}

		public function get Token_ID():int
		{
			return _m_Token_ID;
		}

		public function set Token_ID(value:int):void
		{
			_m_Token_ID = value;
		}

		
		public function get isSelected():Boolean
		{
			return _isSelected;
		}
		
		public function set isSelected(value:Boolean):void
		{
			_isSelected = value;
		}
		
		public function get firstRecord():int
		{
			return _firstRecord;
		}
		
		public function set firstRecord(value:int):void
		{
			_firstRecord = value;
		}
		
		public function get lastRecord():int
		{
			return _lastRecord;
		}
		
		public function set lastRecord(value:int):void
		{
			_lastRecord = value;
		}
		
		public function FromXML(x:XML):void
		{
			EmailID = x.@[XmlConstants.USEREMAIL_ID];
			EmailTemplateID = x.@[XmlConstants.EMAIL_TEMPLATE_ID];
			UserId = x.@[XmlConstants.USEREMAIL_ID];
			RECIEVERID = x.@[XmlConstants.RECIEVERID];
			ClinicBranchID = x.@[XmlConstants.CLINIC_BRANCH_ID];
			Subject = x.@[XmlConstants.SUBJECT];
			Message = x.@[XmlConstants.MESSAGE];
			AttachedFileName = x.@[XmlConstants.ATTACHED_FILE_NAME];
			HasAttachment = x.@[XmlConstants.HAS_ATTACHMENT];
			SENDERID = x.@[XmlConstants.SENDER_ID];
			EmailStateID = x.@[XmlConstants.EMAIL_STATE_ID];
			EmailTypeID = x.@[XmlConstants.EMAIL_TYPE_ID];
			Token_ID = x.@[XmlConstants.TOKEN_ID];
			MailSentAt = x.@[XmlConstants.MAILSENTAT];
			From = x.@[XmlConstants.FROM];
			sendto = x.@[XmlConstants.SENDTO];
		//	currentPage = x.@[XmlConstants.CURRENTPAGE];
			
			//totalpages = x.@[XmlConstants.TOTALPAGES];
			
			EmailConstant.FIRSTRECORD = x.@[XmlConstants.FIRSTRECORD];
			EmailConstant.LASTRECORD = x.@[XmlConstants.LASTRECORD];
			EmailConstant.TOTALEMAILS = x.@[XmlConstants.TOTALPAGES];
			EmailConstant.CURRENTPAGE = x.@[XmlConstants.FIRSTRECORD];
			 
			 //EmailConstant. = x.@[XmlConstants.LASTRECORD];
			isSelected = false;//x.@[XmlConstants.ISSELECTED];
		}
		
		
		public function ToXML():XML
		{
			var xml:XML = com.gazuntite.provider.services.email.util.XMLUtil.getNodeByTagName("Email");
			xml.@[XmlConstants.CLINIC_BRANCH_ID] = ClinicBranchID;
			xml.@[XmlConstants.EMAIL_STATE_ID] = EmailStateID;
			xml.@[XmlConstants.EMAIL_TYPE_ID] = EmailTypeID;
			xml.@[XmlConstants.HAS_ATTACHMENT] = HasAttachment;
			xml.@[XmlConstants.ATTACHED_FILE_NAME] = AttachedFileName;
			xml.@[XmlConstants.MESSAGE] = Message;
			xml.@[XmlConstants.SUBJECT] = Subject;
			xml.@[XmlConstants.RECIEVERID] = RECIEVERID;
			xml.@[XmlConstants.SENDER_ID] = SENDERID;
			
			return xml;
		}

		public function get sendto():String
		{
			return _sendto;
		}

		public function set sendto(value:String):void
		{
			_sendto = value;
		}

		public function get StationID():int
		{
			return _StationID;
		}

		public function set StationID(value:int):void
		{
			_StationID = value;
		}

		
		}

	}