package com.gazuntite.input.view.viewmodel.tempmodel
{
	import mx.collections.ArrayCollection;

	[Bindable]
	public class TempModelPhysicalRos
	{
		public function TempModelPhysicalRos()
		{
			var item1:TempModelPhysicalRosItemLevelOne;
			
			item1 = new TempModelPhysicalRosItemLevelOne();
			item1.label = "General";
			Add2ndLevel( item1 );			
			temList.addItem(item1);
			
			item1 = new TempModelPhysicalRosItemLevelOne();
			item1.label = "HEENT";
			item1.isHeent = true;
			Add2ndLevel( item1 );
			temList.addItem(item1);
			
			item1 = new TempModelPhysicalRosItemLevelOne();
			item1.label = "Respiratory";
			Add2ndLevel( item1 );
			temList.addItem(item1);
			
			item1 = new TempModelPhysicalRosItemLevelOne();
			item1.label = "Cardiovascular";
			Add2ndLevel( item1 );
			temList.addItem(item1);
			
			item1 = new TempModelPhysicalRosItemLevelOne();
			item1.label = "Breast";
			Add2ndLevel( item1 );
			temList.addItem(item1);
			
			item1 = new TempModelPhysicalRosItemLevelOne();
			item1.label = "Gastrointestinal";
			Add2ndLevel( item1 );
			temList.addItem(item1);
			
			item1 = new TempModelPhysicalRosItemLevelOne();
			item1.label = "Genitourinary";
			Add2ndLevel( item1 );
			temList.addItem(item1);
			
			item1 = new TempModelPhysicalRosItemLevelOne();
			item1.label = "Lymph/Endo";
			Add2ndLevel( item1 );
			temList.addItem(item1);
			
			item1 = new TempModelPhysicalRosItemLevelOne();
			item1.label = "Nuscle/Skel";
			Add2ndLevel( item1 );
			temList.addItem(item1);
			
			item1 = new TempModelPhysicalRosItemLevelOne();
			item1.label = "Skin";
			Add2ndLevel( item1 );
			temList.addItem(item1);
			item1 = new TempModelPhysicalRosItemLevelOne();
			item1.label = "Neurological";
			Add2ndLevel( item1 );
			temList.addItem(item1);
			
			
			item1 = new TempModelPhysicalRosItemLevelOne();
			item1.label = "Allergy";
			Add2ndLevel( item1 );
			temList.addItem(item1);
			
			item1 = new TempModelPhysicalRosItemLevelOne();
			item1.label = "Psychiatric";
			Add2ndLevel( item1 );
			temList.addItem(item1);
			
			item1 = new TempModelPhysicalRosItemLevelOne();
			item1.label = "Other";
			Add2ndLevel( item1 );
			temList.addItem(item1);
			
			item1 = new TempModelPhysicalRosItemLevelOne();
			item1.label = "Respiratory";
			Add2ndLevel( item1 );
			temList.addItem(item1);
			
			item1 = new TempModelPhysicalRosItemLevelOne();
			item1.label = "Cardiovascular";
			Add2ndLevel( item1 );
			temList.addItem(item1);
			
			item1 = new TempModelPhysicalRosItemLevelOne();
			item1.label = "Breast";
			Add2ndLevel( item1 );
			temList.addItem(item1);
			
			item1 = new TempModelPhysicalRosItemLevelOne();
			item1.label = "Gastrointestinal";
			Add2ndLevel( item1 );
			temList.addItem(item1);
			
			item1 = new TempModelPhysicalRosItemLevelOne();
			item1.label = "Genitourinary";
			Add2ndLevel( item1 );
			temList.addItem(item1);
			
			item1 = new TempModelPhysicalRosItemLevelOne();
			item1.label = "Lymph/Endo";
			Add2ndLevel( item1 );
			temList.addItem(item1);
			
			
			createHeentModel();
			
		}
		
		private function Add2ndLevel(item1:TempModelPhysicalRosItemLevelOne):void
		{
			var item2:TempModelPhysicalRosItemLevelTwo;
			
			item2 = new TempModelPhysicalRosItemLevelTwo();
			item2.label = "Avg. Weight";
			item2.note = "Enter Notes";
			item1.itemList.addItem(item2);
			
			item2 = new TempModelPhysicalRosItemLevelTwo();
			item2.label = "Weight Loss/Gain";
			item1.itemList.addItem(item2);
			
			item2 = new TempModelPhysicalRosItemLevelTwo();
			item2.label = "Sense of Well Being";
			item1.itemList.addItem(item2);
			
			item2 = new TempModelPhysicalRosItemLevelTwo();
			item2.label = "Strength";
			item1.itemList.addItem(item2);
			
			item2 = new TempModelPhysicalRosItemLevelTwo();
			item2.label = "Conduct Usual Activities";
			item1.itemList.addItem(item2);
			
			item2 = new TempModelPhysicalRosItemLevelTwo();
			item2.label = "Exercise Tolerance";
			item1.itemList.addItem(item2);
			
			item2 = new TempModelPhysicalRosItemLevelTwo();
			item2.label = "Fatigue";
			item1.itemList.addItem(item2);
			
			item2 = new TempModelPhysicalRosItemLevelTwo();
			item2.label = "Fever/chills";
			item1.itemList.addItem(item2);
			
			item2 = new TempModelPhysicalRosItemLevelTwo();
			item2.label = "Weakness";
			item1.itemList.addItem(item2);
			
			item2 = new TempModelPhysicalRosItemLevelTwo();
			item2.label = "Trouble Sleeping";
			item1.itemList.addItem(item2);
			
			item2 = new TempModelPhysicalRosItemLevelTwo();
			item2.label = "General State of Health";
			item1.itemList.addItem(item2);
			
			item2 = new TempModelPhysicalRosItemLevelTwo();
			item2.label = "Other";
			item1.itemList.addItem(item2);
		}
		
		public function createHeentModel():void
		{
			var item1:TempModelPhysicalRosItemLevelOne;
			var item2:TempModelPhysicalRosItemLevelTwo;
			
			item1 = new TempModelPhysicalRosItemLevelOne();
			item1.label = "Head";
			Add2ndLevelHeent(item1);
			tempHeentItems.addItem(item1);
			
			item1 = new TempModelPhysicalRosItemLevelOne();
			item1.label = "Eyes";
			Add2ndLevelHeent(item1);
			tempHeentItems.addItem(item1);
			
			item1 = new TempModelPhysicalRosItemLevelOne();
			item1.label = "Ears";
			Add2ndLevelHeent(item1);
			tempHeentItems.addItem(item1);
			
			item1 = new TempModelPhysicalRosItemLevelOne();
			item1.label = "Nose";
			Add2ndLevelHeent(item1);
			tempHeentItems.addItem(item1);
			
			item1 = new TempModelPhysicalRosItemLevelOne();
			item1.label = "Throat";
			Add2ndLevelHeent(item1);
			tempHeentItems.addItem(item1);
	
			
			
		}
		
		private function Add2ndLevelHeent(item1:TempModelPhysicalRosItemLevelOne):void
		{
			var item2:TempModelPhysicalRosItemLevelTwo;
			
			item2 = new TempModelPhysicalRosItemLevelTwo();
			item2.label = "Headaches";
			item2.note = "Lores Ipsum";
			item1.itemList.addItem(item2);
			
			item2 = new TempModelPhysicalRosItemLevelTwo();
			item2.label = "Vertigo";
			item1.itemList.addItem(item2);
			
			item2 = new TempModelPhysicalRosItemLevelTwo();
			item2.label = "Light Headedness";
			item1.itemList.addItem(item2);
			
			item2 = new TempModelPhysicalRosItemLevelTwo();
			item2.label = "Head Injury";
			item1.itemList.addItem(item2);
			
			item2 = new TempModelPhysicalRosItemLevelTwo();
			item2.label = "Other";
			item1.itemList.addItem(item2);
		}
		
		public var temList:ArrayCollection = new ArrayCollection();
		public var tempHeentItems:ArrayCollection = new ArrayCollection();
	}
}