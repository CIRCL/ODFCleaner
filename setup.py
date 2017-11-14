#!/usr/bin/env python
# -*- coding: utf-8 -*-
from setuptools import setup


setup(
    name='odfcleaner',
    version='0.1',
    author='Raphaël Vinot',
    author_email='raphael.vinot@circl.lu',
    maintainer='Raphaël Vinot',
    url='https://github.com/CIRCL/ODFCleaner',
    description='Python module to cleanup ODF files.',
    packages=['odfcleaner'],
    scripts=['bin/odfcleaner'],
    classifiers=[
        'Development Status :: 5 - Production/Stable',
        'Environment :: Console',
        'Intended Audience :: Science/Research',
        'Programming Language :: Python',
        'Topic :: Security'
    ],
    tests_requires=['nose'],
    test_suite='nose.collector',
    install_requires=['lxml'],
    package_data={'odfcleaner': ['data/*.xsl']}
)
