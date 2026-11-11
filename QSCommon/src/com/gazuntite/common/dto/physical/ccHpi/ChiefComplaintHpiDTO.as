package com.gazuntite.common.dto.physical.ccHpi
{
	import com.gazuntite.common.dto.baseDTO.BaseDTO;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.utils.UtilityFunctions;

	[Bindable]
	public class ChiefComplaintHpiDTO extends BaseDTO
	{
		private var _HPIFields:HPIDetailsDTO;
		private var _ChiefComplaint:String;
		private var _PatientHPIID:int;
		private var _CreatedByUserTypeID:int;
		private var _ModifiedByUserTypeID:int;
		private var _ClinicBranchID:int;
		
		
		
		public function ChiefComplaintHpiDTO()
		{
			
		}
		
		/*public function set nodename(value:String):void
		{
			nodeName = value;
		}*/
		
		public function get ClinicBranchID():int
		{
			return _ClinicBranchID;
		}
		
		public function get label():String
		{
			var returnvalue:String = '';
			if (!this)
				return '';
			
			
			if (!this.ChiefComplaint)
			{
				if (!this.HPIFields)
					return '';
				
				returnvalue += this.HPIFields.Symptom;
			}
				
			else if (this.ChiefComplaint.length < 1)
			{
				if (!this.HPIFields)
					return '';
				
				returnvalue += this.HPIFields.Symptom;
			}
				
			else 
			{
				returnvalue += this.ChiefComplaint;
			}		
			
			return returnvalue;
		}

		public function set ClinicBranchID(value:int):void
		{
			_ClinicBranchID = value;
		}

		public function get ModifiedByUserTypeID():int
		{
			return _ModifiedByUserTypeID;
		}

		public function set ModifiedByUserTypeID(value:int):void
		{
			_ModifiedByUserTypeID = value;
		}

		public function get CreatedByUserTypeID():int
		{
			return _CreatedByUserTypeID;
		}

		public function set CreatedByUserTypeID(value:int):void
		{
			_CreatedByUserTypeID = value;
		}

		public function get PatientHPIID():int
		{
			return _PatientHPIID;
		}

		public function set PatientHPIID(value:int):void
		{
			_PatientHPIID = value;
		}

		public function get ChiefComplaint():String
		{
			return _ChiefComplaint;
		}

		public function set ChiefComplaint(value:String):void
		{
			_ChiefComplaint = value;
		}

		public function get HPIFields():HPIDetailsDTO
		{
			return _HPIFields;
		}

		public function set HPIFields(value:HPIDetailsDTO):void
		{
			_HPIFields = value;
		}
		
		public function get FilterFeild():String
		{
			return ChiefComplaint;
		}
		
		public override function FromXML(x:XML):void
		{
			super.FromXML(x);
			this.HPIFields = new HPIDetailsDTO();
			this.HPIFields.FromXML(x.Fields[0]);
			
			this.ChiefComplaint 		= x.@ChiefComplaint;
			this.PatientHPIID			= x.@PatientHPIID;
			this.CreatedByUserTypeID 	= x.@CreatedByUserTypeID;
			this.ModifiedByUserTypeID 	= x.@ModifiedByUserTypeID;
			this.ClinicBranchID 		= x.@ClinicBranchID;
		}
		
		public override function ToXML():XML
		{
				
			this.nodeName = "HPI_CCDTO";
			var x:XML = super.ToXML();
			
			
			x.@ChiefComplaint 			=this.ChiefComplaint ; 
			x.@PatientHPIID 			=this.PatientHPIID;
			x.@CreatedByUserTypeID 		=this.CreatedByUserTypeID;	
			x.@ModifiedByUserTypeID		=this.ModifiedByUserTypeID;	
			x.@ClinicBranchID		=this.ClinicBranchID;	
			
			//this.HPIFields = new HPIDetailsDTO();
		
			x.appendChild( this.HPIFields.ToXML() );
			
			return x;
		}
		

	}
}