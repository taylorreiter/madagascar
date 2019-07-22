# Extract madagascar SGBs to a separate file
#find . -name "*A39_01_1FE*" -print > A39_01_1FE.txt
#
#while read inline
#do
#find . -name "*A39_01_1FE*" -print > A39_01_1FE.txt



git clone https://github.com/taylorreiter/madagascar.git
cd madagascar
cut -d "," -f "5" inputs/madagascar_metadata.csv > inputs/madagascar_samples.txt

while read inline
do 
find . -name "*${inline}*" -print >> all_mad_sgbs.txt
done < ~/github/madagascar/inputs/madagascar_samples.txt

#tar czvf ${inline}.tar.gz --files-from all_mad_sgbs.txt

while read inline
do
j=$(basename ${inline})
cp ${inline} mad_mags/${j}
done < all_mad_sgbs.txt