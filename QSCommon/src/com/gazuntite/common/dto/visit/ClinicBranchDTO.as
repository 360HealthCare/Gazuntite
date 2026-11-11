package com.gazuntite.common.dto.visit
{
	import com.gazuntite.common.dto.baseDTO.BaseDTO;
	import com.gazuntite.common.util.xml.XmlUtils;

	[Bindable]
	public class ClinicBranchDTO extends BaseDTO
	{
		private var _ID:int, _License1:int, _License2:int, _AvgPatientPerDay:int, _EntityTypeID:int, _PracticeTypeID:int;
		public function ClinicBranchDTO()
		{
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

		public function get ID():int
		{
			return _ID;
		}

		public function set ID(value:int):void
		{
			_ID = value;
		}
		
		public override function ToXML():XML
		{
			this.nodeName = "ClinicBranch";
			var x:XML = super.ToXML();
			
			
			x.@["IsDeleted"] 			= IsDeleted;
			x.@["IsDirty"] 				= IsDirty;
			x.@["ClinicBranchIdSeq"] 	= ID;			
			x.@["License1"] 			= License1;	
			x.@["License2"] 			= License2;	
			x.@["AvgPatientPerDay"] 	= AvgPatientPerDay;	
			x.@["EntityTypeID"] 		= EntityTypeID;	
			x.@["PracticeTypeID"] 		= PracticeTypeID;	
			
			return x;
		}
		
		public override function  FromXML(x:XML):void
		{
			IsDeleted 		= x.@["IsDeleted"];
			IsDirty			= x.@["IsDirty"];
			ID				= x.@["ClinicBranchIdSeq"];			
			License1		= x.@["License1"];	
			License2		= x.@["License2"];	
			AvgPatientPerDay= x.@["AvgPatientPerDay"];	
			EntityTypeID	= x.@["EntityTypeID"];	
			PracticeTypeID	= x.@["PracticeTypeID"];			
		}


	}
}