# link in e. coli genomes
cd genomes
while read inline
do
ln -s ../../../inputs/sgbs/$inline .
done < ../genomes.txt

# run prokka
cd ../
mkdir prokka
cd prokka

while read inline
do
ln -s ../../../inputs/sgbs/$inline .
done < ../genomes.txt

for infile in *fa
do
  j=$(basename $infile .fa)
  prokka $infile --outdir . --prefix ${j} --kingdom Bacteria \
     --genus Escherichia --species coli --usegenus \
      --metagenome --force --locustag ${j}
done

# grep for lac, trp, and pga operons to find missing genes
# grep for middle gene in operon and look above and below
 
grep -A 1 -B 1 "lacY" *gff > lac.txt
grep -A 2 -B 2 "trpC" *gff > trp.txt
grep -A 2 -B 2 "pgaC" *gff > pga.txt

# trp operon:
# A11_01_1FE__bin.8 -- missing trpE, @ boundary of contig. trpE id'd on
#                      separate contig.
# A39_02_1FE__bin.26 -- missing trpA, @ boundary of contig. Good candidate for
#                       sgc.
# lac operon:

