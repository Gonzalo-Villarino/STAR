use strict;
use warnings;

open(FILE,"/home3/gonzalo/testSTAR/01_STAR/file.names.txt") or die;
while(<FILE>){
	chomp;
	my $name = $_;
	$name =~ s/Aligned\.sortedByCoord\.out\.bam//;
	open(OUT,">$name.sh") or die;
	print OUT "#!/bin/bash\n";
	print OUT "cufflinks --library-type fr-firststrand -G /home3/gonzalo/Petunia/indexed_genome/Petunia_axillaris_v1.6.2_gene_models.gff -o /home3/gonzalo/testSTAR/02_cufflinks/cufflinks_$name /home3/gonzalo/testSTAR/01_STAR/$name\Aligned.sortedByCoord.out.bam";
	print $name;
	close OUT;
} 
close FILE;

