inp:"uugsqrei";

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

xor:{0b sv (<>/)0b vs' x};

hash:{[s]
  init[];
  do[64;round[("i"$s),17 31 73 47 23i]];
  "x"$xor each 16 0N#(neg tot) rotate l};


ans1:(sum/) g:{raze 0b vs' hash inp,"-",string x} each til 128;

del:((0 0);(0 1);(1 0);(0 -1);(-1 0));

fill:{[h]
  h:distinct raze h+/:\:del;
  h where {.[g;x]}each h};

ans2:0;

flood:{
  i:first where 0<=j:{first where x}each g;
  j:j i;
  if[not (i>=0)&(j>=0);:0b];
  r:(fill/)[enlist (i;j)];
  ans2::ans2+1;
  {.[`g;x;:;0b]}each r;
  1b};
  
do[128*128;flood[]];

