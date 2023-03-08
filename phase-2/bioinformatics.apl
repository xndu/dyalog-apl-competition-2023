rna←'U'@(=∘'T')

revc←'TAGC'⌷⍨∘⊂'ATCG'⍳⌽

prot←⊣

readFASTA←{{(1↓⊃⍵)(∊1↓⍵)}¨('>'∘∊¨⊂⊢)⎕NGET ⍵ 1}

orf←{
  dna←1 2⊃readFASTA ⍵
  starts←⍸'AUG'∘∊
  ⍝views←rna¨ dna ,⍥(0 1 2↓¨⊂) revc dna
  rnaViews←rna¨ dna (revc dna)
  proteins←(starts)¨ rnaViews
}
