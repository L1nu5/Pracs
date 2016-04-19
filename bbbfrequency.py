import os
import time
os.system("cpufreq-info")
print "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
while(True):
        ch=raw_input("enter the choice:")
        if ch=='1':
                f=raw_input("Plz provide the frequency in range of 300-1000Mhz:")
                print "The current Frequency is set to "+f+" Mhz"
                c="cpufreq-set -f "+f+" Mhz"
                os.system(c)
                os.system("python bubble.py ")
                print "For comparison Add one more frequency..."
                h=raw_input("Plz provide the frequency in range of 300-1000Mhz:")
                print "The current Frequency is set to "+h+" Mhz"
                t="cpufreq-set -f "+h+" Mhz"
                os.system(t)
                os.system("python bubble.py ")

        elif ch=='2':
                g=raw_input("Plz provide the frequency in range of 300-1000Mhz:")
                print "The current Frequency is set to "+g+" Mhz"
                s="cpufreq-set -f "+g+" Mhz"
                os.system(s)
                os.system("python fact.py 100 ")
                print "For comparison Add one more frequency..."
                u=raw_input("Plz provide the frequency in range of 300-1000Mhz:")
                print "The current Frequency is set to "+u+" Mhz"
                i="cpufreq-set -f "+u+" Mhz"
                os.system(i)
                os.system("python fact.py 100 ")
        else:
		break
