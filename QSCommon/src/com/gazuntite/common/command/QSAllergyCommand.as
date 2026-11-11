package com.gazuntite.common.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.delegate.QSAllergyDelegate;
	import com.gazuntite.common.dto.pmh.Allergy.AllergyDTO;
	import com.gazuntite.common.event.QSAllergyEvent;
	import com.gazuntite.utils.UtilityFunctions;
	
	import flash.display.Sprite;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.managers.CursorManager;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ObjectProxy;
	
	public class QSAllergyCommand implements Command
	{
		private var responder:Responder;
		private var delegate:QSAllergyDelegate;		
		private var callBack			: Function;
		private var parameterType		: int;
		
		public function execute(cgEvent:CairngormEvent):void
		{
			responder = new Responder(onSuccess, onError);				
			delegate  = new QSAllergyDelegate( responder );			
			
			var LE:QSAllergyEvent = cgEvent as QSAllergyEvent;
			
			callBack = LE.callBack
			parameterType = LE.parameterType;	
			delegate.GetAllergiesList(LE.parameterType, LE.allergyParameter);
		}
		
		private function onSuccess(event:ResultEvent):void
		{			
			var re:ResultEvent = event as ResultEvent;
			var op:ObjectProxy = (re.result as ObjectProxy);
			var response:ObjectProxy;
			var dtoListToReturn:ArrayCollection = new ArrayCollection();
			var allergyList:ArrayCollection = new ArrayCollection();//allergy list after search
			
			if(parameterType == 1)
			{			
				if(op)
					response  =  op.Allergies.AllergyClass ;
				
				if(response != null && response.AllergyClass.length)
				{
					allergyList = response.AllergyClass;
				}
				else if(response != null && response.AllergyClass)
				{
					allergyList.addItem(response.AllergyClass);
				}
				CursorManager.removeBusyCursor();		
			}
			else if(parameterType == 2)
			{
				if(op)
					response  =  op.LoadAllergies.PatientAllergies;						
				
				var list:ArrayCollection = new ArrayCollection();
				
				if(response != null && response.PatientAllergies.length)
				{
					list = response.PatientAllergies;
				}
				else if(response != null && response.PatientAllergies)
				{
					list.addItem(response.PatientAllergies);
				}
				
				if(dtoListToReturn != null)
					dtoListToReturn.removeAll();
				/*else
					dtoListToReturn = new ArrayCollection();*/
				
				if(list.length > 0)
				{					
					for (var i:int = 0; i < list.length; i++) 
					{
						var dto:ObjectProxy = list[i] as ObjectProxy;
						var allergyDto:AllergyDTO = new AllergyDTO();
						
						allergyDto.AllergyName = dto.AllergyName;
						allergyDto.DictationID = dto.DictationID;
						allergyDto.GaxenAllergyID = dto.GaxenAllergyID;
						allergyDto.GaxenPatientID = dto.GaxenPatientID;
						allergyDto.isActive = dto.isActive;
						allergyDto.isNKDA = dto.isNKDA;
						allergyDto.modDictationID = dto.modDictationID;
						allergyDto.modNotesID = dto.modNotesID;
						allergyDto.Note= dto.Note;						
						allergyDto.OnSet = UtilityFunctions.FormatDate(String(dto.OnSet).substring(0,10),"MM/DD/YYYY");						
						allergyDto.Reaction = dto.Reaction;
						allergyDto.VisitDate = dto.VisitDate;
						allergyDto.EncounterID = dto.EncounterID;
						allergyDto.formatData();
						
						if (allergyDto.isNKDA)
							allergyDto.isActive = false;
						
						dtoListToReturn.addItem(allergyDto);	
					}			
				}				
				
				CursorManager.removeBusyCursor();	
			}
			
			
			if( null != callBack )
			{
				if(parameterType == 1)
					callBack(allergyList);
				else if(parameterType == 3 || parameterType == 4)
					callBack(new XML(event.message.body.toString()) );			
				else
					callBack(dtoListToReturn);
			}
			CursorManager.removeBusyCursor();	
		}	
		
		private function onError(event:FaultEvent):void
		{
			CursorManager.removeBusyCursor();
			Alert.show("Received In QSAllergyCommand.\n" + event.toString(), 'Error occured on server', 4, FlexGlobals.topLevelApplication.mainContainer as Sprite );
		}
	}
}