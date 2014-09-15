Structural-Phylogeny
====================

This contains a PyMol script I had written to align pairwise all B chains of Hemoglobin contained in .pdb files in the director.

###Command
Install PyMol(http://www.pymol.org/) and then run the script align.pml in PyMol. Creates output file named B_align_with_ancestor_output

###Create Distance Matrix
```python create_matrix.py``
Creates output file which contains the structural distance matrix which can be input to Kitsch(http://evol.mcmaster.ca/Pise/5.a/kitsch.html) to create a phylogenetic tree
