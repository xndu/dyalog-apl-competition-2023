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
  1=≡⍵: ,⊂⍵
  split←~⍤∊∘'-.'⊆⊢
  ⍝compare version numbers numerically
  order←⊂⍋⍎¨@3 4 5∘split¨⍵
  order⌷⍵
}

makeChange←{
  ⍺≡⍬:(0=⍵)0⍴0
  range←¯1+⍳1+⌊⍵÷⊢/⍺
  ⊃⍪/ range ,⍨¨ (⊂¯1↓⍺)∇¨⍵-range×⊢/⍺
}

partition←{
  shape move offset←⍺
  
}
