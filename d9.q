inp:first read0`:d9;

// Remove bang
remove:{[x] x except x where (differ del) and 1=del:deltas x};

bang:ss[inp;"!"];
bang:(remove/) bang;
str:inp (til count inp) except bang,bang+1;

// Remove garbage
p:ss[str;"<"];
q:ss[str;">"];
r:p {first where p>x}each prev q;

brac:str (til count str)except raze {x[0]+til x[1]-x[0]-1}each flip (r;q);

cnt:0;
ans1:0;
{$[x="{";[cnt::cnt+1;ans1::ans1+cnt;cnt];x="}";[cnt::cnt-1;cnt];cnt]}each brac;

ans2:sum q-r+1;