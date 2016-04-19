import os
import csv
import sys
import shutil
import argparse


parser = argparse.ArgumentParser()
parser.add_argument('-titles', action='store', dest='title_list')
arguments = parser.parse_args()

BASEDIR = os.getcwd()

print ("Testing for target folder...")
if (not(os.path.isdir(BASEDIR + "/CIAs"))):
	os.makedirs(BASEDIR + "/CIAs")
	print ("Creating directory "'CIAs'"")
else:
	print ("Directory already exists")


print ("Processing "'input.csv'"...")

f = open(arguments.title_list)
csv_f = csv.reader(f)

for row in csv_f:
	print row
	os.system("python FunKeyCIA.py -title " + row[0] + " -key " + row[1])
	print(BASEDIR + "/cia/" + row[0] + "/" + row[0] + ".cia", BASEDIR + "/CIAs/" + row[2] + ".cia")
	shutil.rmtree(BASEDIR + "/cia/" + row[0])
	shutil.rmtree(BASEDIR + "/raw/" + row[0])
	print ("")
	
	

print ("Processing complete!")
os.pause();