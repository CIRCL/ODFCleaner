#!/usr/bin/env python
# -*- coding: utf-8 -*-

from odfcleaner import ODFCleaner
import unittest
import os


class TestODFCleaner(unittest.TestCase):

    def setUp(self):
        self.cleaner = ODFCleaner()
        self.curdir = os.path.abspath(os.path.dirname(__file__))

    def test_clean(self):
        self.cleaner.clean(os.path.join(self.curdir, 'dataset', 'ODF_text_reference_v1.odt'), 'out.odf')
        self.cleaner.clean(os.path.join(self.curdir, 'dataset', 'ODF_text_reference_v1_1.odt'), 'out.odf')
        self.cleaner.clean(os.path.join(self.curdir, 'dataset', 'ODF_text_reference_v3.odt'), 'out.odf')
