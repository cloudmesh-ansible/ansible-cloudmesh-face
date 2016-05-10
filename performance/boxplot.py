#! /usr/bin/env python


"""Usage: boxplot.py --kind=KIND --os=OS --host=HOST

Arguments:
  HOST     Host name
  OS       OS name
  KIND     category or classifier
Options:
  -h --help
  -o       OS
"""
from __future__ import print_function

from docopt import docopt
import glob
from cloudmesh_client.common.hostlist import Parameter
import os.path
import textwrap
import numpy as np
import pandas as pd
from pandas import DataFrame
import matplotlib.pyplot as plt

import warnings;

with warnings.catch_warnings():
    warnings.simplefilter("ignore");
    import matplotlib.pyplot as plt

if __name__ == '__main__':
    arguments = docopt(__doc__)
    print(arguments)

    kind = arguments['--kind']

    hosts = Parameter.expand(arguments["--host"])
    oses = Parameter.expand(arguments["--os"])

    print(hosts)
    print(oses)

    #
    # CLEAN
    #
    for host in hosts:
        for osystem in oses:
            data = {
                "os": osystem,
                "host": host,
                "kind": kind
            }

            name = "{os}_{kind}_{host}.csv".format(**data)
            if os.path.isfile(name):
                os.remove(name)
                print("delete", name)
    for host in hosts:
        for osystem in oses:
            data = {
                "os": osystem,
                "host": host,
                "kind": kind
            }
            data["name"] = "{os}_{kind}_{host}".format(**data)
            pattern = "{name}_*.csv".format(**data)
            files = glob.glob(pattern)
            if files != []:
                r = ["real,user,sys\n"]

                for f in files:
                    with open(f) as f:
                        lines = f.readlines()[1:]
                    r = r + lines

                print("Merge Files -> {name}.csv\n".format(**data))
                for f in files:
                    print('  ', f)
                print()
                with open("{name}.csv".format(**data), 'w') as f:
                    f.write(''.join(r))
    # columns = DataFrame()
    values = []
    for osystem in oses:
        for host in hosts:
            data = {
                "os": osystem,
                "host": host,
                "kind": kind
            }
            data["name"] = "{os}_{kind}_{host}.csv".format(**data)
            if os.path.isfile(data["name"]):
                d = pd.read_csv("{name}".format(**data))
                for v in d.real:
                    data["value"] = v
                    values.append([data['value'], "{os}_{host}".format(**data)])

    print(values)

    df = DataFrame(values)
    df.columns = ['time', 'host']
    print(df)

    df.boxplot(column='time',
               by='host')

    plt.suptitle('Performance Comparison OpenFace: {}'.format(kind))

    pdf = "boxplot-{}.pdf".format(kind)
    plt.savefig(pdf)
    plt.close()

    os.system("open {}".format(pdf))
