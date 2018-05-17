# 通过时域响应辨识传递函数

1. -1.dat ... 15.dat        分别是各种幅值（即文件名）的阶跃响应，单位是 degree
14. preprocess               预处理
15. test1_1                  
    -  辨识 $G(s)=\frac{K e^{-s T}}{1+a_1 s}$
16. test1_2
    -  辨识 $G(s)=\frac{1}{1+a_1 s+a_2 s^2}$    
16. test1_2_T
    -  辨识 $G(s)=\frac{e^{-s T}}{1+a_1 s+a_2 s^2}$       