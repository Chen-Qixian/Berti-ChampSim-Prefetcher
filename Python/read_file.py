import os, re
import matplotlib.pyplot as plt
import numpy as np

filedir = 'output/cqx_results'


def get_detail(lines, field):
    timely = []
    useless = []
    late = []

    # last variable observed
    pret = 0
    preu = 0
    prel = 0
    begin = False

    for line in lines:
        t = int(' '.join(line.split()).split('TIMELY: ')[-1].split(' ')[0])
        u = int(' '.join(line.split()).split('USELESS: ')[-1].split(' ')[0])
        l = int(' '.join(line.split()).split('LATE: ')[-1].split(' ')[0])
        if t < pret:
            begin = True
            pret = 0
            preu = 0
            prel = 0
        if begin:
            timely.append(t - pret)
            useless.append(u - preu)
            late.append(l - prel)
        pret = t
        preu = u
        prel = l

    # print(timely, useless, late)
    n = len(timely)
    x = range(n)
    
    fig, ax = plt.subplots()

    ax.plot(x, timely, label='timely')
    ax.plot(x, useless, label='useless')
    ax.plot(x, late, label='late')
    ax.legend()
    ax.set(xticks=np.arange(0,n))
    plt.title('timely trend')
    plt.savefig('results.png')
    plt.close()





if __name__ == '__main__':

    for filename in os.listdir(filedir):
        fn = filedir + '/' + filename
        reg = "Heartbeat L1D Prefetch TIMELY:.*"
        with open(fn) as f:
            raw = f.read()
            lines = re.findall(reg, raw)
            get_detail(lines, 'time')
            # print(lines)
