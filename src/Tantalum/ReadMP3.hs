module Tantalum.ReadMP3
(
    MP3(..)
  , readMP3
) where

import qualified Data.ByteString as DB

data MP3 = MP3 {
    meta   :: ID3
  , frames :: [Frame]
}

-- | Data structure for holding the ID3 meta data for an MP3
--   * v1 comes at the end of the file
--   * v2 comes at the beginning
--   * there are many other differences
data ID3 = ID3v1 | ID3v2
                        
data Frame
  = Frame
    Header -- ^ Meta data for this frame
    Audio  -- ^ A standin for the raw data. I'll specialize this later.

type Audio = DB.ByteString

data MPEGVersion = MPEG1 | MPEG2 | MPEG3 | MPEG4

data MPEGLayer = LayerI | LayerII | LayerIII | LayerUndefined

data ChannelMode = Stereo | JointStereo | DualChannel | SingleChannel

data Header = Header {
    header_frame_sync     :: Int         -- 11
  , header_mpeg_version   :: MPEGVersion -- 2
  , header_mpeg_layer     :: MPEGLayer   -- 2
  , header_protection     :: Bool        -- 1
  , header_bitrate_index  :: Int         -- 4
  , header_sampling_rate  :: Int         -- 2
  , header_padding        :: Bool
  , header_private        :: Bool
  , header_channel_mode   :: ChannelMode
  , header_mode_extension :: Int         -- 2
  , header_whatever       :: Bool
  , header_original       :: Bool
  , header_emphasis       :: Int         -- 2
}


readMP3 :: DB.ByteString -> Either String MP3
readMP3 = undefined
