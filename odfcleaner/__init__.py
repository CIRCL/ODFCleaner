#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import logging
logger = logging.getLogger(__name__)
FORMAT = "%(levelname)s [%(filename)s:%(lineno)s - %(funcName)s() ] %(message)s"
logging.basicConfig(stream=sys.stderr, level=logging.WARNING, format=FORMAT)

from .odfcleaner import ODFCleaner  # noqa
