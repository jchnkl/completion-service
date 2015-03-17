import Control.Applicative ((<$>))
import Data.Char (ord)
import Network.Wai.Handler.Warp (Port)
import Rest.Service
import System.Environment
import Web.Scotty (json)
import qualified Completion.Engine as E
import qualified Data.ByteString.Char8 as BS

defaultPort :: Port
defaultPort = foldr1 (+) $ map ord "completion-service" -- 1880

defaultDictionary :: FilePath
defaultDictionary = "/usr/share/dict/cracklib-small"

service :: FilePath -> Port -> IO ()
service fp p = do
    graph <- E.buildGraph . map BS.unpack . BS.words <$> BS.readFile fp
    runService p "complete" $ json . flip E.complete graph

main :: IO ()
main = do
    args <- getArgs
    case length args of
        1 -> service defaultDictionary (readPort args)
        2 -> service (head . drop 1 $ args) (readPort args)
        _ -> service defaultDictionary defaultPort
    where
    readPort args = read (head args) :: Port
