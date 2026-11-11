package com.gazuntite.provider.live.services.billing.superBill.view.viewModel
{
	import com.gazuntite.common.dto.typeDTO.CPTMedicalTypeDTO;
	import com.gazuntite.provider.live.services.billing.superBill.dto.SuperBillProcedureInfoDTO;
	import com.gazuntite.provider.live.services.billing.superBill.model.SuperBillModelLocator;
	
	import mx.collections.ArrayCollection;

	public class SuperBillViewModel
	{
		public static const PROCEDURE_CODE:int = 0;
		public static const PROCEDURE_NAME:int = 1;
		
		protected static var instance:SuperBillViewModel;
		
		public var model:SuperBillModelLocator = SuperBillModelLocator.getInstance();
		
		public function SuperBillViewModel(singleton:Number)
		{
		}
		
		public static function getInstance():SuperBillViewModel
		{
			if (instance == null)
			{
				instance = new SuperBillViewModel(1);
			}
			
			return instance;
		}
				
		public function clearProcedure():void
		{
			if (model.procedureDTOList)
				model.procedureDTOList.removeAll();
			else
				model.procedureDTOList = new ArrayCollection();
					
		}
		
		private function hasDuplicateValues(arrCol:ArrayCollection, dto:CPTMedicalTypeDTO):Boolean
		{
			if (!arrCol)
				return false;
			
			for (var j:uint = 0; j < arrCol.length; j++)
			{
				var procedureDTO:SuperBillProcedureInfoDTO = arrCol[j] as SuperBillProcedureInfoDTO;
				
				if (dto.ProcedureCode == procedureDTO.ProcedureCode)
					return true;
			}
			
			return false;
		}
	}
}