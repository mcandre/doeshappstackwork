#!/usr/bin/env runhaskell

{-# LANGUAGE OverloadedStrings #-}

module Main where

import Happstack.Server (nullConf, simpleHTTP, ok, toResponse)
import Prelude hiding (head, id, div)
import Text.Blaze.Html5 hiding (map, style)
import Text.Blaze.Html5.Attributes hiding (title)
import Text.Blaze.Renderer.Utf8 (renderHtml)

import Data.String.Utils (join)
import System.Info (os, arch, compilerName, compilerVersion)
import Data.Version (versionBranch)

page :: Html
page = docTypeHtml $ do
	head $ do
		title "Does Happstack Work?"
		meta ! httpEquiv "Content-Type" ! content "text/html;charset=utf-8"
	body ! style "text-align: center;" $ do
		p $ a ! href "https://github.com/mcandre/doeshappstackwork" $ "GitHub"
		h1 "Does Happstack Work?"
		p "You betcha!"
		h2 "Implementation"
		p $ toHtml $ compilerName ++ " " ++ (join "." . map show . versionBranch) compilerVersion
		h2 "Operating System"
		p $ toHtml $ case os of
			"darwin" -> "Mac OS X"
			"unix" -> "Unix"
			"linux" -> "Linux"
			"mingw" -> "Windows"
			"cygwin" -> "Windows"
			"windows" -> "Windows"
			x -> x

main :: IO ()
main = (simpleHTTP nullConf . ok . toResponse) page