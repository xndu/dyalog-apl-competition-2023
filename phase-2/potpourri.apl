vin←{
  ⍝ check for invalid characters
  ⍵≢⍵∩⎕D,⎕A~'IOQ': ¯1
  numeric←{⍵∊⎕A:(>∘18+1+9|-∘1)⎕A⍳⍵⋄⍎⍵}¨⍵
  weights←8 7 6 5 4 3 2 10 0 9 8 7 6 5 4 3 2
  mask←×weights
  checkdigit←⍕'X'@(=∘10)
  17=≢⍵: ⍵[9] = checkdigit numeric +.× weights
  16=≢⍵: (mask\⍵) ⊣@9⍨ checkdigit numeric +.× mask/weights
  ¯1
}

sortVersions←{
  w←,⊆⍵
  split←~⍤∊∘'-.'⊆⊢
  w[⍋⍎¨@3 4 5∘split¨w]
}

makeChange←{⎕IO←0
  ⍺≡⍬: (0=⍵) 0⍴0
  most←¯1↓⍺
  last←⊢/⍺
  range←⍳1+⌊⍵÷last
  ↑⍪/ last (⊢,⍨most∇⍵-×)¨ range
}
bruteforce←{⎕IO←0
  ↑⍸⍵=⍺+.×⍨↑⍳1+⌊⍵÷⍺
}

 partition←{
     (shape move offset)←{
         1≥|≡⍵:0 1 0+3↑⊂⍵
         (1∘>∨>∘3)≢⍵:⍬
         w←3↑⍵
         w[2]+←1=≢⍵
         w[3]-←⎕IO×3=≢⍵
         w
     }⍺
     ⎕IO←0
     
     shape>⍥≢⍴⍵:0⍴⊂shape⍴0
     w←⍵↓⍨offset
     pre←(-≢shape)↑⍴w
     ind←↑∘.,/move×⍳¨⌈move÷⍨1+pre-shape
     ,ind(shape↑↓)¨∘⊂⍤(≢shape)⊢w
 }
