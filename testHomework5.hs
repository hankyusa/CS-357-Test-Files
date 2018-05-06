-- CS 357 Homework 5 Test Code
-- Luke Hanks
-- I'm not going to bother with the module stuff. Just past this stuff into your solution file with proper attribution.

exmplTree = T 'a' (T 'b' E (T 'c' E E)) (T 'd' E E)

infTreeFull = T () infTreeFull infTreeFull
infTreeL = T () infTreeL E
infTreeR = T () E infTreeR
infTreeOut = T () infTreeL infTreeR
infTreeZigZagL = T () infTreeZigZagR E
infTreeZigZagR = T () E infTreeZigZagL

-- Think of what you would do to cut an infinite tree short like how we cut infinite lists short.

test_bfnum = bfnum exmplTree == T 1 (T 2 E (T 4 E E)) (T 3 E E)

-- This makes a string of mermaid code. Remember to use putStrLn to print it.
toMermaid :: Show a => Tree a -> String
toMermaid rT@(T _ l r) = "graph TD" ++ connect rT l ++ connect rT r ++ "\n"
    where connect :: Show a => Tree a -> Tree a -> String
          connect (T p _ _)     E        = "\n" ++ show p ++ "-.->Empty_Tree"
          connect (T p _ _) cT@(T c l r) = line ++ connect cT l ++ connect cT r
              where line = "\n" ++ show p ++ "==>" ++ show c

-- To see the mermaid code built go to https://mermaidjs.github.io/mermaid-live-editor/ .
