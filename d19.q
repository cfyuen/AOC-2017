inp:read0`:d19;

dir:(1 0;0 1;-1 0;0 -1);

step:{[d;at] v,:.[inp;at];$[" "=.[inp;at+dir[d]];at;at+dir[d]]};

run:{[dict]
  at:dict`at; d:dict`d;
  at:(step[d]/)[at];
  v::-1_v;
  d:$[" "<>.[inp;at+dir[d1:(d+3) mod 4]];d1;" "<>.[inp;at+dir[d2:(d+1) mod 4]];d2;d];
  `at`d!(at;d)};

v:();
fin:(run/)[`at`d!((0;inp[0]?"|");0)];
v,:.[inp;fin`at];
ans1:v where v in .Q.A;

ans2:count v;


