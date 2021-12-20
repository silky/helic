module Helic.Interpreter.Agent where

import Polysemy.Tagged (Tagged, untag)

import Helic.Data.Event (Event)
import Helic.Effect.Agent (Agent (Update))

interpretAgent ::
  ∀ id r .
  (Event -> Sem r ()) ->
  InterpreterFor (Tagged id Agent) r
interpretAgent handle sem =
  interpreting (untag sem) \case
    Update e ->
      handle e
