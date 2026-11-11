package com.gazuntite.common.dto.pmh.compHistory.social
{
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.common.view.components.WorkDaysAddMoreWindow;
	
	import mx.collections.ArrayCollection;
	
	public class PatientSocialHistoryDTO
	{
		private var _PatientID 					: int;
		private var _VisitID 					: int;
		private var _CategoryID 				: int;
		private var _TobaccoAddictionList 		: ArrayCollection;
		private var _AlcoholAddictionList 		: ArrayCollection;
		private var _DrugAddictionList 			: ArrayCollection;
		private var _MaritalStatusList 			: ArrayCollection;
		private var _WorkStatusList 			: ArrayCollection;
		private var _OtherList 					: ArrayCollection;
		
		public function FromXML(x:XML):void
		{
			VisitID    			= x.@VisitID;
			PatientID			= x.@PatientID;
			CategoryID			= x.@CategoryID;
			
			TobaccoAddictionList = new ArrayCollection();
			
			var xTobaccoAddiction:XMLList = x.TobaccoAddiction[0].children();			
			
			for each (var xTB:XML in xTobaccoAddiction ) 
			{
				var addictionTB:CommonAddictionDTO = new CommonAddictionDTO();
				addictionTB.FromXML(xTB);
				TobaccoAddictionList.addItem(addictionTB);
			}
			
			AlcoholAddictionList = new ArrayCollection();
			
			var xAlcoholAddiction:XMLList = x.AlcoholAddiction[0].children();
			
			for each (var xAL:XML in xAlcoholAddiction ) 
			{
				var addictionAL:CommonAddictionDTO = new CommonAddictionDTO();
				addictionAL.FromXML(xAL);
				AlcoholAddictionList.addItem(addictionAL);
			}
			
			DrugAddictionList = new ArrayCollection();
			
			var xDrugAddictionDTO:XMLList = x.DrugAddictionDTO[0].children();
			
			for each (var xDR:XML in xDrugAddictionDTO   ) 
			{
				var addictionDR:CommonAddictionDTO = new CommonAddictionDTO();
				addictionDR.FromXML(xDR);
				DrugAddictionList.addItem(addictionDR);
			}
			
			WorkStatusList = new ArrayCollection();
			
			var xWorkStatus:XMLList = x.WorkStatus[0].children();
			
			for each (var xWS:XML in xWorkStatus ) 
			{
				var addictionWS:PatientWorkStatusDTO = new PatientWorkStatusDTO();
				addictionWS.FromXML(xWS);
				WorkStatusList.addItem(addictionWS);
			}
			
			MaritalStatusList = new ArrayCollection();
			
			var xMaritalStatus:XMLList = x.MaritalStatus[0].children();
			
			for each (var xMS:XML in xMaritalStatus ) 
			{
				var addictionMS:PatientMartialStatusDTO = new PatientMartialStatusDTO();
				addictionMS.FromXML(xMS);
				MaritalStatusList.addItem(addictionMS);
			}
			
			OtherList = new ArrayCollection();
			
			var xOther:XMLList = x.Other[0].children();
			
			for each (var xOT:XML in xOther  ) 
			{
				var addictionOT:PatientSocialHistoryOtherDTO = new PatientSocialHistoryOtherDTO();
				addictionOT.FromXML(xOT);
				OtherList.addItem(addictionOT);
			}
		}
		
		public function ToXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName("PatientSocialHistoryDTO");
			
			x.@VisitID				= VisitID;
			x.@PatientID			= PatientID;
			x.@CategoryID			= CategoryID;
			
			if(TobaccoAddictionList)
			{
				var xTB:XML = XmlUtils.getNodeByTagName("TobaccoAddiction");
				
				for each (var addiction:CommonAddictionDTO in TobaccoAddictionList) 
				{
					xTB.appendChild(addiction.ToXML());
				}
				
				x.appendChild(xTB);
			}
			
			if(AlcoholAddictionList)
			{
				var xAL:XML = XmlUtils.getNodeByTagName("AlcoholAddiction");
				
				for each (var addiction:CommonAddictionDTO in AlcoholAddictionList) 
				{
					xAL.appendChild(addiction.ToXML());
				}
				
				x.appendChild(xAL);
			}
			
			if(DrugAddictionList)
			{
				var xDR:XML = XmlUtils.getNodeByTagName("DrugAddictionDTO");
				
				for each (var addiction:CommonAddictionDTO in DrugAddictionList) 
				{
					xDR.appendChild(addiction.ToXML());
				}
				
				x.appendChild(xDR);
			}
			
			if(WorkStatusList)
			{
				var xWS:XML = XmlUtils.getNodeByTagName("WorkStatus");
				
				for each (var ws:PatientWorkStatusDTO in WorkStatusList) 
				{
					xWS.appendChild(ws.ToXML());
				}
				
				x.appendChild(xWS);
			}
			
			if(MaritalStatusList)
			{
				var xMS:XML = XmlUtils.getNodeByTagName("MaritalStatus");
				
				for each (var ms:PatientMartialStatusDTO in MaritalStatusList) 
				{
					xMS.appendChild(ms.ToXML());
				}
				
				x.appendChild(xMS);
			}
			
			if(OtherList)
			{
				var xOT:XML = XmlUtils.getNodeByTagName("Other");
				
				for each (var ot:PatientSocialHistoryOtherDTO in OtherList) 
				{
					xOT.appendChild(ot.ToXML());
				}
				
				x.appendChild(xOT);
			}
			
			return x;
		}
		
		public function get PatientID():int
		{
			return _PatientID;
		}
		
		public function set PatientID(value:int):void
		{
			_PatientID = value;
		}
		
		public function get VisitID():int
		{
			return _VisitID;
		}
		
		public function set VisitID(value:int):void
		{
			_VisitID = value;
		}
		
		public function get CategoryID():int
		{
			return _CategoryID;
		}
		
		public function set CategoryID(value:int):void
		{
			_CategoryID = value;
		}
		
		public function get TobaccoAddictionList():ArrayCollection
		{
			return _TobaccoAddictionList;
		}
		
		public function set TobaccoAddictionList(value:ArrayCollection):void
		{
			_TobaccoAddictionList = value;
		}
		
		public function get AlcoholAddictionList():ArrayCollection
		{
			return _AlcoholAddictionList;
		}
		
		public function set AlcoholAddictionList(value:ArrayCollection):void
		{
			_AlcoholAddictionList = value;
		}
		
		public function get DrugAddictionList():ArrayCollection
		{
			return _DrugAddictionList;
		}
		
		public function set DrugAddictionList(value:ArrayCollection):void
		{
			_DrugAddictionList = value;
		}
		
		public function get MaritalStatusList():ArrayCollection
		{
			return _MaritalStatusList;
		}
		
		public function set MaritalStatusList(value:ArrayCollection):void
		{
			_MaritalStatusList = value;
		}
		
		public function get WorkStatusList():ArrayCollection
		{
			return _WorkStatusList;
		}
		
		public function set WorkStatusList(value:ArrayCollection):void
		{
			_WorkStatusList = value;
		}
		
		public function get OtherList():ArrayCollection
		{
			return _OtherList;
		}
		
		public function set OtherList(value:ArrayCollection):void
		{
			_OtherList = value;
		}
		
		
	}
}