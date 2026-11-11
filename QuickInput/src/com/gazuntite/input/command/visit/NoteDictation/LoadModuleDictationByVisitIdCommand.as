package com.gazuntite.input.command.visit.NoteDictation
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.ModuleDictationDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.visit.NoteDictation.LoadModuleDictationByVisitIdDelegate;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class LoadModuleDictationByVisitIdCommand implements Command, IResponder
	{ 
		public function LoadModuleDictationByVisitIdCommand()
		{
		}
		
		private var model : QIModelLocator = QIModelLocator.getInstance();
		
		public function execute(cgEvent:CairngormEvent):void
		{
			if(model.LoggedInUserId)
			{
				var delegate:LoadModuleDictationByVisitIdDelegate = new  LoadModuleDictationByVisitIdDelegate(this);
				
				delegate.LoadModuleDictation( model.VisitID,QIConstants.IsTemplateVisit, model.LoggedInUserSessionID);
			}
		}
		
		public function result( rpcEvent : Object ) : void 
		{
			if(model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				var xml:XML = re.result.ResponseData[0];
				
				if(xml!=null && re.result.@Status == "true")
				{
					var list:XMLList = xml.children();
					if( list != null )
					{
						var DTOList:ArrayCollection = new ArrayCollection();
						for each( var c:XML in list )
						{
							var dto:ModuleDictationDTO = new ModuleDictationDTO();
							dto.FromXML( c );
							DTOList.addItem( dto );
						}
						
						if(model.moduleDictationList.length > 0)
							model.moduleDictationList.removeAll();
						
						model.moduleDictationList = DTOList;
						
						/*if(DTOList.length > 0)
						{*/
						
						if(model.NotesDictationFlag)
							model.checkNotesExsist = true;
						else
							model.NotesDictationFlag = true;
						/*	if(model.checkNotesExsist)
						model.checkNotesExsist = false; // force excute binding
						model.checkNotesExsist = true;*/
						
						/*}*/
						
						
					}
				}
			}
		}
		
		public function fault( rpcEvent : Object ) : void 
		{
			
			var errorStatus:String = "Fault occured in LoadROSCategoryTypesCommand.";
			
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
	}
}