# ODFCleaner
Python module to cleanup ODF files.

# Usage

You can use the project uning the CLI script:

```
$ (git::master) odfcleaner -h
usage: odfcleaner [-h] [-i INPUT] [-o OUTPUT] [-p] [-d]

Cleanup ODF.

optional arguments:
  -h, --help            show this help message and exit
  -i INPUT, --input INPUT
                        Input file
  -o OUTPUT, --output OUTPUT
                        Output file
  -p, --pictures        Do not copy pictures
  -d, --debug           Enable debug
```

Or as an library:

```python
from odfcleaner import ODFCleaner
from io import BytesIO

in_blob = BytesIO(open('tests/dataset/ODF_text_reference_v1.odt', 'rb').read())
out_blob = BytesIO()

cleaner = ODFCleaner()
cleaner.clean(in_blob, out_blob)
out_blob.seek(0)

# out_blob is a zip blob containing the cleaned ODF file

```
