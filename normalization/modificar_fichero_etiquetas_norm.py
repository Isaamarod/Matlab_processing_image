# -*- coding: utf-8 -*-
"""
Created on Tue Jan 22 11:01:13 2019

@author: cober
"""
import os #optional
 
filepath = 'C:/Users/cober/Desktop/FASE_3_DL/train_norm.txt'
 
if os.path.exists(filepath): #optional check if file exists
    with open(filepath, 'r') as f:     # load file
        lines = f.read().splitlines()  # read lines    
    with open(filepath, 'w') as f: 
        f.write('\n'.join(['norm_'+line for line in lines]))  # write lines with '#' appended