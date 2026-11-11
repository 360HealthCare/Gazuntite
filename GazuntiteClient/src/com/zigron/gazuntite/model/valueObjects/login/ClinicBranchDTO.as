package com.zigron.gazuntite.model.valueObjects.login
{
	import com.gazuntite.utils.UtilityFunctions;

	[Bindable]
	public class ClinicBranchDTO
	{
		
		private var _IsDeleted:Boolean;
		private var _IsDirty:Boolean;
		
		private var _ClinicBranchName:String;
		
		private var _License1:int;
		private var _License2:int;
		private var _AvgPatientPerDay:int;
		private var _EntityTypeID:int;
		private var _PracticeTypeID:int;
		private var _ClinicBranchIdSeq:int;
		
		public function ClinicBranchDTO()
		{
			
		}
		
		public function FromXml(x:XML):void
		{
				IsDeleted				= UtilityFunctions.StringToBoolean(x.@IsDeleted);
				IsDirty					= UtilityFunctions.StringToBoolean(x.@IsDeleted);
				
				ClinicBranchName		= x.@ClinicBranchName;
				
				License1				= x.@License1;
				License2				= x.@License2;
				AvgPatientPerDay		= x.@AvgPatientPerDay;
				EntityTypeID			= x.@EntityTypeID;
				PracticeTypeID			= x.@PracticeTypeID;
				ClinicBranchIdSeq		= x.@ClinicBranchIdSeq;
		}
		
		/*public function ToXml():XML
		{
			
		}*/

		public function get ClinicBranchIdSeq():int
		{
			return _ClinicBranchIdSeq;
		}

		public function set ClinicBranchIdSeq(value:int):void
		{
			_ClinicBranchIdSeq = value;
		}

		public function get PracticeTypeID():int
		{
			return _PracticeTypeID;
		}

		public function set PracticeTypeID(value:int):void
		{
			_PracticeTypeID = value;
		}

		public function get EntityTypeID():int
		{
			return _EntityTypeID;
		}

		public function set EntityTypeID(value:int):void
		{
			_EntityTypeID = value;
		}

		public function get AvgPatientPerDay():int
		{
			return _AvgPatientPerDay;
		}

		public function set AvgPatientPerDay(value:int):void
		{
			_AvgPatientPerDay = value;
		}

		public function get License2():int
		{
			return _License2;
		}

		public function set License2(value:int):void
		{
			_License2 = value;
		}

		public function get License1():int
		{
			return _License1;
		}

		public function set License1(value:int):void
		{
			_License1 = value;
		}

		public function get ClinicBranchName():String
		{
			return _ClinicBranchName;
		}

		public function set ClinicBranchName(value:String):void
		{
			_ClinicBranchName = value;
		}

		public function get IsDirty():Boolean
		{
			return _IsDirty;
		}

		public function set IsDirty(value:Boolean):void
		{
			_IsDirty = value;
		}

		public function get IsDeleted():Boolean
		{
			return _IsDeleted;
		}

		public function set IsDeleted(value:Boolean):void
		{
			_IsDeleted = value;
		}

	}
}