inp:324;

f:{[b;x] (inp rotate b),x};

ans1:first (f/)[enlist 0;1+til 2017];

ans2:0;
f2:{[id;x] nid:(1+id+inp) mod x;if[nid=0;ans2::x];nid};
(f2/)[0;1+til 50000000];
