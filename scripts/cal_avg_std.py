import csv
from math import sqrt
import os
 
class MaxiAverageCalculator(object):
    def __init__(self):
        self.ncols = 3
        self.nrows = 0
        self.s = [0.0, 0.0, 0.0]
        self.s2 = [0.0, 0.0, 0.0]
 
    def run(self, fullpath):
        with open(fullpath, "rb") as infile:
            reader = csv.reader(infile, delimiter=",")
            self.colnames = list(next(reader))
            assert len(self.colnames) == 3
            for row in reader:
                L = [ float(x) for x in row ]
                assert len(L) == 3
                for i, x in enumerate(L):
                    self.s[i] += x
                    self.s2[i] += x * x
                self.nrows += 1
        self.avg = [x/self.nrows for x in self.s]
        self.std = [ sqrt((y/self.nrows) - a * a) for a, y in zip(self.avg, self.s2) ]
        print "Results for {0}".format(fullpath)
        for name, a, s in zip(self.colnames, self.avg, self.std):
            f.write(str(a))
            f.write(", ")
            f.write(str(s))
        f.write("\n")
##            print "{0}: avg = {1:.5f}, std = {2:.5f}".format(name, a, s)
##        print
 
if __name__ == "__main__":
    path="/Users/Sonal/Desktop/sample"
    f=open("/Users/Sonal/Desktop/compare_time_avg_std.csv","w+")
    f.write("real_avg, real_std, user_avg, user_std, sys_avg, sys_std")
    f.write("\n")
    dirList=os.listdir(path)
    for file in dirList:
        fullpath=os.path.join(path,file)
        calc = MaxiAverageCalculator()
        calc.run(fullpath)
