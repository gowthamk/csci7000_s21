-------------------------------- MODULE Paxys -------------------------------
(***************************************************************************)
(* Paxys is Paxos specification that takes system-level realities into     *)
(* consideration. We let nodes crash and recover, and in the process lose  *)
(* their messages.                                                         *)
(***************************************************************************)
EXTENDS Integers (* ADD any modules you need here *)
-----------------------------------------------------------------------------

CONSTANT Value, Acceptor (* DO NOT add new parameters *)

Ballot == Nat

None == CHOOSE v : v \notin Value

(* ADD any new variables you need here *)
VARIABLE maxBal, 
         maxVBal, \* <<maxVBal[a], maxVal[a]>> is the vote with the largest
         maxVal,    \* ballot number cast by a; it equals <<-1, None>> if
                    \* a has not cast any vote.
         msgs     \* Mailboxes of all servers

vars == <<maxBal, maxVBal, maxVal, msgs (* ADD new variable names here *)>>

Message ==  (* DEFINE the type of your messages here *)

(***************************************************************************)
(* NOTE: msgs is now an array. msg[a] denotes the set of incoming messages *)
(* to node a.                                                              *)
(***************************************************************************)
TypeOK == /\ maxBal \in [Acceptor -> Ballot \cup {-1}]
          /\ maxVBal \in [Acceptor -> Ballot \cup {-1}]
          /\ maxVal \in [Acceptor -> Value \cup {None}]
          /\ msgs \in [Acceptor -> SUBSET Message] (* DO NOT change the type of msgs *)
          (* ADD the types of any new variables here *)

Init == /\ maxBal = [a \in Acceptor |-> -1]
        /\ maxVBal = [a \in Acceptor |-> -1]
        /\ maxVal = [a \in Acceptor |-> None]
        /\ msgs = [a \in Acceptor |-> {}]
        (* DEFINE the initial values of any new variables here *)

(***************************************************************************)
(*                     MOST OF YOUR CODE GOES HERE                         *)
(***************************************************************************)

(***************************************************************************)
(* DEFINE all the actions you need including:                              *)
(*      Prepare                                                            *)
(*      AckPrepare                                                         *)
(*      Accept                                                             *)
(*      AckAccept                                                          *)
(*      Learn                                                              *)
(*      Crash                                                              *)
(*      Recover                                                            *)
(***************************************************************************)


(***************************************************************************)
(* MODIFY the definition of the Next action shown below. Write it in a way *)
(* that suits the definitions of your actions. For instance if the         *)
(* definition of your learn action expects a value argument, then replace  *)
(* `\E a \in Acceptor: Learn(a)` with                                      *)
(* `\E a \in Acceptor, v \in Value: Learn (a,v)`.                          *)
(* Note: your Next predicate MUST include a Crash action and a Recover     *)
(* action                                                                  *)
(***************************************************************************)
Next == \/ \E a \in Acceptor : \/ Prepare(a)
                               \/ AckPrepare(a)
                               \/ Accept(a)
                               \/ AckAccept(a)
                               \/ Learn(a)
                               \/ Crash(a)
                               \/ Recover(a)

Spec == Init /\ [][Next]_vars

Inv == /\ TypeOK
       (* Agreement condition goes here. It will likely be same as what your wrote in Paxos.tla *)

============================================================================