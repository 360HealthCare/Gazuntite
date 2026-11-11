package com.gazuntite.provider.services.sms.dto
{
	import mx.collections.ArrayCollection;
	import mx.states.AddItems;
	[Bindable]
	public class SMSResultList
	{
		private var _AllSentSMSList:ArrayCollection;
		public function SMSResultList()
		{
			ALLSentSMS=new ArrayCollection();
		}
		
		public function get ALLSentSMS():ArrayCollection
		{
			return _AllSentSMSList;
		}
		
		public function set ALLSentSMS(value:ArrayCollection):void
		{
			_AllSentSMSList = value;
		}
		
		
		public function get AllSentSMSList():ArrayCollection
		{
			return _AllSentSMSList;
		}

		public function set AllSentSMSList(value:ArrayCollection):void
		{
			_AllSentSMSList = value;
		}
			
		public function FromXML(x:XML):void
		{
			
			//var EmailRecords:XMLList = x.MailDTO;
			
			
			
			var SmsList:XMLList = x.SMSDetails.SMS;
			
			
			var i:int =0;
			for(i=0;i<SmsList.length();i++)
			{
				var smsDTO:SMSDTOResponse = new SMSDTOResponse();
				smsDTO.FromXML(SmsList[i]);
				
				ALLSentSMS.addItem(smsDTO);
			}
			
			
			/*
			for(var recivers:int =0; recivers<recieverList.length();recivers++)
			{
				var smsDTO:SMSDTOResponse = new SMSDTOResponse();
				userId = recieverList.@[XmlConstants.USER_ID]
				smsDTO.FromXML(SmsList[i]);
				ALLSentSMS.addItem(smsDTO);
			}
			*/
			
		}
	}
}