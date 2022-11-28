import os
filedir = 'output/cqx_results'

for filename in os.listdir(filedir):
    fn = filedir + '/' + filename
    with open(fn) as f:
        raw = f.read()
        print(raw)