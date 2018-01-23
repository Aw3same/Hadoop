#!/bin/bash

sqoop --options-file truncate-table.conf
sqoop --options-file export-top10.conf
