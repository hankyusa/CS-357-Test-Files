{-

File for testing solutions to Homework 2. 

To install the necessary packages, run the following commands in the terminal.
If you aren't using Stack, then replace `stack` with `cabal`.

    >> stack update
    >> stack install random

Add the following to the top of your Homework4.hs file:

    module Homework4
    ( insertions,
      deletions,
      substitutions,
      transpositions,
      insert,
      isort,
      fileisort,
      Field,
      Board,
      strategyForRed,
      strategyForGreen,
      drawStrategy
    ) where

Make sure this test file is in the same directory as your homework2.hs file. 

run GHCI in the same directory and execute the following:

>> :l testHomework2.hs
>> testAll

You can find the names for specific tests in this file. 

You might even want to copy specific expressions to GHCI and evaluate them. 

-}

import Data.List
import Data.Char
import System.IO
import System.Random
import Homework4

-- All of homework 4
testAll = and [
    testGenomeLists
  ]

($==) :: Eq a => [a] -> [a] -> Bool
($==) [] ys = ys == []
($==) (x:xs) ys = (length (x:xs) == length ys) && (elem x ys) && (xs $== (delete x ys))

--4.1 Genome Lists (40pts)
testGenomeLists = and [
    testInsertions,
    testDeletions,
    testSubstitutions,
    testTranspositions
  ]

testInsertions     = and [
    insertions "GC" $== ["AGC","GAC","GCA","GGC","GGC","GCG","CGC","GCC","GCC","TGC","GTC","GCT"]
  ]

testDeletions      = and [
    deletions "AGCT" $== ["GCT","ACT","AGT","AGC"]
  ]

testSubstitutions  = and [
    substitutions "ACT" $== ["ACT","AAT","ACA","GCT","AGT","ACG","CCT","ACT","ACC","TCT","ATT","ACT"]
  ]

testTranspositions = and [
    transpositions  "GATC" $== ["AGTC","GTAC","GACT"]
  ]

--4.2 Sorting (20pts)
testSorting = and [
    testInsertions,
    testDeletions,
    testSubstitutions,
    testTranspositions
  ]

--4.3 Game Trees (40pts)
testGameTrees = and [
    testInsertions,
    testDeletions,
    testSubstitutions,
    testTranspositions
  ]

--4.4 (Optional) Drawing Game Trees and Strategies (30pts EC)
testDrawing = and [
    testInsertions,
    testDeletions,
    testSubstitutions,
    testTranspositions
  ]
