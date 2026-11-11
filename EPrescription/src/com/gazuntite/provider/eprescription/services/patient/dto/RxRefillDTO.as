package com.gazuntite.provider.eprescription.services.patient.dto
{
	import com.gazuntite.provider.eprescription.services.patient.dto.PendingRefillRequestDTO;

	[Bindable]
	public class RxRefillDTO
	{
		public function RxRefillDTO()
		{
			pendingRefillRequestDTO = new PendingRefillRequestDTO();
		}
		private var _pendingRefillRequestDTO:PendingRefillRequestDTO;
		
		
		public function FromXML(x:XML):void
		{
			pendingRefillRequestDTO.FromXML(x);
			
		}

		public function get pendingRefillRequestDTO():PendingRefillRequestDTO
		{
			return _pendingRefillRequestDTO;
		}

		public function set pendingRefillRequestDTO(value:PendingRefillRequestDTO):void
		{
			_pendingRefillRequestDTO = value;
		}

	}
}