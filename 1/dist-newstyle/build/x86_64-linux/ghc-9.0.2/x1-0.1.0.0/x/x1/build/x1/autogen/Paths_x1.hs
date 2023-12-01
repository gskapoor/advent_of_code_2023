{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_x1 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/gobind/.cabal/bin"
libdir     = "/home/gobind/.cabal/lib/x86_64-linux-ghc-9.0.2/x1-0.1.0.0-inplace-x1"
dynlibdir  = "/home/gobind/.cabal/lib/x86_64-linux-ghc-9.0.2"
datadir    = "/home/gobind/.cabal/share/x86_64-linux-ghc-9.0.2/x1-0.1.0.0"
libexecdir = "/home/gobind/.cabal/libexec/x86_64-linux-ghc-9.0.2/x1-0.1.0.0"
sysconfdir = "/home/gobind/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "x1_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "x1_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "x1_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "x1_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "x1_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "x1_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
