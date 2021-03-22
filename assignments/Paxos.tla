-------------------------------- MODULE Paxos -------------------------------
(***************************************************************************)
(* Paxos algorithm without explicit leaders or learners.                   *)
(***************************************************************************)
EXTENDS Integers
-----------------------------------------------------------------------------
(***************************************************************************)
(* The constant parameters:                                                *)
(*      Value: The set of proposable values                                *)
(*      Acceptor: The set of acceptors (which is also the set of all nodes)*)
(*      Quorum: The set of all quorums possible with given Acceptor set    *)
(***************************************************************************)
CONSTANT Value, Acceptor, Quorum

ASSUME QuorumAssumption == /\ \A Q \in Quorum : Q \subseteq Acceptor
                           /\ \A Q1, Q2 \in Quorum : Q1 \cap Q2 # {} 

(*************************************************************************)
(* The Ballot set is the set of all Naturals                             *)
(*************************************************************************)

Ballot ==  Nat

(*************************************************************************)
(* None is an unspecified value that is not a ballot number.             *)
(*************************************************************************)

None == CHOOSE v : v \notin Value
  
(***************************************************************************)
(* Paxos is a message-passing algorithm, so we begin by defining the set    *)
(* Message of all possible messages.  The messages are explained below     *)
(* with the actions that send them.                                        *)
(***************************************************************************)
Message ==      [type : {"PREPARE"}, bal : Ballot]
           \cup [type : {"ACK_PREPARE"}, acc : Acceptor, bal : Ballot, 
                 mbal : Ballot \cup {-1}, mval : Value \cup {None}]
           \cup [type : {"ACCEPT"}, bal : Ballot, val : Value]
           \cup [type : {"ACK_ACCEPT"}, acc : Acceptor, bal : Ballot, val : Value]
-----------------------------------------------------------------------------
VARIABLE maxBal, 
         maxVBal, \* <<maxVBal[a], maxVal[a]>> is the vote with the largest
         maxVal,    \* ballot number cast by a; it equals <<-1, None>> if
                    \* a has not cast any vote.
         msgs     \* The set of all messages that have been sent.

(***************************************************************************)
(* In this formulation of the Paxos algorithm, we use variable msgs to     *) 
(* represent the set of all messages that have ever been generated.        *)
(* Obviously we would not have such a set in a real implementation, but    *)   
(* this being an abstract specification allows us to use fictitious        *)
(* artifacts to let us focus on the crux of Paxos.                         *)      
(***************************************************************************)

vars == <<maxBal, maxVBal, maxVal, msgs>>
  
(***************************************************************************)
(* The type invariant and initial predicate.                               *)
(***************************************************************************)
TypeOK == /\ maxBal \in [Acceptor -> Ballot \cup {-1}]
          /\ maxVBal \in [Acceptor -> Ballot \cup {-1}]
          /\ maxVal \in [Acceptor -> Value \cup {None}]
          /\ msgs \subseteq Message
          

Init == /\ maxBal = [a \in Acceptor |-> -1]
        /\ maxVBal = [a \in Acceptor |-> -1]
        /\ maxVal = [a \in Acceptor |-> None]
        /\ msgs = {}

(***************************************************************************)
(* The actions.  We begin with the subaction (an action that will be used  *)
(* to define the actions that make up the next-state action.               *)
(***************************************************************************)
Send(m) == msgs' = msgs \cup {m}

(***************************************************************************)
(* The Prepare Action                                                      *)
(***************************************************************************)
Prepare(b) == /\ Send([type |-> "PREPARE", bal |-> b])
              /\ UNCHANGED <<maxBal, maxVBal, maxVal>>
                 
(***************************************************************************)
(* The AckPrepare Action                                                   *)
(***************************************************************************)
AckPrepare(a) == /\ \E m \in msgs : 
                  /\ m.type = "PREPARE"
                  /\ m.bal > maxBal[a]
                  /\ maxBal' = [maxBal EXCEPT ![a] = m.bal]
                  /\ Send([type |-> "ACK_PREPARE", acc |-> a, bal |-> m.bal, 
                            mbal |-> maxVBal[a], mval |-> maxVal[a]])
              /\ UNCHANGED <<maxVBal, maxVal>>

(***************************************************************************)
(* The Accept Action                                                       *)
(***************************************************************************)
Accept(b, v) ==
  /\ \E Q \in Quorum :
        LET Q1b == {m \in msgs : /\ m.type = "ACK_PREPARE"
                                 /\ m.acc \in Q
                                 /\ m.bal = b}
            Q1bv == {m \in Q1b : m.mbal \geq 0}
        IN  /\ \A a \in Q : \E m \in Q1b : m.acc = a 
            /\ \/ Q1bv = {}
               \/ \E m \in Q1bv : 
                    /\ m.mval = v
                    /\ \A mm \in Q1bv : m.mbal \geq mm.mbal 
  /\ Send([type |-> "ACCEPT", bal |-> b, val |-> v])
  /\ UNCHANGED <<maxBal, maxVBal, maxVal>>
  
(***************************************************************************)
(* The AckAccept Action                                                    *)
(***************************************************************************)
AckAccept(a) == \E m \in msgs : /\ m.type = "ACCEPT"
                              /\ m.bal \geq maxBal[a]
                              /\ maxBal' = [maxBal EXCEPT ![a] = m.bal] 
                              /\ maxVBal' = [maxVBal EXCEPT ![a] = m.bal] 
                              /\ maxVal' = [maxVal EXCEPT ![a] = m.val]
                              /\ Send([type |-> "ACK_ACCEPT", acc |-> a,
                                       bal |-> m.bal, val |-> m.val])

(***************************************************************************)
(* In an implementation, there will be learner processes that learn from   *)
(* the AckAccept messages if a value has been chosen.  In part 1 of the    *)
(* assignment, you are asked to define a learning phase that idenfies the  *)
(* value learned.                                                          *)
(***************************************************************************)

(*
Learn(??) == what-goes-here>
*)

(***************************************************************************)
(* Below are defined the next-state action and the complete spec.          *)
(***************************************************************************)
Next == \/ \E b \in Ballot : \/ Prepare(b)
                             \/ \E v \in Value : Accept(b, v)
        \/ \E a \in Acceptor : AckPrepare(a) \/ AckAccept(a)

Spec == Init /\ [][Next]_vars

(***************************************************************************)
(* An invariant is a predicate (a boolean condition) that is true in every *)
(* state reachable by the Spec above. TypeOk is one such predicate that    *)
(* checks if you are using the spec variables in a type-safe fashion.      *)
(* Assigment Part 1 requires you to add one more predicate that checks the *)
(* function correctness of Paxos, i.e., that only one value can ever be    *)
(* decided by the algorithm. *)
(***************************************************************************)
Inv == /\ TypeOK
       (* /\ what-goes-here? *)
============================================================================
