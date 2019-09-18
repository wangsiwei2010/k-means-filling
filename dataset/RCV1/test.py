# -*- coding: utf-8 -*-
"""
Created on Sat Jan 26 09:46:38 2019

@author: wangs
"""
import random
import numpy as np
import scipy.io as io

all_points=[] ;

i=0;
m = 10000;
n = 2000;

ratio = 0.1;
while(i!=m*n*ratio):
    generateddata=[random.randint(1,m),random.randint(1,n)]
    if not generateddata in all_points:#去掉重复数据
               all_points.append(generateddata)
               i=i+1;

absencematrix = np.array(all_points);

mat_path = 'index'+ str(ratio)
io.savemat(mat_path, {'name': absencematrix});
                