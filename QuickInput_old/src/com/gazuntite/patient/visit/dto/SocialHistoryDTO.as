package com.gazuntite.patient.visit.dto
{
	import com.gazuntite.patient.visit.dto.ch.SocialHistoryAddictionDTO;
	import com.gazuntite.patient.visit.dto.common.BaseDTO;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class SocialHistoryDTO extends BaseDTO
	{
		private var _ID:int;
		private var _EndDate:String = '';
		private var _OnSet:String= '';
		private var _Educated:String= '';
		private var _Amount:String= '';
		private var _Type:String= '';
		private var _Current:String= '';
		private var _Status:String= '';
		private var _Social:String= '';
		private var _PatientSocialHistoryID:int;
		private var _IsNA:Boolean;
		private var _Note:String = '';
		private var _IsWorkStatusYesSelected:String = '';
		private var _WorkStatusNotes:String = '';
		private var _IsOtherYesSelected:String = '';
		private var _OtherNotes:String = '';
		private var _WorkStatusDictationID:String = "00000000-0000-0000-0000-000000000000";
		private var _OtherDictationID:String = "00000000-0000-0000-0000-000000000000";
		private var _MaritalStatusID:int;
		private var _string:String ='';
		private var _patientSocialHistoryAddictionID:int; // Ayesha 15/02/2013: this ID is returned in load social history call and required to delete loaded record from grid
		
		public var SocialHistoryAddictionList:ArrayCollection = new ArrayCollection();
		
		public function SocialHistoryDTO()
		{
		}

		public function get patientSocialHistoryAddictionID():int
		{
			return _patientSocialHistoryAddictionID;
		}
		
		public function set patientSocialHistoryAddictionID(value:int):void
		{
			_patientSocialHistoryAddictionID = value;
		}
		
		public function get OtherDictationID():String
		{
			return _OtherDictationID;
		}
		
		public function set OtherDictationID(value:String):void
		{
			_OtherDictationID = value;
		}
		
		public function get WorkStatusDictationID():String
		{
			return _WorkStatusDictationID;
		}
		
		public function set WorkStatusDictationID(value:String):void
		{
			_WorkStatusDictationID = value;
		}
		
		public function get OtherNotes():String
		{
			return _OtherNotes;
		}
		
		public function set OtherNotes(value:String):void
		{
			_OtherNotes = value;
		}
		
		public function get IsOtherYesSelected():String
		{
			return _IsOtherYesSelected;
		}
		
		public function set IsOtherYesSelected(value:String):void
		{
			_IsOtherYesSelected = value;
		}
		
		public function get MaritalStatusID():int
		{
			return _MaritalStatusID;
		}
		
		public function set MaritalStatusID(value:int):void
		{
			_MaritalStatusID = value;
		}
		
		public function get WorkStatusNotes():String
		{
			return _WorkStatusNotes;
		}
		
		public function set WorkStatusNotes(value:String):void
		{
			_WorkStatusNotes = value;
		}
		
		public function get IsWorkStatusYesSelected():String
		{
			return _IsWorkStatusYesSelected;
		}
		
		public function set IsWorkStatusYesSelected(value:String):void
		{
			_IsWorkStatusYesSelected = value;
		}
		
		
		public function get IsNA():Boolean
		{
			return _IsNA;
		}
		
		public function set IsNA(value:Boolean):void
		{
			_IsNA = value;
		}
		
		public function get PatientSocialHistoryID():int
		{
			return _PatientSocialHistoryID;
		}
		
		public function set PatientSocialHistoryID(value:int):void
		{
			_PatientSocialHistoryID = value;
		}
		
		public function get Social():String
		{
			return _Social;
		}
		
		public function set Social(value:String):void
		{
			_Social = value;
		}
		
		public function get Status():String
		{
			return _Status;
		}
		
		public function set Status(value:String):void
		{
			_Status = value;
		}
		
		public function get Current():String
		{
			return _Current;
		}
		
		public function set Current(value:String):void
		{
			_Current = value;
		}
		
		public function get Type():String
		{
			return _Type;
		}
		
		public function set Type(value:String):void
		{
			_Type = value;
		}
		
		public function get Amount():String
		{
			return _Amount;
		}
		
		public function set Amount(value:String):void
		{
			_Amount = value;
		}
		
		public function get Educated():String
		{
			return _Educated;
		}
		
		public function set Educated(value:String):void
		{
			_Educated = value;
		}
		
		public function get OnSet():String
		{
			return _OnSet;
		}
		
		public function set OnSet(value:String):void
		{
			_OnSet = value;
		}
		
		public function get EndDate():String
		{
			return _EndDate;
		}
		
		public function set EndDate(value:String):void
		{
			_EndDate = value;
		}
		
		public function get ID():int
		{
			return _ID;
		}
		
		public function set ID(value:int):void
		{
			_ID = value;
		}
		
		public function get string():String
		{
			return _string;
		}
		
		public function set string(value:String):void
		{
			_string = value;
		}
		
		public override function ToXML():XML
		{
			this.nodeName = "SocialHistoryDTO";
			var x:XML = super.ToXML();
			
			x.@ID						    	= this.ID;
			x.@IsWorkStatusYesSelected			= this.IsWorkStatusYesSelected;
			x.@IsOtherYesSelected				= this.IsOtherYesSelected;
			x.@WorkStatusNotes					= this.WorkStatusNotes;
			x.@MaritalStatusID					= this.MaritalStatusID;
			x.@string							= this.string;
			x.@OtherNotes						= this.OtherNotes;
			x.@OtherDictationID					= this.OtherDictationID;
			x.@WorkStatusDictationID			= this.WorkStatusDictationID;
			x.@IsNA								= this.IsNA;
			x.@PatientSocialHistoryAddictionID  = this.patientSocialHistoryAddictionID;//Ayesha 15/02/2013
			
			var d:XML = XmlUtils.getNodeByTagName("AddictionList");
			
			for each(var dto:SocialHistoryAddictionDTO in SocialHistoryAddictionList )
			{
				//if(dto.PatientID !=0 )
				dto.PatientSocialHistoryID = this.ID;
				d.appendChild(dto.ToXML());
			}
				
			x.appendChild(d);
			
			return x;
		}
		
		public override function FromXML(x:XML):void
		{
			this.IsNA							 = x.@IsNA;
			this.PatientSocialHistoryID			 = x.@PatientSocialHistoryID;
			this.IsOtherYesSelected				 = x.@IsOtherYesSelected;
			this.Social 						 = x.@Social;
			this.Status 						 = x.@Status;
			this.Current 						 = x.@Current;
			this.Type 							 = x.@Type;
			this.Amount 						 = x.@Amount;
			this.OtherNotes 					 = x.@OtherNotes;
			this.Educated 						 = x.@Educated;
			this.OnSet 							 = x.@OnSet;
			this.EndDate 						 = x.@EndDate;
			this.patientSocialHistoryAddictionID = x.@PatientSocialHistoryAddictionID;//Ayesha 15/02/2013
			
			super.FromXML(x);
		}
	}
}