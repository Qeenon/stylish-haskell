--------------------------------------------------------------------------------
module StylishHaskell.LanguagePragmas.Tests
    ( tests
    ) where


--------------------------------------------------------------------------------
import           Test.Framework                 (Test, testGroup)
import           Test.Framework.Providers.HUnit (testCase)
import           Test.HUnit                     ((@=?))


--------------------------------------------------------------------------------
import           StylishHaskell.LanguagePragmas
import           StylishHaskell.Tests.Util


--------------------------------------------------------------------------------
tests :: Test
tests = testGroup "StylishHaskell.LanguagePragmas.Tests"
    [ case01
    ]


--------------------------------------------------------------------------------
case01 :: Test
case01 = testCase "case 01" $ expected @=? testStylish stylish input
  where
    input = unlines
        [ "{-# LANGUAGE ViewPatterns #-}"
        , "{-# LANGUAGE TemplateHaskell, ViewPatterns #-}"
        , "{-# LANGUAGE ScopedTypeVariables #-}"
        , "module Main where"
        ]

    expected = unlines
        [ "{-# LANGUAGE ScopedTypeVariables, TemplateHaskell, ViewPatterns #-}"
        , "module Main where"
        ]