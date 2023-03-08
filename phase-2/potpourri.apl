vin←{
  ⍵≢⍵∩⎕D,⎕A~'IOQ': ¯1
  numeric←{⍵∊⎕A:(>∘18+1+9|-∘1)⎕A⍳⍵⋄⍎⍵}¨⍵
  weights←8 7 6 5 4 3 2 10 9 8 7 6 5 4 3 2
  _ins ← {⍵ (↑,⍺,↓)⍨ ⍺⍺-1}
  checkdigit←⍕'X'@(=∘10)
  17=≢⍵: ⍵[9] = checkdigit numeric +.× 0 (9 _ins) weights
  16=≢⍵: ⍵ (9 _ins)⍨ checkdigit numeric +.× weights
  ¯1
}

sortVersions←{
  1=≡⍵: ,⊂⍵
  ⍵[⍋(⍎¨@3 4 5~⍤∊∘'-.'⊆⊢)¨⍵]
}

makeChange←{
  ⍺≡⍬:(⍵=0)0⍴0
  range←¯1+⍳1+⌊⍵÷⊢/⍺
  ⊃⍪/ range ,⍨¨ (⊂¯1↓⍺)∇¨⍵-range×⊢/⍺
}

partition←{

}
