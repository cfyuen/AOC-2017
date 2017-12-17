inp:first read0`:d11;
s:`$"," vs inp;

d:`nw`n`ne`se`s`sw!flip (0 1 1 0 -1 -1;1 0 -1 -1 0 1);

seq:(+\)d s;
ans1:max abs k,neg sum k:last seq;

ans2:max max abs seq,'neg sum each seq;