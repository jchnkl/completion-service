import qualified Completion.Config as Completion
import qualified Completion.Service as Completion

main :: IO ()
main = Completion.service Completion.defaultPort
