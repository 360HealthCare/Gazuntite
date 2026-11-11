package com.gazuntite.patient.visit.utils.managers.dictation
{

	
	import com.gazuntite.patient.visit.dto.ModuleDictationDTO;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.patient.visit.utils.QIConstants;
	import com.gazuntite.patient.visit.view.commons.dictation.DictationPopup;
	
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import flash.geom.Point;

	[ExcludeClass]
	public class QIDictationManagerImpl
	{
		private var model : QIModelLocator = QIModelLocator.getInstance();
		
		private static var _instance:QIDictationManagerImpl;
		
		public function QIDictationManagerImpl(instance:SingletonClass)
		{
			if (!instance)
				throw new Error("QIDictationManagerImpl is singleton class, you can not create its instance");
		}
		
		public static function getInstance():QIDictationManagerImpl
		{
			if (!_instance)
				_instance = new QIDictationManagerImpl(new SingletonClass());
			
			return _instance;
		}
		
		public function create(dictationDTO:ModuleDictationDTO): DictationPopup
		{
			var dictationPanel: DictationPopup
			if (dictationDTO)
			{
				dictationPanel= new DictationPopup();
				dictationPanel.width = 250;
				dictationPanel.height = 75;
				dictationPanel.HeadingLable = "DICTATION";
				
				dictationPanel.DictationID = dictationDTO.DictationID;
				dictationPanel.DictationID = dictationDTO.DictationID;
				dictationPanel.ModuleID = dictationDTO.ModuleTypeID.toString();
			}
			
			return dictationPanel;
		}
		
		public function show( parent:DisplayObject, dictationPanel:DictationPopup , dictationDTO:ModuleDictationDTO , relatedDO:DisplayObject ) : DictationPopup
		{
			if (parent && dictationDTO)
			{
				if (dictationPanel && dictationPanel.isPopUpShown)
				{
					remove(dictationPanel);
				}
				
				dictationPanel = create(dictationDTO);
				dictationPanel.ShowPopup(parent);
				
				move(dictationPanel, relatedDO);
				
				dictationPanel.id_closeBtn.addEventListener(MouseEvent.CLICK, function(event:MouseEvent):void
				{
					if(dictationDTO != null && dictationPanel.DictationID != null)
					{
						dictationDTO.DictationID = dictationPanel.DictationID;
						dictationDTO.VisitDate = QIConstants.NULL_DATE;
						dictationDTO.DictationTimeStamp = new Date();
						
						dictationDTO.ManagedByUserId = model.LoggedInUserId;
						dictationDTO.ManagedByUserTypeId = model.LoggedInUserProviderTypeId;//   TypeId;
						
						trace("id_closeBtn->Click ... CALLED IN MANAGER");
						
					}
				});
				//, false, 0, true
			}
			
			return dictationPanel;
		}
		
		public function remove(dictationPanel:DictationPopup):void
		{
			if (dictationPanel)
				dictationPanel.removePopup();
		}
		
		public function move(dictationPanel:DictationPopup, relatedDO:DisplayObject):void
		{
			if (dictationPanel && relatedDO)
			{
				var xx:Number = relatedDO.x + relatedDO.width/2;
				var yy:Number = relatedDO.y + relatedDO.height;
				
				if (relatedDO.parent)
				{
					var loc:Point = relatedDO.parent.localToGlobal(new Point(xx, yy));
					
					if (loc)
					{
						loc.x -= dictationPanel.width/2;
						dictationPanel.move(loc.x, loc.y);
					}
				}
			}
		}
	}
}
class SingletonClass{}