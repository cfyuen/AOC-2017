inp:first read0`:d16;
l:"," vs inp;

c:"c"$97+til 16;

move:{[x;y]
  cmd:`$y[0];
  v:1_y;
  $[cmd=`s;
    x:(neg "I"$v) rotate x;
    cmd=`x;
    x[reverse k]:x[k:"I"$"/" vs v];
    x[reverse k]:x[k:raze x?/:"/" vs v]];
  x};

dance:{[x] (move/)[x;l] };

ans1:dance[c];

ans2:form 1000000000 mod count form:(dance\)[c];

