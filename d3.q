inp:265149;

s:first where inp<={x*x} each 1+2*til 1000;
ans1:s+abs[s-(inp-{x*x} -1+s*2) mod s*2];

// Part 2
dx:-1 0 1 0;
dy:0 -1 0 1;
sx:-1 -1 -1 0 0 1 1 1;
sy:-1 0 1 -1 1 -1 0 1;

init:{
  cx::25; cy::25;
  a::50 50#0;
  a[cx;cy]::1;
  :1b};

cal:{[x;y] -1 .Q.s1[(x;y)];a[x;y]::sum {[x;y;d] a[x+sx[d];y+sy[d]]}[x;y]each til count sx; a[x;y]};

init[];

res:raze {cx::cx+1;cy::cy+1; raze {[l;d] raze {[d;mg] cx::cx+dx[d];cy::cy+dy[d];cal[cx;cy]}[d] each til 2*l+1}[x] each til 4} each til 5;
ans2:res where inp<=res;



