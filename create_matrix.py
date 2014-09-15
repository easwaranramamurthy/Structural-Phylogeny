def writeOutput(in_file, out_file):
	inf=open(in_file, 'r')
	outf=open(out_file, 'w')
	inf.readline()
	mapping=dict()
	for line in inf:
		list=line.split()
		id1=list[0]
		id2=list[1]
		SDM=float("%0.2f"%float(list[2]))
		mapping[(id1, id2)]=SDM
		mapping[(id2, id1)]=SDM
		
	idList=[]
	for (id1, id2) in mapping:
		if id1 not in idList:
			idList.append(id1)
		if id2 not in idList:
			idList.append(id2)
	
	for id in idList:
		mapping[(id, id)]=0.00
	
	outf.write(" "*4+str(len(idList))+"\n")
	idList.sort()
	
	for id1 in idList:
		outf.write(id1+" "*6)
		for id2 in idList:
			outf.write(" "*2+str(mapping[(id1, id2)]))
		outf.write("\n")
	
in_file="B_align_with_ancestor_output.txt"
out_file="B_with_ancestor_distance_matrix.txt"
writeOutput(in_file, out_file)