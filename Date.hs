
module Date
    (
        clock2UTC
        , ftpInt2UTC
    ) where

import System.Time
import Data.Time.Calendar (fromGregorian)
import Data.Time.Clock

clock2UTC::ClockTime->UTCTime
clock2UTC clktm = UTCTime (fromGregorian yy mm dd) dt
                where
                    caltm = toUTCTime clktm
                    yy = toInteger $ ctYear caltm
                    mm = 1 + (fromEnum $ ctMonth caltm)
                    dd = ctDay caltm
                    hh = toInteger $ ctHour caltm
                    mmm = toInteger $ ctMin caltm
                    ss = toInteger $ ctSec caltm
                    dt = secondsToDiffTime $ ((hh*60+mmm)*60)+ss

ftpInt2UTC::Integer->UTCTime
ftpInt2UTC fint = UTCTime gday dt
    where
        yy = floor $ (fromInteger fint)/10000000000
        mm = (floor $ (fromInteger fint)/100000000) - yy*100
        dd = (floor $ (fromInteger fint)/1000000) - yy*10000 - mm*100
        hh = (floor $ (fromInteger fint)/10000) - yy*1000000 - mm*10000 - dd*100
        ms = (floor $ (fromInteger fint)/100) - yy*100000000 - mm*1000000 - dd*10000 - hh*100
        ss = (floor $ (fromInteger fint)) - yy*10000000000 - mm*100000000 - dd*1000000 - hh*10000 - ms*100
        gday = fromGregorian yy (fromInteger mm) (fromInteger dd)
        dt = secondsToDiffTime $ (hh*60 + ms)*60+ss
                    
                    