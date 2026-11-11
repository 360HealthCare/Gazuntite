package com.gazuntite.common.view.components.reviewofsystem
{
	import mx.collections.ArrayCollection;

	[Bindable]
	public interface IReviewOfSystemItem
	{
		function get label():String;
		
		function get Note():String;
		function set Note(value:String):void
		
		function get IsNormal():String;
		function set IsNormal(value:String):void;
		
		function get IsAbNormal():String;
		function set IsAbNormal(value:String):void;
		
		function get children():ArrayCollection;
		function set children(value:ArrayCollection):void;
		
		function get IsDirty():Boolean;
		function set IsDirty(value:Boolean):void;
		
		function get DictationID():String
		function set DictationID(value:String):void
	}
}