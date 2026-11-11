package com.gazuntite.common.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.delegate.LoadPatientMedDelegate;
	import com.gazuntite.common.dto.MedRXDTO;
	import com.gazuntite.common.event.LoadPatientMedEvent;
	
	import flash.display.Sprite;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.managers.CursorManager;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	public class LoadPatientMedCommand  implements Command 
	{
		private var responder:Responder;
		private var delegate:LoadPatientMedDelegate;
		private var LE:LoadPatientMedEvent;
		
		private var callBack			: Function;
		
		public function execute( cgEvent:CairngormEvent ) : void {
			
			responder = new Responder(result, fault);				
			delegate  = new LoadPatientMedDelegate( responder );			
			
			var LE:LoadPatientMedEvent = cgEvent as LoadPatientMedEvent;
			
			callBack = LE.resultHandlerFunction;
			CursorManager.setBusyCursor();
			delegate.GetPatientPrescription(LE.data,LE.criteria , LE.encounterId, LE.gaxenPatientId);
		}
		
		public function result( rpcEvent : ResultEvent ) : void 
		{	
			 var patientMedAC:ArrayCollection 		= new ArrayCollection();
			 var patientChronicMedAC:ArrayCollection = new ArrayCollection();
			
			 var patientMedAC_inactive:ArrayCollection 		= new ArrayCollection();
			 var patientChronicMedAC_inactive:ArrayCollection = new ArrayCollection();
			
			var response:XML = XML(rpcEvent.message.body.toString());
			response = removeDefaultNamespaceFromXML(response);
			
			for(var i:int = 0; i < response.PMedication.Messages.length(); i++)
			{
				var Obj:MedRXDTO = new MedRXDTO();
				Obj.FromXml(response.PMedication.Messages[i] ,(i + 1).toString());
				
				
				if(!Obj.isActive)
				{
					patientMedAC_inactive.addItem(Obj);
				}
				else
				{
					patientMedAC.addItem(Obj);	
				}
			}
			
			for(var i:int=0; i<response.PChronicMedication.Messages.length(); i++)
			{
				var Obj:MedRXDTO = new MedRXDTO();
				Obj.FromXml(response.PChronicMedication.Messages[i] ,(i + 1).toString());
				
				/*var drugName:String 	= response.PChronicMedication.Messages[i].@DrugName.toString();
				var dose:String 		= response.PChronicMedication.Messages[i].@Dose.toString();
				var quantity:String 	= response.PChronicMedication.Messages[i].@Quantity.toString(); 
				var ndc:String 			= response.PChronicMedication.Messages[i].@NDCCODE.toString(); 
				var isPRN:String 		= response.PChronicMedication.Messages[i].@isPRN.toString();
				var Refill:String 		= response.PChronicMedication.Messages[i].@Refill.toString();
				
				var Obj:Object = new Object();
				
				Obj.Type 		= response.PChronicMedication.Messages[i].@Type.toString();
				Obj.VisitDate	= response.PChronicMedication.Messages[i].@VisitDate.toString();
				Obj.drugName 	= drugName;
				
				Obj.SIG			= response.PChronicMedication.Messages[i].@SIG.toString();										
				Obj.Dose 		= dose;
				Obj.Quantity 	= quantity + ", "+response.PChronicMedication.Messages[i].@QuantityForm.toString();;
				
				Obj.Status	 	= response.PChronicMedication.Messages[i].@MessageStatus.toString();
				Obj.NDCCODE 	= ndc;
				Obj.Refill 		= Refill;
				Obj.isPRN 		= isPRN;
				
				Obj.SerialNo	= i + 1;
				Obj.inEditMode = false;*/
				
				/*if(!Obj.isActive)
				{
					patientChronicMedAC_inactive.addItem(Obj);
				}
				else
				{*/
					patientChronicMedAC.addItem(Obj);
				/*}*/
			}
			
			if( null != callBack )
			{
				callBack(patientMedAC, patientChronicMedAC, patientMedAC_inactive, patientChronicMedAC_inactive);
			}
			
			CursorManager.removeBusyCursor();
		}
		
		private function removeDefaultNamespaceFromXML(xml:XML):XML
		{
			var rawXMLString:String = xml.toXMLString();
			
			/* Define the regex pattern to remove the default namespace from the 
			String representation of the XML result. */
			var xmlnsPattern:RegExp = 
				new RegExp("xmlns=[^\"]*\"[^\"]*\"", "gi");
			
			/* Replace the default namespace from the String representation of the 
			result XML with an empty string. */
			var cleanXMLString:String = rawXMLString.replace(xmlnsPattern, "");
			
			// Create a new XML Object from the String just created
			return new XML(cleanXMLString);
		}
		public function fault( rpcEvent : Object ) : void 
		{
			CursorManager.removeBusyCursor();
			Alert.show("Fault occured in LoadPatientMedCommand.\n"+rpcEvent.toString(), 'Error occured on server', 4, FlexGlobals.topLevelApplication.mainContainer as Sprite );
		}
	}
}