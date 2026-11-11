package com.gazuntite.provider.search.services.patient.util.sql
{
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.common.dto.PatientDTO;
	import com.gazuntite.provider.search.services.patient.util.PSConstants;
	
	import flash.data.SQLConnection;
	import flash.data.SQLMode;
	import flash.data.SQLResult;
	import flash.data.SQLStatement;
	import flash.events.SQLErrorEvent;
	import flash.events.SQLEvent;
	import flash.filesystem.File;
	import flash.net.Responder;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	public class LocalPatientsDB
	{
		/*[Bindable]
		private var model : AppModelLocator = AppModelLocator.getInstance();
		*/
		private var sqlc:SQLConnection = new SQLConnection();
		private var sqls:SQLStatement = new SQLStatement();
		private var isFirstTime:Boolean = false;
		private var patientsDB:File = File.applicationStorageDirectory.resolvePath("temp/" + PSConstants.appVersion + "/" + PSConstants.LOCAL_PATIENTS_DB);
		private var today:Date = new Date();
		
		
		public static const FREE_SEARCH:uint						= 1;
		public static const LAST_FIRST_NAME:uint					= 2;
		public static const FIRST_MIDDLE_LAST_NAME:uint				= 3;
		public static const SSN:uint								= 4;
		public static const DOB:uint								= 5;
		public static const QUIVUS_ID:uint							= 6;
		
		public function LocalPatientsDB()
		{	
			sqlc.addEventListener(SQLErrorEvent.ERROR, errorConnction);			
			sqls.addEventListener(SQLErrorEvent.ERROR, errorStaement);
		}
		//On SQL Error Event
		private function errorConnction(e:SQLErrorEvent):void
		{
			Alert.show(e.toString(),'Error in Patient List Local DB Connection');
		}
		private function errorStaement(e:SQLErrorEvent):void
		{
			Alert.show(e.toString(),'Error in Patient List Local DB Statement');
		}
		
		//Check that if patientsDB available
		public function isPatientsDBAvaliable():Boolean
		{
			var flag:Boolean = false;
			
			if(patientsDB != null && patientsDB.exists)
			{
				return true;
			}
			
			return flag;
		}
		
		
		
		public function loadPatientsListData(searchTerm:String, Qcase:int):ArrayCollection
		{
			//model.localSearchList = new ArrayCollection();
			
			var qryText:String = "SELECT ID, UserID, FirstName,LastName,MiddleName, DOB, SSN, QuivusID FROM PatientList ";
			
			
			var array:Array = executeQuery(Qcase, qryText, searchTerm);
			
			return new ArrayCollection( array );
		}
		
		
		private function executeQuery(Qcase:uint, qryText:String, searchTerm:String):Array
		{
			if(!sqlc.connected)
				sqlc.open(patientsDB);
			
			sqls.sqlConnection = sqlc;
			
			var searchTerms:Array = new Array();
			
			switch(Qcase)
			{
				case FREE_SEARCH: //Free search
					qryText = qryText + "WHERE FirstName LIKE '%" + searchTerm +"%' OR LastName LIKE '%"+searchTerm +"%' OR MiddleName LIKE '%"+searchTerm+"%'";
					break;
				case LAST_FIRST_NAME: //LastName, FirstName
					searchTerms = searchTerm.split(",",searchTerm.length);
					if(searchTerms.length > 1)
						qryText = qryText + "WHERE LastName LIKE '%" + searchTerms[0] +"%' OR FirstName LIKE '%"+searchTerms[1]+"%'";
					else
						qryText = qryText + "WHERE LastName LIKE '%" + searchTerms[0] +"%'";
					break;
				case FIRST_MIDDLE_LAST_NAME: //FirstName MiddleName LastName
					searchTerms = searchTerm.split(" ",searchTerm.length);
					if(searchTerms.length > 2)
						qryText = qryText + "WHERE FirstName LIKE '%" + searchTerms[0] +"%' OR MiddleName LIKE '%"+searchTerms[1]+"%' OR LastName LIKE '%"+searchTerms[2]+"%'";
					else if(searchTerms.length > 1)
						qryText = qryText + "WHERE FirstName LIKE '%" + searchTerms[0] +"%' OR MiddleName LIKE '%"+searchTerms[1]+"%'";
					else
						qryText = qryText + "WHERE FirstName LIKE '%" + searchTerms[0] +"%'";
					break;
				case SSN://SSN
					qryText = qryText + "WHERE SSN LIKE '%" + searchTerm +"%'";
					break;
				case DOB://DOB
					qryText = qryText + "WHERE DOB LIKE '%" + searchTerm +"%'";
					break;
				case QUIVUS_ID://QuivusID
					qryText = qryText + "WHERE QuivusID LIKE '%" + searchTerm +"%'";
					break;
				
			}
			
			sqls.text = qryText;
			sqls.execute();
			
			var res:SQLResult = sqls.getResult();
			var data:Array = res.data;
			
			//Alert.show(data.length.toString(), 'No of patients'); // PatientId:int,  PatientUserID:int not provided in local DB
			
			sqlc.close();
			
			return data;
		}
	}
}