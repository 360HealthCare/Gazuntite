package com.gazuntite.common.dto
{
	
	import com.gazuntite.common.dto.baseDTO.LiveProviderBaseDTO;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class PatientDocumentDTO extends LiveProviderBaseDTO
	{
		public function PatientDocumentDTO()
		{
		}
		
		
		private var   childDocument						:ArrayCollection;
		public function get ChildDocument():ArrayCollection
		{
			return childDocument;
		}		
		public function set ChildDocument(value:ArrayCollection):void
		{
			childDocument = value;
		}
		
		public function get children():ArrayCollection
		{
			return childDocument;
		}		
		public function set children(value:ArrayCollection):void
		{
			childDocument = value;
		}
		
		 
		
		
		
		private var   documentId						:int;
		public function get DocumentId():int
		{
			return documentId;
		}		
		public function set DocumentId(value:int):void
		{
			documentId = value;
		}
		
		
		
		private var  commentId							:int; 
		public function get CommentId():int
		{
			return commentId;
		}		
		public function set CommentId(value:int):void
		{
			commentId = value;
		}
		
		
		private var   commentNote						:String;
		public function get CommentNote():String
		{
			return commentNote;
		}		
		public function set CommentNote(value:String):void
		{
			commentNote = value;
		}
		
		
		
		private var  patientID							:int; 
		public function get PatientID():int
		{
			return patientID;
		}		
		public function set PatientID(value:int):void
		{
			patientID = value;
		}
		
		
		private var  sectionParentId							:int; 
		public function get SectionParentId():int
		{
			return sectionParentId;
		}		
		public function set SectionParentId(value:int):void
		{
			sectionParentId = value;
		}
		
		
		
		
		private var documentVirtualName					:String; //GUID
		public function get DocumentVirtualName():String
		{
			return documentVirtualName;
		}		
		public function set DocumentVirtualName(value:String):void
		{
			documentVirtualName = value;
		}
		
		
		private var documentName						:String
		public function get DocumentName():String
		{
			return documentName;
		}		
		public function set DocumentName(value:String):void
		{
			documentName = value;
		}
		
		public function get label():String
		{
			return documentName;
		}		
		public function set label(value:String):void
		{
			documentName = value;
		}
		
		
		
		private var  serverFilePath						:String;
		public function get ServerFilePath():String
		{
			return serverFilePath;
		}		
		public function set ServerFilePath(value:String):void
		{
			serverFilePath = value;
		}
		
		
		private var  clientFilePath						:String;
		public function get ClientFilePath():String
		{
			return clientFilePath;
		}		
		public function set ClientFilePath(value:String):void
		{
			clientFilePath = value;
		}
		
		
		private var  documentTypeId 					:int;
		public function get DocumentTypeId():int
		{
			return documentTypeId;
		}		
		public function set DocumentTypeId(value:int):void
		{
			documentTypeId = value;
		}
		private var  documentTypeName 					:String;
		public function get DocumentTypeName():String
		{
			return documentTypeName;
		}		
		public function set DocumentTypeName(value:String):void
		{
			documentTypeName = value;
		}
		
		
		
		
		
		private var  sectionId 							:int;
		public function get SectionId():int
		{
			return sectionId;
		}		
		public function set SectionId(value:int):void
		{
			sectionId = value;
		}
		
		private var  sectionName 							:String;
		public function get SectionName():String
		{
			return sectionName;
		}		
		public function set SectionName(value:String):void
		{
			sectionName = value;
		}
		
		
		
		
		
		private var  uploadedByUserId 					:int;
		public function get UploadedByUserId():int
		{
			return uploadedByUserId;
		}		
		public function set UploadedByUserId(value:int):void
		{
			uploadedByUserId = value;
		}
		
		private var  uploadedByUserTypeId 				:int;
		public function get UploadedByUserTypeId():int
		{
			return uploadedByUserTypeId;
		}		
		public function set UploadedByUserTypeId(value:int):void
		{
			uploadedByUserTypeId = value;
		}
		
		private var  uploadedByClinicBranchId 			:int;
		public function get UploadedByClinicBranchId():int
		{
			return uploadedByClinicBranchId;
		}		
		public function set UploadedByClinicBranchId(value:int):void
		{
			uploadedByClinicBranchId = value;
		}
		
		
		private var  uploadedDate 						:String;
		public function get UploadedDate():String
		{
			return uploadedDate;
		}		
		public function set UploadedDate(value:String):void
		{
			uploadedDate = value;
		}
		
		
		private var  lastSeenByUserId 					:int;
		public function get LastSeenByUserId():int
		{
			return lastSeenByUserId;
		}		
		public function set LastSeenByUserId(value:int):void
		{
			lastSeenByUserId = value;
		}
		private var  lastSeenDate 						:String;
		public function get LastSeenDate():String
		{
			return lastSeenDate;
		}		
		public function set LastSeenDate(value:String):void
		{
			lastSeenDate = value;
		}
		
		private var  isDocumentFileUploaded 			:Boolean
		public function get IsDocumentFileUploaded():Boolean
		{
			return isDocumentFileUploaded;
		}		
		public function set IsDocumentFileUploaded(value:Boolean):void
		{
			isDocumentFileUploaded = value;
		}
		
		
		private var  createdBy 							:int;
		public function get CreatedBy():int
		{
			return createdBy;
		}		
		public function set CreatedBy(value:int):void
		{
			createdBy = value;
		}
		private var  createdAt 					:String;
		public function get CreatedAt():String
		{
			return createdAt;
		}		
		public function set CreatedAt(value:String):void
		{
			createdAt = value;
		}
		
		
		private var  modifiedAt 				:String;
		public function get ModifiedAt():String
		{
			return modifiedAt;
		}		
		public function set ModifiedAt(value:String):void
		{
			modifiedAt = value;
		}
		
		
		private var  modifiedBy 						:int;
		public function get ModifiedBy():int
		{
			return modifiedBy;
		}		
		public function set ModifiedBy(value:int):void
		{
			modifiedBy = value;
		}
		
		
		
		
		private var  providerIds 						:ArrayCollection;
		public function get ProviderIds():ArrayCollection
		{
			return providerIds;
		}		
		public function set ProviderIds(value:ArrayCollection):void
		{
			providerIds = value;
		}
		
		public function AddProviderId(id:int):void
		{
			if(providerIds==null)
				providerIds = new ArrayCollection();
			
			providerIds.addItem(id);
				
		
		}
		
		
		
		
		private var  patientFirstName 							:String;
		public function get PatientFirstName():String
		{
			return patientFirstName;
		}		
		public function set PatientFirstName(value:String):void
		{
			patientFirstName = value;
		}
		
		private var  patientLastName 							:String;
		public function get PatientLastName():String
		{
			return patientLastName;
		}		
		public function set PatientLastName(value:String):void
		{
			patientLastName = value;
		}
		private var  patientMiddleName 							:String;
		public function get PatientMiddleName():String
		{
			return patientMiddleName;
		}		
		public function set PatientMiddleName(value:String):void
		{
			patientMiddleName = value;
		}

		
		
		private var  uploadedByUserFirstName 							:String;
		public function get UploadedByUserFirstName():String
		{
			return uploadedByUserFirstName;
		}		
		public function set UploadedByUserFirstName(value:String):void
		{
			uploadedByUserFirstName = value;
		}
		
		private var  uploadedByUserLastName 							:String;
		public function get UploadedByUserLastName():String
		{
			return uploadedByUserLastName;
		}		
		public function set UploadedByUserLastName(value:String):void
		{
			uploadedByUserLastName = value;
		}
		
		private var  uploadedByUserMiddleName 							:String;
		public function get UploadedByUserMiddleName():String
		{
			return uploadedByUserMiddleName;
		}		
		public function set UploadedByUserMiddleName(value:String):void
		{
			uploadedByUserMiddleName = value;
		}
		
		
		private var  patientFullName  							:String;
		public function get PatientFullName ():String
		{
			return patientFullName;
		}		
		public function set PatientFullName (value:String):void
		{
			patientFullName = value;
		}
		private var  uploadedByUserFullName   							:String;
		public function get UploadedByUserFullName():String
		{
			return uploadedByUserFullName;
		}		
		public function set UploadedByUserFullName(value:String):void
		{
			uploadedByUserFullName = value;
		}
		
		
		
		
		
		private var  strUploadedDate   				:String;
		public function get StrUploadedDate():String
		{
			return strUploadedDate;
		}		
		public function set StrUploadedDate(value:String):void
		{
			strUploadedDate = value;
		}
		
		
		
		
		
		 
		private var  stationName   				:String;
		public function get StationName():String
		{
			return stationName;
		}		
		public function set StationName(value:String):void
		{
			stationName = value;
		}
		 
		
		private var  practiceName   				:String;
		public function get PracticeName():String
		{
			return practiceName;
		}		
		public function set PracticeName(value:String):void
		{
			practiceName = value;
		}
		
		
		private var  quivusId   				:String;
		public function get QuivusId():String
		{
			return quivusId;
		}		
		public function set QuivusId(value:String):void
		{
			quivusId = value;
		}
		private var  genderName   				:String;
		public function get GenderName():String
		{
			return genderName;
		}		
		public function set GenderName(value:String):void
		{
			genderName = value;
		}
	
	}
}