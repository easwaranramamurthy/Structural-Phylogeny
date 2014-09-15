python

import os
import pymol
import math
def align(file1, file2, f):
	pymol.cmd.reinitialize()
	cmd.load(file1)
	cmd.load(file2)
	id1=os.path.basename(file1)[:-len(".pdb")]
	id2=os.path.basename(file2)[:-len(".pdb")]
	list=cmd.align(id1, id2)
	rmsd=list[0]
	numTop=list[6]
	length1=len(cmd.get_model(id1).get_residues())
	length2=len(cmd.get_model(id2).get_residues())
	minLength=min(length1, length2)
	srms=1-(rmsd/3.0)
	pfte=numTop/minLength
	w1= (1-pfte+1-srms)/2.0
	w2=(pfte+srms)/2
	sdm=-100*math.log(w1*pfte+w2*srms)
	f.write(id1+"\t"+id2+"\t"+str(sdm)+"\n")

def start(in_path, f):
	fileList=[]
	for filename in os.listdir(in_path):
		if filename.endswith("_B.pdb"): #change here
			fileList.append(in_path+"\\"+filename)			
	f.write("PDB1\tPDB2\tSDM\n")
	for i in xrange(len(fileList)):
		for j in xrange(i+1, len(fileList)):
			align(fileList[i], fileList[j], f)
	

out_file="B_align_with_ancestor_output.txt" #change here
f=open(out_file, 'w')
in_path=os.curdir #change here	
start(in_path, f)
f. close()


python end