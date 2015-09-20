import os
import sys
import stringparser

FOLDER = sys.argv[1]

TEMPLATE = '20150422_multigrayscale_DeltaEpsilon_001VsdmV_{:f}__grayscales_panel.png'
#TEMPLATE = '20150422_multigrayscale_DeltaEpsilon_001VsdmV_{:f}__grayscale_phase.png'

files = os.listdir(FOLDER)
parser= stringparser.Parser(TEMPLATE)

m = {parser(f): os.path.join(FOLDER, f) for f in files}


TEMPLATE = TEMPLATE.replace('{:f}', '%03d')
for i, k in enumerate(sorted(m)):
    os.rename(m[k], os.path.join(FOLDER, TEMPLATE % i))
