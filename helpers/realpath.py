#!/usr/bin/env python

import sys
import os.path

if __name__ == '__main__':
    print(os.path.realpath(sys.argv[1]))
