package com.gazuntite.common.dto.assessment.followUp
{
	import com.gazuntite.common.dto.baseDTO.BaseDTO;
	import com.gazuntite.common.dto.baseDTO.GeneralTypeDTO;
	import com.gazuntite.utils.UtilityFunctions;
	

	[Bindable]
	public class FollowUpDTO extends BaseDTO
	{
		private var _FollowUpMethodType:GeneralTypeDTO;
		private var _AgeType:GeneralTypeDTO;
		private var _AgeValueType:GeneralTypeDTO;
		private var _Drug:GeneralTypeDTO;
		private var _LabTest:GeneralTypeDTO;
		private var _AfterInstructionDurationTypeDTO:GeneralTypeDTO;
		private var _ForInstructionDurationTypeDTO:GeneralTypeDTO;
		private var _ServiceTypeDTO:FollowUpServiceTypeDTO;
		
		private var _IsOnCompletion: Boolean;
		private var _IsByDate: Boolean;
		private var _FollowUpDate: String;
		private var _IsLabTestSelected: Boolean;
		private var _IsDrugselected: Boolean;
		private var _IsAcute: Boolean;
		private var _IsChronic: Boolean;
		private var _IsPreventive: Boolean;
		private var _IsAgeSelected: Boolean;
		private var _IsDurationSelected: Boolean;
		private var _IsPRN: Boolean;
		private var _AfterDurationValue: int;
		private var _ForDurationValue: int;
		private var _PatientFollowUpMergeID:int;
		private var _ClinicBranchId:int;
		private var _CreatedByUserTypeID:int;
		private var _ModifiedByUserTypeID:int;
		
		public function FollowUpDTO()
		{
			FollowUpMethodType  = new GeneralTypeDTO();
			AgeType  = new GeneralTypeDTO();
			AgeValueType  = new GeneralTypeDTO();
			AfterInstructionDurationTypeDTO  = new GeneralTypeDTO();
			ForInstructionDurationTypeDTO  = new GeneralTypeDTO();
			ServiceTypeDTO = new FollowUpServiceTypeDTO();
			Drug = new GeneralTypeDTO();
			LabTest = new GeneralTypeDTO();
		}

		public function get LabTest():GeneralTypeDTO
		{
			return _LabTest;
		}

		public function set LabTest(value:GeneralTypeDTO):void
		{
			_LabTest = value;
		}
		
		public function get DrugName():String
		{
			return Drug.Name;
		}
		
		public function get TestName():String
		{
			return LabTest.Name;
		}

		public function get Drug():GeneralTypeDTO
		{
			return _Drug;
		}

		public function set Drug(value:GeneralTypeDTO):void
		{
			_Drug = value;
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

		public function get ClinicBranchId():int
		{
			return _ClinicBranchId;
		}

		public function set ClinicBranchId(value:int):void
		{
			_ClinicBranchId = value;
		}

		public function get PatientFollowUpMergeID():int
		{
			return _PatientFollowUpMergeID;
		}

		public function set PatientFollowUpMergeID(value:int):void
		{
			_PatientFollowUpMergeID = value;
		}

		public function get ServiceTypeDTO():FollowUpServiceTypeDTO
		{
			return _ServiceTypeDTO;
		}

		public function set ServiceTypeDTO(value:FollowUpServiceTypeDTO):void
		{
			_ServiceTypeDTO = value;
		}

		public function get ForInstructionDurationTypeDTO():GeneralTypeDTO
		{
			return _ForInstructionDurationTypeDTO;
		}

		public function set ForInstructionDurationTypeDTO(value:GeneralTypeDTO):void
		{
			_ForInstructionDurationTypeDTO = value;
		}

		public function get ForDurationValue():int
		{
			return _ForDurationValue;
		}

		public function set ForDurationValue(value:int):void
		{
			_ForDurationValue = value;
		}

		public function get AfterDurationValue():int
		{
			return _AfterDurationValue;
		}

		public function set AfterDurationValue(value:int):void
		{
			_AfterDurationValue = value;
		}

		public function get AfterInstructionDurationTypeDTO():GeneralTypeDTO
		{
			return _AfterInstructionDurationTypeDTO;
		}

		public function set AfterInstructionDurationTypeDTO(value:GeneralTypeDTO):void
		{
			_AfterInstructionDurationTypeDTO = value;
		}

		public function get IsPRN():Boolean
		{
			return _IsPRN;
		}

		public function set IsPRN(value:Boolean):void
		{
			_IsPRN = value;
		}

		public function get AgeValueType():GeneralTypeDTO
		{
			return _AgeValueType;
		}

		public function set AgeValueType(value:GeneralTypeDTO):void
		{
			_AgeValueType = value;
		}

		public function get AgeType():GeneralTypeDTO
		{
			return _AgeType;
		}

		public function set AgeType(value:GeneralTypeDTO):void
		{
			_AgeType = value;
		}

		public function get IsDurationSelected():Boolean
		{
			return _IsDurationSelected;
		}

		public function set IsDurationSelected(value:Boolean):void
		{
			_IsDurationSelected = value;
		}

		public function get IsAgeSelected():Boolean
		{
			return _IsAgeSelected;
		}

		public function set IsAgeSelected(value:Boolean):void
		{
			_IsAgeSelected = value;
		}

		public function get IsPreventive():Boolean
		{
			return _IsPreventive;
		}

		public function set IsPreventive(value:Boolean):void
		{
			_IsPreventive = value;
		}

		public function get IsChronic():Boolean
		{
			return _IsChronic;
		}

		public function set IsChronic(value:Boolean):void
		{
			_IsChronic = value;
		}

		public function get IsAcute():Boolean
		{
			return _IsAcute;
		}

		public function set IsAcute(value:Boolean):void
		{
			_IsAcute = value;
		}

		public function get IsDrugselected():Boolean
		{
			return _IsDrugselected;
		}

		public function set IsDrugselected(value:Boolean):void
		{
			_IsDrugselected = value;
		}

		public function get IsLabTestSelected():Boolean
		{
			return _IsLabTestSelected;
		}

		public function set IsLabTestSelected(value:Boolean):void
		{
			_IsLabTestSelected = value;
		}

		public function get FollowUpDate():String
		{
			return _FollowUpDate;
		}

		public function set FollowUpDate(value:String):void
		{
			_FollowUpDate = value;
		}

		public function get IsByDate():Boolean
		{
			return _IsByDate;
		}

		public function set IsByDate(value:Boolean):void
		{
			_IsByDate = value;
		}

		public function get IsOnCompletion():Boolean
		{
			return _IsOnCompletion;
		}

		public function set IsOnCompletion(value:Boolean):void
		{
			_IsOnCompletion = value;
		}

		public function get FollowUpMethodType():GeneralTypeDTO
		{
			return _FollowUpMethodType;
		}

		public function set FollowUpMethodType(value:GeneralTypeDTO):void
		{
			_FollowUpMethodType = value;
		}
		
		public function get FilterFeild():String
		{
			return AgeType.Name;
		}
			
		public override function ToXML():XML
		{
			this.nodeName = "PatientFollowupMergedDTO ";
			
			var x:XML = super.ToXML();
			
			x.@PatientFollowUpMergeID     =this.PatientFollowUpMergeID;
			x.@IsByDate     			 =this.IsByDate;
			x.@IsOnCompletion     		 =this.IsOnCompletion;
			x.@IsLabTestSelected     	 =this.IsLabTestSelected;
			x.@IsDrugselected     		 =this.IsDrugselected;
			x.@LabTestID     			 =this.LabTest.ID;
			x.@DrugID     				 =this.Drug.ID;
			x.@AfterDurationValue     	 =this.AfterDurationValue;
			x.@ForDurationValue    		  =this.ForDurationValue;
			x.@IsAgeSelected     		 =this.IsAgeSelected;
			x.@IsDurationSelected     	 =this.IsDurationSelected;
			x.@IsChronic     			 =this.IsChronic;
			x.@IsPreventive     		 =this.IsPreventive;
			x.@IsAcute      			=this.IsAcute;
			x.@IsPRN     				 =this.IsPRN;
			x.@ClinicBranchId     		 =this.ClinicBranchId;
			x.@CreatedByUserTypeID      =this.CreatedByUserTypeID;
			x.@ModifiedByUserTypeID      =this.ModifiedByUserTypeID;
			x.@FollowUpDate      =this.FollowUpDate;
			
			FollowUpMethodType.NodeName = "FollowUpMethodType";
			x.appendChild(FollowUpMethodType.ToXML());
			
			if (!AgeType)
				AgeType = new GeneralTypeDTO();
			
			AgeType.NodeName = "AgeTypeDTO";
			x.appendChild(AgeType.ToXML());
			
			if (!AgeValueType)
				AgeValueType = new GeneralTypeDTO();
			
			AgeValueType.NodeName = "AgeValueTypeDTO";
			x.appendChild(AgeValueType.ToXML());
			
			x.appendChild(ServiceTypeDTO.ToXML());
			
			if (!AfterInstructionDurationTypeDTO)
				AfterInstructionDurationTypeDTO = new GeneralTypeDTO();
			
			AfterInstructionDurationTypeDTO.NodeName = "AfterInstructionDurationTypeDTO";
			x.appendChild(AfterInstructionDurationTypeDTO.ToXML());
			
			if (!ForInstructionDurationTypeDTO)
				ForInstructionDurationTypeDTO = new GeneralTypeDTO();
			
			ForInstructionDurationTypeDTO.NodeName = "ForInstructionDurationTypeDTO";
			x.appendChild(ForInstructionDurationTypeDTO.ToXML());
			
			return x;
		}
	
		public override  function FromXML(x:XML):void
		{
			super.FromXML(x);
			
			this.PatientFollowUpMergeID = x.@PatientFollowUpMergeID;
			
			this.IsByDate = UtilityFunctions.StringToBoolean(x.@IsByDate);
			this.IsOnCompletion = UtilityFunctions.StringToBoolean( x.@IsOnCompletion);
			
			this.IsLabTestSelected = UtilityFunctions.StringToBoolean(x.@IsLabTestSelected);
			this.IsDrugselected = UtilityFunctions.StringToBoolean(x.@IsDrugselected);
			
			this.LabTest.ID = x.@LabTestID;
			this.LabTest.Name = x.@LabTestName;
			this.Drug.ID = x.@DrugID;
			this.FollowUpDate = x.@FollowUpDate;
			
			this.AfterDurationValue = x.@AfterDurationValue;
			this.ForDurationValue = x.@ForDurationValue;
			this.IsAgeSelected = UtilityFunctions.StringToBoolean(x.@IsAgeSelected);
			this.IsDurationSelected = UtilityFunctions.StringToBoolean(x.@IsDurationSelected);
			this.IsPRN = UtilityFunctions.StringToBoolean(x.@IsPRN);
			
			this.IsChronic = UtilityFunctions.StringToBoolean(x.@IsChronic);
			this.IsPreventive = UtilityFunctions.StringToBoolean(x.@IsPreventive);
			this.IsAcute = UtilityFunctions.StringToBoolean(x.@IsAcute);
			
			this.ClinicBranchId = x.@ClinicBranchId;
			this.CreatedByUserTypeID = x.@CreatedByUserTypeID;
			this.ModifiedByUserTypeID = x.@ModifiedByUserTypeID;
			
			if(x.FollowUpMethodType[0])
			this.FollowUpMethodType.FromXML(x.FollowUpMethodType[0]);
			
			if(x.AgeTypeDTO[0])
			this.AgeType.FromXML(x.AgeTypeDTO[0]);
			
			if(x.AgeValueTypeDTO[0])
			this.AgeValueType.FromXML(x.AgeValueTypeDTO[0]);
			
			if(x.objServiceTypeDTO[0])
			this.ServiceTypeDTO.FromXML(x.objServiceTypeDTO[0]);
			
			if (x.AfterInstructionDurationTypeDTO[0])
				this.AfterInstructionDurationTypeDTO.FromXML(x.AfterInstructionDurationTypeDTO[0]);
			
			if (x.ForInstructionDurationTypeDTO[0])
				this.ForInstructionDurationTypeDTO.FromXML(x.ForInstructionDurationTypeDTO[0]);
		}
	}
}