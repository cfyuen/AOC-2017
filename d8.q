inp:read0`:d8;
ins:" if " vs/: inp;
ops:" " vs/: ins[;0];
cond:" " vs/: ins[;1];

v:`$distinct cond[;0],ops[;0];
d:v!(count v)#0;

repl:{[x]
  x:ssr[x;"!=";"<>"];
  x:ssr[x;"==";"="];
  x};
cstr:{"d[`",x[0],"] ",repl[x[1]]," ",x[2]}each cond;

ans2:0;

expr:{[x]
  if[eval parse x[1];
    d[`$x[0;0]]:$[x[0;1] like "inc";d[`$x[0;0]]+"I"$x[0;2];d[`$x[0;0]]-"I"$x[0;2]]];
  ans2::max ans2,value d;
  };

expr each flip (ops;cstr);
ans1:max d;

