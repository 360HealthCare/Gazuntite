/**
 * Auther: Ayesha Manzoor
 * used by E-Lab search call for pending orders and results
 * 
 * if <property>IsSearchResultCriteria</Property> is true then this filter criteria is fror loading results otherwise it would load pending orders
 * if <Property>FieldID</Property> contains value other than 0 then service will search on the basis of FieldID and SearchTerm
 * 	and will ignore all other fields.
 * otherwise, search filter will be applied according to values given in <property>ToDate</property>,<property>FromDate</property>
 * <property>MethodTypeID</property>, <property>LabTypeID</property>, <property>FirstName</property>, <property>LastName</property>
 * <property>SSN</property>, <property>DOB</property>, <property>OtherID</property>, <property>GazuntiteID</property>
 * */
package com.gazuntite.provider.live.services.elab.dto
{
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.utils.UtilityFunctions;

	public class ELabFilterCriteriaDTO
	{
		private var _ToDate:String;
		private var _FromDate:String;
		private var _MethodTypeID:String;
		private var _LabTypeID:String;
		private var _FieldID:int;
		private var _SearchTerm:String;
		private var _PageNo:int;
		private var _ClinicBranchID:int;
		private var _ProviderID:int;
		private var _ProviderTypeID:int;
		private var _PatientID:int;
		private var _LoadType:int;
		
		public function ELabFilterCriteriaDTO()
		{
		}

		public function get ToDate():String
		{
			return _ToDate;
		}

		public function set ToDate(value:String):void
		{
			_ToDate = value;
		}

		public function get FromDate():String
		{
			return _FromDate;
		}

		public function set FromDate(value:String):void
		{
			_FromDate = value;
		}

		public function get MethodTypeID():String
		{
			return _MethodTypeID;
		}

		public function set MethodTypeID(value:String):void
		{
			_MethodTypeID = value;
		}

		public function get LabTypeID():String
		{
			return _LabTypeID;
		}

		public function set LabTypeID(value:String):void
		{
			_LabTypeID = value;
		}

		public function get FieldID():int
		{
			return _FieldID;
		}

		public function set FieldID(value:int):void
		{
			_FieldID = value;
		}

		public function get SearchTerm():String
		{
			return _SearchTerm;
		}

		public function set SearchTerm(value:String):void
		{
			_SearchTerm = value;
		}

		public function get PageNo():int
		{
			return _PageNo;
		}

		public function set PageNo(value:int):void
		{
			_PageNo = value;
		}

		public function get ClinicBranchID():int
		{
			return _ClinicBranchID;
		}

		public function set ClinicBranchID(value:int):void
		{
			_ClinicBranchID = value;
		}

		public function get ProviderID():int
		{
			return _ProviderID;
		}

		public function set ProviderID(value:int):void
		{
			_ProviderID = value;
		}

		public function get ProviderTypeID():int
		{
			return _ProviderTypeID;
		}

		public function set ProviderTypeID(value:int):void
		{
			_ProviderTypeID = value;
		}

		public function get PatientID():int
		{
			return _PatientID;
		}

		public function set PatientID(value:int):void
		{
			_PatientID = value;
		}
		
		public function get LoadType():int
		{
			return _LoadType;
		}
		
		public function set LoadType(value:int):void
		{
			_LoadType = value;
		}

		public function ToXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName("ELabFilterCriteria");
			
			x.@["ToDate"] = ToDate;
			x.@["FromDate"] = FromDate;
			x.@["MethodTypeID"] = MethodTypeID;
			x.@["LabTypeID"] = LabTypeID;
			x.@["FieldID"] = FieldID;
			x.@["SearchTerm"] = SearchTerm;
			x.@["PageNo"] = PageNo;
			x.@["ClinicBranchID"] = ClinicBranchID;
			x.@["ProviderId"] = ProviderID;
			x.@["UserTypeId"] = ProviderTypeID;
			x.@["PatientID"] = PatientID;
			x.@["LoadType"] = LoadType;
			
			return x;
		}
	}
}