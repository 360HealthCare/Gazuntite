package com.gazuntite.sound.recorder
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.SampleDataEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.media.Microphone;
	import flash.utils.ByteArray;

	[Event(name="saveComplete", type="flash.events.Event")]
	public class SoundRecorder extends EventDispatcher
	{
		
		
		private var MIC_GAIN:int = 100;
		private var MIC_RATE:int = 11;
		private var BIT_RATE:int = 16;
		
		
		private var mic:Microphone;
		private var _samplingRate:int;
		private var soundBytes:ByteArray;
		private var wavFile:File;
		
		
		private var _volume:Number;

		public function get volume():Number
		{
			return _volume;
		}

		public function set volume(value:Number):void
		{
			_volume = value;
		}

		private var pan:Number;
		private var soundMap:Object;
		
		public function SoundRecorder(wavFile:File)
		{
			this.wavFile = wavFile;
			
			_samplingRate = 0;
			soundBytes = new ByteArray();
		}
		
		public function StartRecording():void
		{				
			this.soundBytes = new ByteArray();
			this.mic = Microphone.getMicrophone();
			this.mic.setSilenceLevel(0);
			this.mic.gain = MIC_GAIN;			
			
			this.mic.rate = MIC_RATE;
			
			if(this.mic.rate == 5)
			{
				_samplingRate = 5000;
			}
			else if(this.mic.rate == 8)
			{
				_samplingRate = 8000;
			}
			else if(this.mic.rate == 11)
			{
				_samplingRate = 11025;
			}
			else if(this.mic.rate == 22)
			{
				_samplingRate = 22050;
			}
			else if(this.mic.rate == 44)
			{
				_samplingRate = 44100;
			}
			
			//this.mic.rate = 44;
			
			this.mic.addEventListener(SampleDataEvent.SAMPLE_DATA, OnMicSampleData);
		}
		
		public function StopRecording():void
		{
			this.mic.removeEventListener(SampleDataEvent.SAMPLE_DATA, OnMicSampleData);
			this.mic = null;
			this.volume = 1;
			this.pan = 1;
			this.soundMap = new Object();
			//startPlayback();
			Write();
		}
		
		protected function Write():void
		{
			var wavWriter:WAVWriter = new WAVWriter();				
			var stream:FileStream = new FileStream();				
			
			stream.addEventListener(Event.CLOSE, function(event:Event):void
			{
				dispatchEvent( new Event('saveComplete', true ) );
			}); 
			
			// Set settings
			soundBytes.position = 0;
			wavWriter.numOfChannels = 1;
			
			//wavWriter.sampleBitRate = 16;
			wavWriter.sampleBitRate = BIT_RATE;
			
			//wavWriter.samplingRate = 41000;				
			wavWriter.samplingRate = _samplingRate;
			
			stream.openAsync(wavFile, FileMode.WRITE);
			
			// convert ByteArray to WAV
			
			//wavWriter.processSamples( stream, soundBytes, 41000, 1 );
			wavWriter.processSamples( stream, soundBytes, _samplingRate, 1 );
			
			//UploadToServer();
			
			stream.close();			
			
		}
		
		protected function OnMicSampleData(event:SampleDataEvent):void
		{
			while(event.data.bytesAvailable)
			{
				var sample:Number = event.data.readFloat();
				this.soundBytes.writeFloat(sample);
			}
		}
	}
}