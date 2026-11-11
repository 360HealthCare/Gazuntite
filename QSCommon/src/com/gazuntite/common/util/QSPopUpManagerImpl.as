package com.gazuntite.common.util
{
	[ExcludeClass]
	public class QSPopUpManagerImpl
	{
		private static var _instance:QSPopUpManagerImpl;
		private var allPopUps:Object;
		
		public function QSPopUpManagerImpl(instance:SingletonClass)
		{
			if (!instance)
				throw new Error("QIPopUpManagerImpl is a singleton class, You can not create its instance");
		}
		
		public static function getInstance():QSPopUpManagerImpl
		{
			if (!_instance)
				_instance = new QSPopUpManagerImpl(new SingletonClass());
			
			return _instance;
		}
		
		public function hideAllPopUps():void
		{
			for (var section:String in allPopUps)
			{
				hideAllSectionPopUps(section);
			}
		}
		
		public function hideAllSectionPopUps(section:String):void
		{
			if (allPopUps && allPopUps.hasOwnProperty(section) && allPopUps[section])
			{
				for (var i:int = 0; i < allPopUps[section].length; i++)
				{
					allPopUps[section][i].hide();
				}
			}
		}
		
		public function addPopUp(popUp:*, section:String):void
		{
			if (!allPopUps)
				allPopUps = new Object();
			
			if (allPopUps[section])
			{
				allPopUps[section].push(popUp);
			}
			else
			{
				allPopUps[section] = [];
				allPopUps[section].push(popUp);
			}
		}
		
		public function removePopUp(popUp:*, section:String):void
		{
			if (allPopUps)
			{
				if (allPopUps.hasOwnProperty(section) && allPopUps[section])
				{
					var idx:int = allPopUps[section].indexOf(popUp);
					
					if (idx != -1)
					{
						allPopUps[section].splice(idx, 1);
					}
					
					if (allPopUps[section].length < 1)
						delete allPopUps[section];
				}
			}
		}
		
		//on 06/30/2012: Shahid Munir...to remove all section popups		
		public function removeAllSectionPopUps(section:String):void
		{
			if (allPopUps && allPopUps.hasOwnProperty(section) && allPopUps[section])
			{
				while (allPopUps[section] && allPopUps[section].length > 0)
				{
					allPopUps[section][0].removePopup();
					
					if(allPopUps[section])
					{
						var idx:int = allPopUps[section].indexOf(allPopUps[section][0]);
						
						if (idx > -1)
						{
							allPopUps[section].splice(idx, 1);
						}	
					}
				}				
				
				if (allPopUps[section] && allPopUps[section].length < 1)
					delete allPopUps[section];
			}
		}
		
		//on 06/30/2012: Shahid Munir...to remove all service/module section and popups
		public function removeAllServicePopUps(service:String):void
		{			
			for (var section:String in allPopUps)
			{
				if(section.indexOf(service + ".") > -1)
				{
					removeAllSectionPopUps(section);
				}
			}
		}
		
		//on 06/30/2012: Shahid Munir...to remove all service/module section and popups
		public function hideAllServicePopUps(service:String):void
		{			
			for (var section:String in allPopUps)
			{
				if(section.indexOf(service + ".") > -1)
				{
					hideAllSectionPopUps(section);
				}
			}
		}
	}	
}
class SingletonClass{}