ps=[0.9155   -1.2375
    0.9542   -0.3374
    0.9718   -0.2428
    1.0521    0.0176];
data_0=readdat('0.dat');
data_0=datars(ps,data_0(120:end,:));%check
data_1=datars(ps,removezero(readdat('-1.dat')));
data_2=datars(ps,removezero(readdat('-2.dat')));
data_5=datars(ps,removezero(readdat('-5.dat')));
data_10=datars(ps,removezero(readdat('-10.dat')));
data_15=datars(ps,removezero(readdat('-15.dat')));
data1=datars(ps,removezero(readdat('1.dat')));
data2=datars(ps,removezero(readdat('2.dat')));
data5=datars(ps,removezero(readdat('5.dat')));
data10=datars(ps,removezero(readdat('10.dat')));
data15=datars(ps,removezero(readdat('15.dat')));
