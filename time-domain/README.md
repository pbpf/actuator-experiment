# 通过时域响应辨识传递函数

1. -1.dat ... 15.dat        分别是各种幅值（即文件名）的阶跃响应，单位是 degree
2. removezero.m             取掉前方的0指令对应的行，保留最后n=30个，不产生其他影响
3. readdat.m                读取数据文件返回 [数据，列名映射表，列名表]
4. optf.m                   带延迟一阶模型对应的优化目标函数
5. ident_t1.m               optf.m对应的辨识函数
6. optf2.m                  二阶模型对应的优化目标函数
7. ident_t2.m               optf2.m对应的辨识函数
8. optf3.m                  二阶模型对应的优化目标函数,表示方法不一样，用来避开奇异点
9. ident_t3.m               optf3.m对应的辨识函数
10. RLS_ident.m             最小二乘辨识方法
11. RLS_ident3.m            迭代最小二乘辨识方法      
12. filter_mean.m           滤除野值后的均值
13. normalization.m         归一化
14. preprocess               预处理
15. test1                   一阶辨识
16. test2                   二阶辨识