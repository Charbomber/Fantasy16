--Crude MW6812 emulator, requires input of clock (intended to increase by 1/44100 for every sample) and a large memory table containing five channel tables, each with a wavetable table and six registers
--by lsg 3/5/21
function mw6812( mw6812Clock , mw6812Reg )
	mw6812Out = { 0 , 0 }
	--1 Carrier wavetable (16 entry table)
	--2 Carrier frequency
	--3 Carrier amplitude
	--4 Sine modulator frequency
	--5 Sine modulator amplitude
	--6 Left ear enabled?
	--7 Right ear enabled?
	for mw6812Channel=1,5 do
		mw6812ChannelOut = mw6812Reg[mw6812Channel][3] * mw6812Reg[mw6812Channel][1][math.floor( (mw6812Clock + ( mw6812Reg[mw6812Channel][5] * math.sin(2*math.pi*mw6812Reg[mw6812Channel][4]*mw6812Clock) )) / 0.0625 * mw6812Reg[mw6812Channel][2] ) % 16 + 1 ]
		for mw6812Ear=6,7 do if (mw6812Reg[mw6812Channel][mw6812Ear] or mw6812Reg[mw6812Channel][mw6812Ear] == 1) then mw6812Out[mw6812Ear-5] = mw6812Out[mw6812Ear-5] + mw6812ChannelOut / 5 end end
	end	
	return mw6812Out end
