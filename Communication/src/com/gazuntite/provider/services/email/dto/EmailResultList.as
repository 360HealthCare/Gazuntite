/*
*Class: EmailResultList
*Created by: zahid mehmood
*Description: 
*Copyright 2011 Zigron Inc. All right reserved
*/
package com.gazuntite.provider.services.email.dto
{
	import mx.collections.ArrayCollection;
	import mx.states.AddItems;
	[Bindable]
	public class EmailResultList
	{
		
		private var m_oEmailAll:ArrayCollection;
		
		public function EmailResultList()
		{
			EmailAll = new ArrayCollection();
		}
		
		public function get EmailAll():ArrayCollection
		{
			return m_oEmailAll;
		}

		public function set EmailAll(value:ArrayCollection):void
		{
			m_oEmailAll = value;
		}

		public function FromXML(x:XML):void
		{
			
			//var EmailRecords:XMLList = x.MailDTO;
			
			var EmailList:XMLList = x.Email;
			
			
			var i:int =0;
			for(i=0;i<EmailList.length();i++)
			{
			    var EL:EmailDTO = new EmailDTO();
				EL.FromXML(EmailList[i]);
				EmailAll.addItem(EL);
			}
			
		}
		
		public function FromXMLSentEmail(x:XML):void
		{
			var EmailList:XMLList = x.Email;
			
			
			var i:int =0;
			for(i=0;i<EmailList.length();i++)
			{
				var EL:EmailDTO = new EmailDTO();
				EL.FromXML(EmailList[i]);
				EmailAll.addItem(EL);
			}
		}
		
		public function FromXMLToSingleMail(x:XML):EmailDTO
		{
				var EL:EmailDTO = new EmailDTO();
				EL.FromXML(x);
				
				return EL;
		}
	}
}


