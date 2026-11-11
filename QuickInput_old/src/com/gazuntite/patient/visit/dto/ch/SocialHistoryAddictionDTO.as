package com.gazuntite.patient.visit.dto.ch
{
	import com.gazuntite.patient.visit.dto.common.BaseDTO;
	
	[Bindable]
	public class SocialHistoryAddictionDTO extends BaseDTO
	{
		private var _IsPresentSelected:String = "";
		private var _IsEducated:String = "";
		private var _OnSet:String = "";
		private var _EndDate:String = "";
		private var _AddictionNotes:String = "";
		private var _IsYesSelected:String = "";
		private var _IsNoSelected:String = "";
		private var _MediumTypeID:int;
		private var _UsageAmountID:int;
		private var _SocialHistoryAddictionTypeID:int;
		private var _SocialHistoryAddictionID:int;
		private var _PatientSocialHistoryID:int;
		
		private var _IsUnknown:Boolean;
		private var _MediumType:String; //Ayesha 13/02/2013: changing type to string from boolean
		private var _UsageAmount:String;
		
		public function SocialHistoryAddictionDTO()
		{
			super();
		}
		
		public override function ToXML():XML
		{
			this.nodeName = "SocialHistoryAddictionDTO";
			var x:XML = super.ToXML();
					
			x.@IsPresentSelected					= IsPresentSelected;
			x.@IsEducated							= IsEducated;
			x.@OnSet								= OnSet;
			x.@EndDate								= EndDate;
			x.@AddictionNotes						= AddictionNotes;
			x.@IsYesSelected						= IsYesSelected;
			x.@IsNoSelected							= IsNoSelected;
			x.@MediumTypeID							= MediumTypeID;
			x.@UsageAmountID						= UsageAmountID;
			x.@AddictionTypeID						= SocialHistoryAddictionTypeID;
			x.@SocialHistoryAddictionID				= SocialHistoryAddictionID;
			x.@PatientSocialHistoryID				= PatientSocialHistoryID;
			x.@IsUnknown							= IsUnknown;
			x.@MediumType							= MediumType;
			x.@UsageAmount							= UsageAmount;
			
			return x;
		}
		
		public function get UsageAmount():String
		{
			return _UsageAmount;
		}

		public function set UsageAmount(value:String):void
		{
			_UsageAmount = value;
		}

		public function get MediumType():String
		{
			return _MediumType;
		}

		public function set MediumType(value:String):void
		{
			_MediumType = value;
		}

		public function get PatientSocialHistoryID():int
		{
			return _PatientSocialHistoryID;
		}

		public function set PatientSocialHistoryID(value:int):void
		{
			_PatientSocialHistoryID = value;
		}

		public function get SocialHistoryAddictionID():int
		{
			return _SocialHistoryAddictionID;
		}

		public function set SocialHistoryAddictionID(value:int):void
		{
			_SocialHistoryAddictionID = value;
		}

		public function get SocialHistoryAddictionTypeID():int
		{
			return _SocialHistoryAddictionTypeID;
		}

		public function set SocialHistoryAddictionTypeID(value:int):void
		{
			_SocialHistoryAddictionTypeID = value;
		}

		public function get IsUnknown():Boolean
		{
			return _IsUnknown;
		}

		public function set IsUnknown(value:Boolean):void
		{
			_IsUnknown = value;
		}

		public function get IsNoSelected():String
		{
			return _IsNoSelected;
		}

		public function set IsNoSelected(value:String):void
		{
			_IsNoSelected = value;
		}

		public function get IsYesSelected():String
		{
			return _IsYesSelected;
		}

		public function set IsYesSelected(value:String):void
		{
			_IsYesSelected = value;
		}

		public function get UsageAmountID():int
		{
			return _UsageAmountID;
		}

		public function set UsageAmountID(value:int):void
		{
			_UsageAmountID = value;
		}

		public function get MediumTypeID():int
		{
			return _MediumTypeID;
		}

		public function set MediumTypeID(value:int):void
		{
			_MediumTypeID = value;
		}

		public function get AddictionNotes():String
		{
			return _AddictionNotes;
		}

		public function set AddictionNotes(value:String):void
		{
			_AddictionNotes = value;
		}

		public function get EndDate():String
		{
			return _EndDate;
		}

		public function set EndDate(value:String):void
		{
			_EndDate = value;
		}

		public function get OnSet():String
		{
			return _OnSet;
		}

		public function set OnSet(value:String):void
		{
			_OnSet = value;
		}

		public function get IsEducated():String
		{
			return _IsEducated;
		}

		public function set IsEducated(value:String):void
		{
			_IsEducated = value;
		}

		public function get IsPresentSelected():String
		{
			return _IsPresentSelected;
		}

		public function set IsPresentSelected(value:String):void
		{
			_IsPresentSelected = value;
		}

	}
}