package com.gazuntite.provider.search.services.provider.view.event
{
	import flash.events.Event;

	public class ListVieClickEvent extends Event
	{
		public static const LOAD_CLINIC_USER_DETAILS_EVENT:String = "LoadClinicUserDetailsEvent";
		public var branchId			:int;
		public var isAvaliable		:Boolean;
		public var userId			:int;
		public var callBack			: Function;
		public var providerName		: String;
		public function ListVieClickEvent(userId:int,branchId:int,callBack:Function,providerAvaliable:Boolean,providerName:String)
		{
			super(LOAD_CLINIC_USER_DETAILS_EVENT, true, false);
			this.branchId=branchId;
			this.userId = userId;
			this.callBack = callBack;
			this.isAvaliable = providerAvaliable;
			this.providerName = providerName;
		}
	}
}