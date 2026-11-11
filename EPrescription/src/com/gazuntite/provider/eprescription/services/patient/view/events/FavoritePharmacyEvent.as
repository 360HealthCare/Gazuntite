package com.gazuntite.provider.eprescription.services.patient.view.events
{
	import flash.events.Event;

	public class FavoritePharmacyEvent extends Event
	{
		public var data:Object

		public static const SetPharmacytoFav:String 	= "SetPharmacyFavorit";
		public static const SetPharmacytoUnFav:String 	= "SetPharmacyUnFavorit";
		
		
		public function FavoritePharmacyEvent(type:String,data:Object, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.data = data;
		}
	}
}