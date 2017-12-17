inp:first read0`:d6;
l:"I"$"\t" vs inp;

//l:0 2 7 0;
len:count l;
x:enlist ();

f:{[l]
  if[l in x;:l];
  x,:enlist l;
  d:l id:first where l=max l;
  l[id]:0;
  l:l+d div len;
  l[(id + 1+til d mod len) mod len]+:1;
  l};

res:(f\)l;
ans1:count[res]-1;

ids:where {all last[res]=x}each res;
ans2:ids[1]-ids[0];
