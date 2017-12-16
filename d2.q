inp:read0`:d2;

l:"J"$"\t" vs/:inp;
ans1:sum {max[x]-min[x]}each l;

ans2:sum {[a]prd {[a;x]prd (a where 0=a mod x) div x}[a;]each a} each l;




