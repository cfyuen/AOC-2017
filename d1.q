inp:first read0`:d1;

inp,:inp[0];
ans1:sum (`int$inp where inp=next inp)-48;

inp:first read0`:d1;

l:2 0N#inp;
ans2:2*sum (`int$l[0] where l[0]=l[1])-48;

