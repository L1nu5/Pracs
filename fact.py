import sys, time
def fact(n):
        ans = 1
        for i in range(1,n+1):
                ans *= i
        return ans

if len(sys.argv) > 1:
        start_time = time.time()
        fact(int(sys.argv[1]))
        print "Time taken: %s seconds" % (time.time() - start_time)

