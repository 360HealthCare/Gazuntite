package com.gazuntite.input.command.visit.visit
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.delegate.visit.visit.LoadReviewHistroyDelegate;
	import com.gazuntite.input.event.visit.visit.LoadReviewHistroyEvent;
	import com.gazuntite.input.model.QIModelLocator;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class LoadReviewHistroyCommand  implements Command
	{
		private var reponder			: Responder ;
		private var delegate			:LoadReviewHistroyDelegate;
		private var LE					:LoadReviewHistroyEvent;
		private var callBackFunction	:Function;
		private var model:QIModelLocator = QIModelLocator.getInstance();
		public function execute(cgEvent:CairngormEvent):void
		{
			reponder = new Responder(onSuccess,onFault);
			delegate = new LoadReviewHistroyDelegate(reponder);
			LE		 = cgEvent as LoadReviewHistroyEvent;
			this.callBackFunction = LE.callBackFunction;
			delegate.LoadHistroy(LE.SessionId,LE.VisitId,LE.ProviderId);
			
		}
		
		private function onSuccess(successEvent:ResultEvent):void
		{   
			//model.reviewHistroy = new ReviewAllXML();
			var loadhistroyxml	:XML = successEvent.result as XML ;
			var xmlList:XMLList	= loadhistroyxml.Sections;
			var xml:XML= xmlList[0];
			/*if(xml != null)
				model.reviewHistroy.fromXML(xml);*/
			
			if(this.callBackFunction!= null)
				this.callBackFunction();
		}
		
		private function onFault(faultEvent:FaultEvent):void
		{
			Alert.show("Receieved in LoadReviewHistroyCommand"+ faultEvent.toString());
		}
	}
}