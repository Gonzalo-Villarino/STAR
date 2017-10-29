use strict;
use warnings;

open(FILE,"/home3/gonzalo/all_reads_Q30L50_merged/file.names.txt") or die;
while(<FILE>){
	chomp;
	my $name = $_;
	$name =~ s/\.R1\.fq\.gz//;
	 $name =~ s/\.R2\.fq\.gz//;
	open(OUT,">$name.sh") or die;
	print OUT "#!/bin/bash\n";
	print OUT "STAR --genomeDir /home3/gonzalo/Petunia/indexed_genome/star_index  --readFilesCommand zcat --readFilesIn /home3/gonzalo/all_reads_Q30L50_merged/$name\.R1\.fq\.gz /home3/gonzalo/all_reads_Q30L50_merged/$name\.R2\.fq\.gz --outSAMtype BAM SortedByCoordinate --sjdbGTFfile /home3/gonzalo/Petunia/indexed_genome/Petunia_axillaris_v1.6.2_gene_models.gff --sjdbGTFtagExonParentTranscript Parent  --outFileNamePrefix \"$name\"   ";
	print $name;
	close OUT;
}
close FILE;
