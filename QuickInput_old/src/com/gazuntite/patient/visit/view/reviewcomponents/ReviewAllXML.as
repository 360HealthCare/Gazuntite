package com.gazuntite.patient.visit.view.reviewcomponents
{
	import com.gazuntite.patient.visit.utils.Constants;
	import com.gazuntite.common.util.xml.XmlUtils;
	
	import mx.formatters.DateFormatter;
	
	[Bindable]
	public class ReviewAllXML
	{
		private var _IsFamilyReviewed 				:Boolean ;
		private var _IsMedicalReviewed				:Boolean ;
		private var _IsSocialReviewed				:Boolean;
		private var _IsAllergiesReviewed			:Boolean ;
		private var _IsChornicMedicationReviewed	:Boolean ;
		private var _IsImmunizationReviewed			:Boolean ;
		private var _IsLabOrderReviewed				:Boolean ;
		private var _IsAllReviewed					:Boolean ;
		private var _date							:String ;
		private var _VisitReviewID					 :String='0' ;
		private var _UserName                        :String ;
		
		
		
		public function ReviewAllXML()
		{
			//VisitReviewID = "0";
		}
		
		
		public function get VisitReviewID():String
		{
			return _VisitReviewID;
		}
		
		public function set VisitReviewID(value:String):void
		{
			_VisitReviewID = value;
		}
		
		public function get IsFamilyReviewed():Boolean
		{
			return _IsFamilyReviewed;
		}
		
		public function set IsFamilyReviewed(value:Boolean):void
		{
			_IsFamilyReviewed = value;
		}
		
		public function get IsMedicalReviewed():Boolean
		{
			return _IsMedicalReviewed;
		}
		
		public function set IsMedicalReviewed(value:Boolean):void
		{
			_IsMedicalReviewed = value;
		}
		
		public function get IsSocialReviewed():Boolean
		{
			return _IsSocialReviewed;
		}
		
		public function set IsSocialReviewed(value:Boolean):void
		{
			_IsSocialReviewed = value;
		}
		
		public function get IsAllergiesReviewed():Boolean
		{
			return _IsAllergiesReviewed;
		}
		
		public function set IsAllergiesReviewed(value:Boolean):void
		{
			_IsAllergiesReviewed = value;
		}
		
		public function get IsChornicMedicationReviewed():Boolean
		{
			return _IsChornicMedicationReviewed;
		}
		
		public function set IsChornicMedicationReviewed(value:Boolean):void
		{
			_IsChornicMedicationReviewed = value;
		}
		
		public function get IsImmunizationReviewed():Boolean
		{
			return _IsImmunizationReviewed;
		}
		
		public function set IsImmunizationReviewed(value:Boolean):void
		{
			_IsImmunizationReviewed = value;
		}
		
		public function get IsLabOrderReviewed():Boolean
		{
			return _IsLabOrderReviewed;
		}
		
		public function set IsLabOrderReviewed(value:Boolean):void
		{
			_IsLabOrderReviewed = value;
		}
		
		public function get IsAllReviewed():Boolean
		{
			return _IsAllReviewed;
		}
		
		public function set IsAllReviewed(value:Boolean):void
		{
			_IsAllReviewed = value;
		}
		
		public function get date():String
		{
			return _date;
		}
		
		public function set date(value:String):void
		{
			_date = value;
		}
		
		public function get UserName():String
		{
			return _UserName;
		}
		
		public function set UserName(value:String):void
		{
			_UserName = value;
		}

		public function toXML():XML
		{
			
			var xml:XML = XmlUtils.getNodeByTagName("VisitReviewResponse") ;
			xml.@["Status"] 								= "false";
			xml.@["Code"] 									= "0" ;
			xml.Sections.@["VisitReviewID"] 				= VisitReviewID;
			xml.Sections.@["IsFamilyHistoryReviewed"] 		= IsFamilyReviewed.toString();
			xml.Sections.@["IsMedicalHistoryReviewed"] 		= IsMedicalReviewed.toString();
			xml.Sections.@["IsSocialHistoryReviewed"] 		= IsSocialReviewed.toString();
			xml.Sections.@["IsAllergiesReviewed"] 			= IsAllergiesReviewed.toString();
			xml.Sections.@["IsChornicMedicationReviewed"] 	= IsChornicMedicationReviewed.toString();
			xml.Sections.@["IsImmunizationReviewed"] 		= IsImmunizationReviewed.toString();
			xml.Sections.@["IsLabOrderReviewed"] 			= IsLabOrderReviewed.toString();
			
			var df:DateFormatter							= new DateFormatter();
			df.formatString									= "MM/DD/YYYY";
			var d:Date										= new Date();
			date 											= df.format(d);
			xml.Sections.@["ReviewedDate"] 					= date;
			xml.Sections.@["VisitID"] 						= "0";
			xml.Sections.ReviewedBy.@["UserID"]				= "0";
			xml.Sections.ReviewedBy.@["FirstName"]			= "";
			xml.Sections.ReviewedBy.@["MiddleName"]			= "";
			xml.Sections.ReviewedBy.@["LastName"] 			= "";
				trace(xml);
			return xml;
			
		}
		
		public function fromXML(xml:XML):void
		{
		
				IsFamilyReviewed						= xml.@["IsFamilyHistoryReviewed"] 		== Constants.STRING_TRUE;
				IsMedicalReviewed						= xml.@["IsMedicalHistoryReviewed"] 	== Constants.STRING_TRUE;
				IsSocialReviewed						= xml.@["IsSocialHistoryReviewed"]		== Constants.STRING_TRUE;
				IsAllergiesReviewed						= xml.@["IsAllergiesReviewed"]			== Constants.STRING_TRUE;
				IsChornicMedicationReviewed				= xml.@["IsChornicMedicationReviewed"]  == Constants.STRING_TRUE;
				IsImmunizationReviewed					= xml.@["IsImmunizationReviewed"]       == Constants.STRING_TRUE;
				IsLabOrderReviewed						= xml.@["IsLabOrderReviewed"]   		== Constants.STRING_TRUE;
				IsAllReviewed							= xml.@["IsAllReviewed"]				== Constants.STRING_TRUE;
				VisitReviewID							= xml.@["VisitReviewID"] ;
			
			if(VisitReviewID != "0")
			{
				var reviewXmlList:XMLList			   = xml.ReviewedBy;
				var  reviewXml :XML           		   = reviewXmlList[0];
				UserName 							   = reviewXml.@["FirstName"];
				date								   = xml.@["ReviewedDate"] ;
			}
			
		}
		
		


	}
}		
		
		