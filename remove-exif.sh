#!/bin/bash

exiftool -all= images -tagsfromfile @ -exif:Orientation -overwrite_original
