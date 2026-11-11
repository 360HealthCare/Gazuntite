package com.gazuntite.patient.visit.utils.managers.dictation
{

	import com.gazuntite.patient.visit.dto.ModuleDictationDTO;
	import com.gazuntite.patient.visit.view.commons.dictation.DictationPopup;
	
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	

	public class QIDictationManager
	{
		private static var impl:QIDictationManagerImpl = QIDictationManagerImpl.getInstance();
		
		public function QIDictationManager()
		{
		}
		
		public static function create(dictationDTO:ModuleDictationDTO):DictationPopup
		{
			return impl.create(dictationDTO);
		}
		
		public static function show(parent:DisplayObject, dictationPanel:DictationPopup, dictationDTO:ModuleDictationDTO, relatedDO:DisplayObject):DictationPopup
		{
			return impl.show(parent, dictationPanel, dictationDTO, relatedDO);
		}
		
		public static function remove(dictationPanel:DictationPopup):void
		{
			impl.remove(dictationPanel);
		}
		
		public static function move(dictationPanel:DictationPopup, relatedDO:DisplayObject):void
		{
			impl.move(dictationPanel, relatedDO);
		}
	}
}