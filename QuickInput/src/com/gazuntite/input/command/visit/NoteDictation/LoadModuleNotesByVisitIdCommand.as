package com.gazuntite.input.command.visit.NoteDictation
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.ModuleNoteDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.delegate.visit.NoteDictation.LoadModuleNotesByVisitIdDelegate;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class LoadModuleNotesByVisitIdCommand implements Command, IResponder
	{
		
		public function LoadModuleNotesByVisitIdCommand()
		{
		}
		private var model : QIModelLocator = QIModelLocator.getInstance();
		
		public function execute(cgEvent:CairngormEvent):void
		{
			if(model.LoggedInUserId)
			{
				var delegate:LoadModuleNotesByVisitIdDelegate = new  LoadModuleNotesByVisitIdDelegate(this);
				
				delegate.LoadModuleNotes( model.VisitID, QIConstants.IsTemplateVisit, model.LoggedInUserSessionID);
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
							var dto:ModuleNoteDTO = new ModuleNoteDTO();
							dto.FromXML( c );
							DTOList.addItem( dto );
						}
						if(model.moduleNotes.length > 0)
							model.moduleNotes.removeAll();
						
						model.moduleNotes = DTOList;
						
						/*if(DTOList.length > 0)
						{*/
						
						if(model.NotesDictationFlag)
							model.checkNotesExsist = true;
						else
							model.NotesDictationFlag = true;
						
						/*if(model.checkNotesExsist)
						model.checkNotesExsist = false; // force excute binding
						model.checkNotesExsist = true;*/
						
						/*if(model.NotesDictationFlag)
						{
						if(model.checkNotesExsist)
						model.checkNotesExsist = false; // force excute binding
						model.checkNotesExsist = true;
						}
						else
						model.NotesDictationFlag = true;*/
						
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