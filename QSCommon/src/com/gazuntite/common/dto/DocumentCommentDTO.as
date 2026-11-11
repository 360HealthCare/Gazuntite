package com.gazuntite.common.dto
{
	import com.gazuntite.common.dto.baseDTO.LiveProviderBaseDTO;

	[Bindable]
	public class DocumentCommentDTO extends LiveProviderBaseDTO
	{
		public function DocumentCommentDTO()
		{
		}
		
		
		
		private var   commentId						:int;
		public function get CommentId():int
		{
			return commentId;
		}		
		public function set CommentId(value:int):void
		{
			commentId = value;
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
		
		
		
		
		private var   commentedByUserId						:int;
		public function get CommentedByUserId():int
		{
			return commentedByUserId;
		}		
		public function set CommentedByUserId(value:int):void
		{
			commentedByUserId = value;
		}
		
		
		
		private var   commentedByUserTypeId						:int;
		public function get CommentedByUserTypeId():int
		{
			return commentedByUserTypeId;
		}		
		public function set CommentedByUserTypeId(value:int):void
		{
			commentedByUserTypeId = value;
		}
		
		
		private var   createdBy						:int;
		public function get CreatedBy():int
		{
			return createdBy;
		}		
		public function set CreatedBy(value:int):void
		{
			createdBy = value;
		}
		
		
		
		private var   modifiedBy						:int;
		public function get ModifiedBy():int
		{
			return modifiedBy;
		}		
		public function set ModifiedBy(value:int):void
		{
			modifiedBy = value;
		}
		
		
		
		private var   note						:String;
		public function get Note():String
		{
			return note;
		}		
		public function set Note(value:String):void
		{
			note = value;
		}
		
		private var   createdAt						:Date;
		public function get CreatedAt():Date
		{
			return createdAt;
		}		
		public function set CreatedAt(value:Date):void
		{
			createdAt = value;
		}
		

		
		private var   modifiedAt						:Date;
		public function get ModifiedAt():Date
		{
			return modifiedAt;
		}		
		public function set ModifiedAt(value:Date):void
		{
			modifiedAt = value;
		}
		
		
	}
}