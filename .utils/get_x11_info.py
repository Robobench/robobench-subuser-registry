#!/bin/python

import apt,sys

def get_xorg_package(xorg_version):
    cache = apt.Cache()
    xorg_package_candidates = [k for k in cache.keys() if 'xserver-xorg-core' in k]
    for candidate in xorg_package_candidates:
        pkg = cache[candidate]        
        if xorg_version in pkg.versions[0].version:
            return pkg.name

if __name__=="__main__":
    xorg_version = sys.argv[1]
    pkg_name = get_xorg_package(xorg_version)
    print(pkg_name)
