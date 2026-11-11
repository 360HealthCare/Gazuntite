package com.gazuntite.input.view.viewmodel.tempmodel
{
	import mx.collections.ArrayCollection;

	[Bindable]
	public class TempModel
	{
		protected static var instance:TempModel;
		
		public var allergyInputList:ArrayCollection = new ArrayCollection();
		public var allergyHistoryList:ArrayCollection = new ArrayCollection();
		
		public function TempModel(useSingleton:Number)
		{
			allergyInputList = new ArrayCollection();
			var item:TempBasicItemModel;
			
			item = new TempBasicItemModel("Allergy Name 1", true);
			allergyInputList.addItem(item);
			item = new TempBasicItemModel("Allergy Name 2", true);
			allergyInputList.addItem(item);
			item = new TempBasicItemModel("Allergy Name 3");
			allergyInputList.addItem(item);
			item = new TempBasicItemModel("Allergy Name 4");
			allergyInputList.addItem(item);
			item = new TempBasicItemModel("Allergy Name 5");
			allergyInputList.addItem(item);
			item = new TempBasicItemModel("Allergy Name 6");
			allergyInputList.addItem(item);
			item = new TempBasicItemModel("Allergy Name 7");
			allergyInputList.addItem(item);
			item = new TempBasicItemModel("Allergy Name 8");
			allergyInputList.addItem(item);
			item = new TempBasicItemModel("Allergy Name 9");
			allergyInputList.addItem(item);
			item = new TempBasicItemModel("Allergy Name 10");
			allergyInputList.addItem(item);
			item = new TempBasicItemModel("Allergy Name 11");
			allergyInputList.addItem(item);
			item = new TempBasicItemModel("Allergy Name 12");
			allergyInputList.addItem(item);
			item = new TempBasicItemModel("Allergy Name 13");
			allergyInputList.addItem(item);
			item = new TempBasicItemModel("Allergy Name 14");
			allergyInputList.addItem(item);
			item = new TempBasicItemModel("Allergy Name 15");
			allergyInputList.addItem(item);
			
			
			allergyHistoryList = new ArrayCollection();
			
			item = new TempBasicItemModel("Allergy Name 1", true);
			allergyHistoryList.addItem(item);
			item = new TempBasicItemModel("Allergy Name 2", true);
			allergyHistoryList.addItem(item);
			item = new TempBasicItemModel("Allergy Name 3"); item.showtimer = true;
			allergyHistoryList.addItem(item);
//			item = new TempBasicItemModel("Allergy Name 4"); item.showtimer = true;
//			allergyHistoryList.addItem(item);
//			item = new TempBasicItemModel("Allergy Name 5"); item.showtimer = true;
//			allergyHistoryList.addItem(item);
//			item = new TempBasicItemModel("Allergy Name 6"); item.showtimer = true;
//			allergyHistoryList.addItem(item);
//			item = new TempBasicItemModel("Allergy Name 7");
//			allergyHistoryList.addItem(item);
//			item = new TempBasicItemModel("Allergy Name 8");
//			allergyHistoryList.addItem(item);
//			item = new TempBasicItemModel("Allergy Name 9");
//			allergyHistoryList.addItem(item);
//			item = new TempBasicItemModel("Allergy Name 10");
//			allergyHistoryList.addItem(item);
//			item = new TempBasicItemModel("Allergy Name 11");
//			allergyHistoryList.addItem(item);
//			item = new TempBasicItemModel("Allergy Name 12");
//			allergyHistoryList.addItem(item);
//			item = new TempBasicItemModel("Allergy Name 13");
//			allergyHistoryList.addItem(item);
//			item = new TempBasicItemModel("Allergy Name 14");
//			allergyHistoryList.addItem(item);
//			item = new TempBasicItemModel("Allergy Name 15");
//			allergyHistoryList.addItem(item);

		}
		public static function getInstance():TempModel
		{
			if (instance == null)
			{
				instance = new TempModel(1);
			}
			return instance;
		}
	}
}