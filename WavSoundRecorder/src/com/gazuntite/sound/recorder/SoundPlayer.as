package com.gazuntite.sound.recorder
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.media.SoundTransform;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	
	import org.as3wavsound.WavSound;
	import org.as3wavsound.WavSoundChannel;
	
	[Event(name="playComplete", type="flash.events.Event")]
	
	[Bindable]
	public class SoundPlayer extends EventDispatcher
	{
		
		private var wsndChannel:WavSoundChannel;
		private var wsound:WavSound;
		
		
		private var _volume:Number;
		
		private var _soundFileLength:Number;

		public function get SoundFileLength():int
		{
			return _soundFileLength;
		}
		
		public function SoundPlayer(vol:Number)
		{
			_volume = vol;
		}
		
		/*public function Play(soundUrl:URLRequest):void
		{
			var loader:URLLoader = new URLLoader();
			loader.dataFormat = 'binary';
			loader.load(soundUrl);
			
			loader.addEventListener(Event.COMPLETE, PlayWav);				
			loader.addEventListener(IOErrorEvent.IO_ERROR, DoNothing);
		}*/
		
		public function Play(sndBytes:ByteArray):void
		{
			wsound = new WavSound(sndBytes);
			
			_soundFileLength =  wsound.length / 1000; //convert to seconds
			
			var trans:SoundTransform = new SoundTransform(_volume, 0);				
								
			wsndChannel =  wsound.play(0, 0, trans); //M set start time * 1000 to seek
			//sndChannel.removeEventListener(Event.SOUND_COMPLETE, doNothing);
			wsndChannel.addEventListener(Event.SOUND_COMPLETE, SoundComplete);
		}
		
		public function Seek(seek:Number):void
		{
			if(wsndChannel != null)
			{
				wsndChannel.stop();
				wsndChannel.removeEventListener(Event.SOUND_COMPLETE, SoundComplete);
				wsndChannel = null;
				
				var trans:SoundTransform = new SoundTransform(_volume, 0);	
				
				wsndChannel =  wsound.play(seek, 0, trans);
				
				wsndChannel.addEventListener(Event.SOUND_COMPLETE, SoundComplete);
			}
		}
		
		public function StopPlaying():void
		{
			if(wsndChannel != null)
			{
				wsndChannel.stop();
				wsndChannel.removeEventListener(Event.SOUND_COMPLETE, SoundComplete);
				wsndChannel = null;
			}		
		}
		
		public function ChangeVolume(vol:Number, seek:Number):void
		{
			if(wsndChannel != null)		
			{
				wsndChannel.stop();
				wsndChannel = null;
				
				var trans:SoundTransform = new SoundTransform(vol, 0);	
				
				wsndChannel =  wsound.play(seek, 0, trans); //M set start time * 1000 to seek
				
				wsndChannel.addEventListener(Event.SOUND_COMPLETE, SoundComplete);
			}
		}
		
		private function DoNothing(event:Event):void
		{
			
		}	
		
		protected function SoundComplete(event:Event):void
		{
			dispatchEvent( new Event('playComplete', true ) );
		}
	}
}