-------------------------------- MODULE MCPaxos -------------------------------
EXTENDS Paxos, TLC, FiniteSets
-----------------------------------------------------------------------------
ValueSet == 1..5
QuorumSet == {s \in SUBSET Acceptor : 2*Cardinality(s) > Cardinality(Acceptor)}
BallotSet == {1,2}
============================================================================