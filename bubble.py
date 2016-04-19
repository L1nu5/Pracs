import os
import time
def bubble(alist):
        for passnum in range(len(alist)-1,0,-1):
                for i in range(passnum):
                        if(alist[i]>alist[i+1]):
                                temp=alist[i]
                                alist[i]=alist[i+1]
                                alist[i+1]=temp
start_time=time.time()
alist=[12,5,78,63,98,45,100,56,12,7]
bubble(alist)
print alist
print "Time is %s in sec"%(time.time()-start_time)

