//==========================================================
// standard setup (SuperDirt.start;)
(
s.reboot {
	s.options.numBuffers = 1024 * 2048; // default: 1024 * 256
	s.options.memSize = 8192 * 32;
	s.options.numWireBufs = 64;
	s.options.maxNodes = 1024 * 32;
	s.options.numOutputBusChannels = 2;
	s.options.numInputBusChannels = 2;
	s.waitForBoot {
		~dirt = SuperDirt(2, s);
		~dirt.loadSoundFiles;
		~dirt.loadSoundFiles("/Users/CustomSampleFolder01/*");
		~dirt.loadSoundFiles("/Users/CustomSampleFolder02/*");
		~dirt.start(57120, 0 ! 12);
		(
			~d1 = ~dirt.orbits[0]; ~d2 = ~dirt.orbits[1]; ~d3 = ~dirt.orbits[2];
			~d4 = ~dirt.orbits[3]; ~d5 = ~dirt.orbits[4]; ~d6 = ~dirt.orbits[5];
			~d7 = ~dirt.orbits[6]; ~d8 = ~dirt.orbits[7]; ~d9 = ~dirt.orbits[8];
			~d10 = ~dirt.orbits[9]; ~d11 = ~dirt.orbits[10]; ~d12 = ~dirt.orbits[11];
		);
	};

	s.latency = 0.3; // increase this if you get "late" messages
};
);


//==========================================================
// DAW Recording Setting (multi bus)
(
s.options.numBuffers = 1024 * 512;
s.options.memSize = 8192 * 32;
s.options.numWireBufs = 64;
s.options.maxNodes = 1024 * 64;

s.options.numOutputBusChannels = 12;
s.waitForBoot{
	~dirt = SuperDirt(2,s);
	~dirt.loadSoundFiles;
	~dirt.loadSoundFiles("/Users/CustomSampleFolder01/*");
	s.sync;

	~dirt.start(57120, [0,2,4,6,8,10]);
	//s.meter;
	s.latency = 0.3;
};
)

s.meter

//==========================================================
// MIDI Settings

// initialize SuperCollider MIDI Client
MIDIClient.init;

//other setting
~noteOut = MIDIOut.newByName("minilogue xd", "SOUND");
~noteOut.latency = 0.01;
~dirt.soundLibrary.addMIDI(\mlxd, ~noteOut);
~midiOut = MIDIOut.newByName("Babyface Pro (71974131)", "Port 1");

//============================================================
// Controller Input
// Evaluate the block below to start the mapping MIDI -> OSC.
(
var on, off, cc;
var osc;

osc = NetAddr.new("127.0.0.1", 6010);

MIDIClient.init;
MIDIIn.connectAll;

on = MIDIFunc.noteOn({ |val, num, chan, src|
	osc.sendMsg("/ctrl", num.asString, val/127);
});

off = MIDIFunc.noteOff({ |val, num, chan, src|
	osc.sendMsg("/ctrl", num.asString, 0);
});

cc = MIDIFunc.cc({ |val, num, chan, src|
	osc.sendMsg("/ctrl", num.asString, val);
});

if (~stopMidiToOsc != nil, {
	~stopMidiToOsc.value;
});

~stopMidiToOsc = {
	on.free;
	off.free;
	cc.free;
};
)

// Evaluate the line below to stop it.
~stopMidiToOsc.value;