package com.gazuntite.common.command.rapidAccess
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.delegate.rapidAccess.LoadAllQuickLinksDelegate;
	import com.gazuntite.common.dto.QuickLinksAllDTO;
	import com.gazuntite.common.event.rapidAccess.LoadAllQuickLinksEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.IResponder;
	
	public class LoadAllQuickLinksCommand implements Command, IResponder
	{
		private var delegate : LoadAllQuickLinksDelegate;
		private var func:Function;
		
		public function LoadAllQuickLinksCommand()
		{
		}
		
		public function execute(cgEvent:CairngormEvent):void
		{
			delegate = new LoadAllQuickLinksDelegate( this );
			
			var event:LoadAllQuickLinksEvent = cgEvent as LoadAllQuickLinksEvent;
			if(event.func != null)
				this.func = event.func;
			
			delegate.LoadAllQuickLinks();
		}
		
		public function result(event:Object):void
		{
			var xml:XML= event.result as XML;
			
			if(xml!=null)
			{
				var xlist:XMLList = xml.children();
				if( xlist != null )
				{
					var DTOlist:ArrayCollection = new ArrayCollection();
					var arrList:ArrayCollection = new ArrayCollection();
					
					for (var i:int = 0; i < xlist.length(); i++) 
					{
						var t:QuickLinksAllDTO = new QuickLinksAllDTO();
						t.FromXml(xlist[i]);
						arrList.addItem( t );
					}
					if(func != null)
						func(arrList);
				}
			}
		}
		
		public function fault(rpcEvent:Object):void
		{
			var errorStatus:String = "Fault occured in LoadAllQuickLinksCommand.";
			Alert.show(errorStatus + rpcEvent.toString() , 'LoadAllQuickLinksCommand', 4 ,FlexGlobals.topLevelApplication.mainContainer); 
		}
	}
}