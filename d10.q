inp:"102,255,99,252,200,24,219,57,103,2,226,254,1,0,69,216";
seq:"I"$"," vs inp;

l:();
off:0;
tot:0;

init:{
  l::til 256;
  off::0;
  tot::0;
  1b};

f:{[x]
  l::(reverse x#l),x _ l;
  l::(x+off) rotate l;
  tot::tot+x+off;
  off::off+1;
  1b};

round:{[seq] f each seq};

init[];
round[seq];
l:(neg tot) rotate l;
ans1:l[0]*l[1];

s:("i"$inp),17 31 73 47 23i;

init[];
do[64;round[s]];

xor:{0b sv (<>/)0b vs' x};
ans2:"x"$xor each 16 0N#l;
