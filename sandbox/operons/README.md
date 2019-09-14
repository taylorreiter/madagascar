# Operon Analysis

The goal of this analysis is to identify incomplete operons due to assembly or
binning errors. We started with high quality bins from the Madagascar cohort
assembled by Passoli et al. 2019. We selected bins that were annotated as 
Escherichia coli by sourmash lca gather. We chose to work with E. coli because
it has well-annotated operons. We annotated all bins using Prokka (using an 
|Escherchia specific database). We then parsed all gff files manually for
incomplete operons. 

We focused on the lac operon for lactose metabolism, the trp operon for 
tryptophan biosynthesis, and the pga operon for PGA synthesis for biofilm
production. We selected the lac and trp operons because they are well-studied, 
and the pga operon for its importance to human health (e.g. by influencing 
virulence/pathogenicity via biofilm production).

lac operon: lacZ, lacY, lacA  
trp operon: trpA, trpB, trpC, trpD, trpE  
pga operon: pgaA, pgaB, pgaC, pgaD

We found multiple bins where all but one ORF was present in the correct order 
and within reasonable distance of the other ORFs. In addition, in multiple
cases, the operon was located at the beginning or end or a contig, suggesting
the ORF missing from the operon was not assembled.

We also found bins in which no operon was present.

|Bin                | operon | missing ORF | edge of contig?| on sep contig?|
|-------------------|--------|-------------|---------|---------------|
| A48\_05\_1FE\_\_bin.12| lac    | whole operon|NA              | |
| A47\_02\_1FE\_\_bin.12| lac    | lacA        | no             | |
| A44\_01\_1FE\_\_bin.23| lac    | lacA        | no             | |
| A11\_01\_1FE\_\_bin.8 | trp    | trpE        | yes            |yes|
| A39\_02\_1FE\_\_bin.26| trp    | trpA        | yes            |no|
| A02\_01\_1FE\_\_bin.7 | pga    | pgaA        | yes            |no|

We next sought to complete these operons using spacegraphcats.

|Bin                | SRA id |
|-------------------|--------|
| A48\_05\_1FE\_\_bin.12| SRR7658594|
| A47\_02\_1FE\_\_bin.12| SRR7658650|
| A44\_01\_1FE\_\_bin.23| SRR7658622|
| A11\_01\_1FE\_\_bin.8 | SRR7658676|
| A39\_02\_1FE\_\_bin.26| SRR7658637|
| A02\_01\_1FE\_\_bin.7 | SRR7658687|

For bins in which only one ORF was missing from the operon, we queried with the
casette that was present. 

For bins in which the whole operon was missing, we queried with the operon from
a closely related genome assembly, or E. coli K12. 
