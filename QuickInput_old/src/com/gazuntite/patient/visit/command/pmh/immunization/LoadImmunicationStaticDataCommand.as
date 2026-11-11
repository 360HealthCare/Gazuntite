package com.gazuntite.patient.visit.command.pmh.immunization
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.common.GeneralLabelDTO;
	import com.gazuntite.common.dto.common.GeneralTypeDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.patient.visit.delegate.pmh.immunization.LoadImmunicationStaticDataDelegate;
	import com.gazuntite.patient.visit.event.pmh.immunization.LoadImmunicationStaticDataEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.patient.visit.utils.QIConstants;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class LoadImmunicationStaticDataCommand implements Command, IResponder
	{
		private var model : QIModelLocator = QIModelLocator.getInstance();
		private var LE:LoadImmunicationStaticDataEvent;
		
		public function execute(event:CairngormEvent):void
		{
			if(model.LoggedInUserId)
			{
				LE = event as LoadImmunicationStaticDataEvent;
				var delegate:LoadImmunicationStaticDataDelegate = new  LoadImmunicationStaticDataDelegate(this);
				delegate.LoadImmunicationStaticData(LE.searchCritera, model.LoggedInUserSelectedBranchId, LE.subSectionName, model.LoggedInUserSessionID);
			}
		}
		
		public function result(rpcEvent:Object):void
		{
			if(model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				if(re.result!=null)
				{
					trace(re.result.toXMLString());
					
					if(re.result.@Status=="true")
					{
						var xml:XML = re.result as XML;
						var typeList:ArrayCollection
						if(xml!=null)
						{
							switch ( LE.subSectionName ) 
							{
								case  QIConstants.TYPE_SELECT_TYPE :
									var xList:XMLList = xml.ImmunizationType.ImmunizationTypeDTO;
									typeList = new ArrayCollection();
									
									for each(var x:XML in xList )
									{
										var dto:GeneralTypeDTO = new GeneralTypeDTO();
										dto.FromXML( x );
										typeList.addItem( dto );
									}
									
									model.GeneralTypeDTOListForImmunizationType = typeList;
									break;
								case QIConstants.DOSE_SELECT_TYPE:
									
									model.GeneralLabelDTOListForDose = getLabelDTOList( xml.ImmunizationDose.string );
										
									break;
								case QIConstants.MANUFACTURER_SELECT_TYPE:
									
									model.GeneralLabelDTOListForManufacturer = getLabelDTOList( xml.ImmunizationManufacturer.string );
									
									break;
								case QIConstants.SERIERS_SELECT_TYPE:
									
									model.GeneralLabelDTOListForSeries = getLabelDTOList( xml.ImmunizationSeriers.string );
									
									break;
								case QIConstants.REFUSAL_SELECT_TYPE:
									
									model.GeneralLabelDTOListForRefusal = getLabelDTOList( xml.ImmunizationRefusal.string );
									
									break;
								case QIConstants.ROUT_SELECT_TYPE:
									
									model.GeneralLabelDTOListForRoute = getLabelDTOList( xml.ImmunizationRout.string );
									
									break;
								case QIConstants.SITE_SELECT_TYPE:
									
									model.GeneralLabelDTOListForSite = getLabelDTOList( xml.ImmunizationSite.string );
									
									break;
								case QIConstants.LOT_SELECT_TYPE:
									
									model.GeneralLabelDTOListForLot = getLabelDTOList( xml.ImmunizationLot.string );
									
									break;
							}
							
						}
					}
					else
					{
						UtilityFunctions.ShowMessage("LoadImmunicationStaticData \n No data returned from service.","Info");
					}
				}
			}
			else
			{
				UtilityFunctions.ShowMessage("LoadImmunicationStaticData \n Service didnot respond.", "Info");
			}
		}
		
		private function getLabelDTOList(xList:XMLList):ArrayCollection
		{
			var typeList:ArrayCollection = new ArrayCollection();
			
			for each(var x:XML in xList )
			{
				var dto:GeneralLabelDTO = new GeneralLabelDTO();
				dto.FromXML( x );
				typeList.addItem( dto );
			}
			
			return typeList;
		}
		
		public function fault(rpcEvent:Object):void
		{
			var errorStatus:String = "Fault occured in LoadImmunicationStaticDataCommand.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
		}
	}
}