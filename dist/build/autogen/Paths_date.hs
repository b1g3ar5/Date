module Paths_date (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,0], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "c:/Documents and Settings/Robin Seeley/workspace/bin\\bin"
libdir     = "c:/Documents and Settings/Robin Seeley/workspace/bin\\date-0.0\\ghc-7.4.2"
datadir    = "c:/Documents and Settings/Robin Seeley/workspace/bin\\date-0.0"
libexecdir = "c:/Documents and Settings/Robin Seeley/workspace/bin\\date-0.0"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "date_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "date_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "date_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "date_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
