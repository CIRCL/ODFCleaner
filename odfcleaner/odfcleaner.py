#!/usr/bin/env python
# -*- coding: utf-8 -*-

from io import BytesIO
from lxml import etree
import zipfile
from zipfile import ZipFile
import os
import sys


class FileResolver(etree.Resolver):

    def __init__(self, data_dir):
        super(FileResolver, self).__init__()
        self.data_dir = data_dir

    def resolve(self, url, pubid, context):
        return self.resolve_filename(os.path.join(self.data_dir, url), context)


class ODFCleaner():
    to_remove = ['layout-cache', 'Configurations2']

    # Not required:  to_copy = ['Thumbnails', 'manifest.rdf']

    to_copy = []

    def __init__(self):
        self.data_dir = os.path.join(os.path.abspath(os.path.dirname(sys.modules['odfcleaner'].__file__)), 'data')
        self.to_transform = {'content.xml': os.path.join(self.data_dir, 'cleanodf.xsl'),
                             'styles.xml': os.path.join(self.data_dir, 'cleanodf.xsl'),
                             'meta.xml': os.path.join(self.data_dir, 'cleanodfmeta.xsl'),
                             'settings.xml': os.path.join(self.data_dir, 'cleanodfsettings.xsl'),
                             'META-INF/manifest.xml': os.path.join(self.data_dir, 'cleanodfmanifest.xsl')}

        self.preloaded_xsl = self.__preload_xsl()

    def __preload_xsl(self):
        to_return = {}
        for xml, xsl in self.to_transform.items():
            with open(xsl, 'rb') as f:
                to_return[xml] = BytesIO(f.read())
        return to_return

    def __transform(self, xslt, xml):
        parser = etree.XMLParser()
        parser.resolvers.add(FileResolver(self.data_dir))
        xslt_doc = etree.parse(xslt, parser)
        xsl_transform = etree.XSLT(xslt_doc)
        doc = etree.parse(xml, parser)
        return str(xsl_transform(doc))

    def clean(self, infile, outfile, copy_pictures=True):
        with ZipFile(outfile, 'w', zipfile.ZIP_DEFLATED) as fout:
            with ZipFile(infile, 'r') as myzip:
                self.skiped = myzip.namelist()
                self.removed = []
                for xml in myzip.namelist():
                    # mimetype needs to be copied and not compressed
                    if xml == 'mimetype':
                        with myzip.open(xml) as f:
                            fout.writestr(xml, f.read(), zipfile.ZIP_STORED)
                            self.skiped.remove(xml)
                    elif xml in self.preloaded_xsl.keys():
                        # Transform & cleanup
                        with myzip.open(xml) as f:
                            transformed = self.__transform(self.preloaded_xsl.get(xml), f)
                            fout.writestr(xml, transformed)
                            self.skiped.remove(xml)
                    elif copy_pictures and xml.startswith('Pictures'):
                        with myzip.open(xml) as f:
                            fout.writestr(xml, f.read())
                            self.skiped.remove(xml)
                    else:
                        for remove_start in self.to_remove:
                            if xml.startswith(remove_start):
                                self.removed.append(xml)
                                self.skiped.remove(xml)
                        # Copy sane (?) stuff
                        for copy_start in self.to_copy:
                            if xml.startswith(copy_start):
                                with myzip.open(xml) as f:
                                    fout.writestr(xml, f.read())
                                    self.skiped.remove(xml)
