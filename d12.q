inp:read0`:d12;
l:" <-> " vs/: inp;
s:"I"$", " vs/: l[;1];

d:("I"$l[;0])!s;

f:{distinct x,raze d x};
ans1:count (f/)[enlist 0i];

g:{x except (f/)[1#x]};
ans2:-1+count (g\) "i"$til 2000;