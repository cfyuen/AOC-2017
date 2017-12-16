inp:read0`:d4;
l:" " vs/: inp;

ans1:sum {count[x]=count distinct x}each l;

ans2:sum {x:asc each x;count[x]=count distinct x}each l;

