'bioinformatics'⎕NS''

rna←'U'@(=∘'T')

revc←'TAGC'⌷⍨∘⊂'ATCG'⍳⌽

bioinformatics.codons←'UUU' 'UUC' 'UUA' 'UUG' 'UCU' 'UCC' 'UCA' 'UCG' 'UAU' 'UAC' 'UAA' 'UAG' 'UGU' 'UGC' 'UGA' 'UGG' 'CUU' 'CUC' 'CUA' 'CUG' 'CCU' 'CCC' 'CCA' 'CCG' 'CAU' 'CAC' 'CAA' 'CAG' 'CGU' 'CGC' 'CGA' 'CGG' 'AUU' 'AUC' 'AUA' 'AUG' 'ACU' 'ACC' 'ACA' 'ACG' 'AAU' 'AAC' 'AAA' 'AAG' 'AGU' 'AGC' 'AGA' 'AGG' 'GUU' 'GUC' 'GUA' 'GUG' 'GCU' 'GCC' 'GCA' 'GCG' 'GAU' 'GAC' 'GAA' 'GAG' 'GGU' 'GGC' 'GGA' 'GGG'
bioinformatics.prots←'FFLLSSSSYYOOCCOWLLLLPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG'
prot←{
  codons←⍵⊂⍨⎕IO=3|⍳≢⍵
  prots←bioinformatics.prots[bioinformatics.codons ⍳ codons↓⍨-×3|≢⍵]
  ⍝ stop
  prots↑⍨¯1+prots⍳'O'
}

readFASTA←{{(1↓⊃⍵)(∊1↓⍵)}¨('>'∘∊¨⊂⊢)⎕NGET ⍵ 1}

orf←{
  dna←1 2⊃readFASTA ⍵
  starts←⍸'AUG'∘∊
  ⍝views←rna¨ dna ,⍥(0 1 2↓¨⊂) revc dna
  rnaViews←rna¨ dna (revc dna)
  proteins←(starts)¨ rnaViews
}
