package com.gazuntite.common.dto
{
	import com.gazuntite.common.util.QSConstants;

	[Bindable]
	public class AssociatedVisit
	{
		private var m_VisitDate:Date;
		private var m_ID:int;
		
		public function AssociatedVisit()
		{
			VisitDate = QSConstants.NULL_DATE;
			ID   = 0;
		}

		public function get VisitDate():Date
		{
			return m_VisitDate;
		}

		public function set VisitDate(value:Date):void
		{
			m_VisitDate = value;
		}

		public function get ID():int
		{
			return m_ID;
		}

		public function set ID(value:int):void
		{
			m_ID = value;
		}
	}
}