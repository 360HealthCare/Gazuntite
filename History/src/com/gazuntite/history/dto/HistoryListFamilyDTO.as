package com.gazuntite.history.dto
{
	public class HistoryListFamilyDTO
	{
		private var _ID:int 							= 0;
		private var _DiagnosisId:int 					= 0;
		private var _IsActive:Boolean					=true;
		private var _DictationID:String					="00000000-0000-0000-0000-000000000000";
		private var _ReletionshipTypeID:int 			=66 ;
		private var _ReletionshipTypeName:String		="Brother";
		
		/*<DiseaseList ID="0" DiagnosisId="0" IsActive="True" DictationID="00000000-0000-0000-0000-000000000000" ReletionshipTypeID="66" ReletionshipTypeName="Brother"/>*/
		
		
		public function HistoryListFamilyDTO()
		{
		}

		public function get ReletionshipTypeName():String
		{
			return _ReletionshipTypeName;
		}

		public function set ReletionshipTypeName(value:String):void
		{
			_ReletionshipTypeName = value;
		}

		public function get ReletionshipTypeID():int
		{
			return _ReletionshipTypeID;
		}

		public function set ReletionshipTypeID(value:int):void
		{
			_ReletionshipTypeID = value;
		}

		public function get DictationID():String
		{
			return _DictationID;
		}

		public function set DictationID(value:String):void
		{
			_DictationID = value;
		}

		public function get IsActive():Boolean
		{
			return _IsActive;
		}

		public function set IsActive(value:Boolean):void
		{
			_IsActive = value;
		}

		public function get DiagnosisId():int
		{
			return _DiagnosisId;
		}

		public function set DiagnosisId(value:int):void
		{
			_DiagnosisId = value;
		}

		public function get ID():int
		{
			return _ID;
		}

		public function set ID(value:int):void
		{
			_ID = value;
		}

	}
}