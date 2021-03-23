---
layout: page
title: Assignment 1
permalink: /assignments/
---

Assignment 1 builds on our classroom discussions on the Paxos
consensus algorithm, the TLA+ specification language, and the TLC
modelchecker. The aim is to get a first-hand experience writing formal
specifications distributed protocols and to modelcheck them
effectively. The assignment has two parts described below. All the
files linked below can be found
[here](https://github.com/gowthamk/csci7000_s21/tree/gh-pages/assignments).
Submission instructions can be found at the end of this page. **Due date
is Sunday 4/11/2021**.

Part 1: Define Agreement as an invariant and fix the Paxos spec (10 pts)
======

Below is an abstract specification of Paxos in TLA+. As you know there
are three roles a node can take in Paxos - proposer, acceptor, and
learner. The specification shown below does not distinguish between
these roles for the sake of simplicity. Every acceptor can also be a
proposer and a learner. The spec is parameterized on the constants
`Value`, `Acceptor`, and `Quorum`, which denote the set of proposable
values, the set of acceptors (which is also the set of all nodes), and
the set of all possible quorums respectively. Like the FLP proof we
discussed in class, our Paxos specification uses a set `msgs` to
denote the set of all messages that were ever exchanged. The initial
state is defined using the predicate `Init`. Paxos works in two
phases, and the four steps corresponding to these two phases are
defined as TLA actions named `Prepare`, `AckPrepare`, `Accept`, and
`AckAccept`. The top-level Paxos spec (sort of like a main function)
is defined by the temporal predicate named `Spec`, which says that a
Paxos machine is either in the `Init` state, or is in one of the
states reachable by the repeated application of the `Next`, which is a
disjunction of the aforementioned four actions.

<script src="https://gist-it.appspot.com/github/gowthamk/csci7000_s21/blob/gh-pages/assignments/Paxos.tla"></script>

To ensure that a specification we write is correct, we also write down
the properties that we expect the spec has to satisfy and formally
prove or modelcheck these properties. A property that is expected to
be true in every reachable state of the specification is called an
invariant. The above spec defines an invariant `Inv` consisting
of a single predicate `TypeOK` that simply asserts the invariance of
types of all the spec variables. While type safety is desirable, that
is not the main property of interest in Paxos. The key invariant we
require our spec to enforce is the Agreement (or Consensus) property
which asserts that no two distinct values can ever be chosen by the
algorithm. **Your first objective is to formally define the
Agreement/Consensus property in the context of the above spec, and add
it as a predicate to `Inv`**. Towards this end, you might have to add
a `Learn` phase to the above spec that identifies the consensus value,
i.e., the value to which the majority of nodes voted. Your definition
of Agreement property must assert that there can only ever be one
consensus value.

How can you check that your work is correct? TLC modelchecker comes to
the rescue. TLC lets you instantiate the parameters of your model with
finite values and exhaustively check the spec over the resultant state
space. For the Paxos spec above, you will have to instantiate the
constants `Value`, `Acceptor`, and `Quorum` with finite sets and run
TLC checker over the resultant config. The following two files,
`MCPaxos.tla` and `MCPaxos.cfg`, would help you do that.

<script src="https://gist-it.appspot.com/github/gowthamk/csci7000_s21/blob/gh-pages/assignments/MCPaxos.tla"></script>

<script src="https://gist-it.appspot.com/github/gowthamk/csci7000_s21/blob/gh-pages/assignments/MCPaxos.cfg"></script>

`MCPaxos.cfg` is the configuration file that TLC needs. We also had to
add `MCPaxos.tla` because TLC's CFG language is impoverished and we
need TLA's powerful expression language to define the instantiation of
`Quorum` sets. To modelcheck the spec in `Paxos.tla` you will have to
run TLC on `MCPaxos.tla` (which extends Paxos spec with the
definitions needed for modelchecking) while providing `MCPaxos.cfg` as
the configuration file. You can do it using either the TLA toolbox or
the TLA+ VS code plugin; you figure out the details.

Recall that `TypeOK` is the only invariant we assert in the above
Paxos spec. The spec is type correct, so running TLC over it would
simply warm your CPU without finding anything interesting. However, if
you correctly extend the spec with a `Learn` action and an `Agreement`
invariant (as a new conjunct to `Inv`), you *will* find a violation of
agreement in a counterexample returned by TLC. Indeed the above spec
is buggy! **Your second objective is to examine the counterexample
returned by TLC, find out what's wrong with the spec, and fix the
bug**. Make sure that your fix does not introduce any new bugs;
running TLC over your spec should simply loop. Your submission must
include all three files -- `Paxos.tla`, `MCPaxos.tla`, and
`MCPaxos.cfg`.

Part 2: Define a Paxos System (Paxys) (15pts)
===============

The Paxos specification we defined above is too abstract -- the nodes
never seem to crash or reboot and messages never seem to be lost.
Furthermore there is this set `msgs` of all messages that were ever
exchanges which is clearly a fictitious artifact. In Part 2 of this
assignment we are going to write a more concrete specification of
Paxos that captures some of the system-level realities. We call this
spec *Paxys* -- the Paxos System. Boilerplate `Paxys.tla` is shown
below:

<script src="https://gist-it.appspot.com/github/gowthamk/csci7000_s21/blob/gh-pages/assignments/Paxys.tla"></script>

**Your objective in this part is to write and modelcheck a Paxos System
spec** that differs from the spec in Part 1 in following ways:

1. There is no longer a set of all messages ever exchanged. Instead,
   `msgs` is an array indexed by `Acceptor`. For an acceptor `a`,
   `msgs[a]` must hold the set of all inbound messages at `a`.
2. Along with the usual Paxos actions, there are now two new actions-
   `Crash` and `Recover` that must be included in the `Next` spec.
   `Crash` and `Recover` are triggered non-deterministically. A
   crashed node must be out of action until a `Recover` action is
   triggered on the same node. Importantly, **a crashed node loses a
   portion of its local state that is not written to a stable
   storage**. The local state of an acceptor `a` consists of
   `msgs[a]`, `maxBal[a]`, `maxVBal[a]`, `maxVal[a]`, and anything
   else you might have newly added to the spec. When `a` crashes you
   might reset some of these to their initial values, while leaving the
   rest intact. The former set of variables are said to hold the state
   that is volatile, whereas the latter can be thought of as the state
   that `a` stores in its stable storage (but otherwise there is no
   difference between both kind of variables; you don't have to
   explicitly model a stable storage). **Your objective is to write
   Paxys in a way that minimizes the stable storage while still being
   functionally correct**. This exercise would help us understand the
   requirements of a machine participating in Paxos.
3. `Quorum` is no longer a module parameter. Instead consider any
   subset of `Acceptor` that has a majority of nodes as a quorum. You
   can achieve this effect with help of a `IsQuorum` predicate that
   takes a subset of `Acceptor` and returns true if it's a quorum.
4. Like in the Part 1, the Paxys spec must satisfy the invariant `Inv`
   consisting of two predicates -- one asserting type safety
   (`TypeOK`) and other asserting the agreement property ("only one
   value can ever be chosen").

Use TLC to continuously check your work. Like in the Part 1, you would
need a `MCPaxys.tla` and a `MCPaxys.cfg` to run TLC on Paxys. Build
these files yourself using the corresponding Paxos files as templates.
Please do not add any new module parameters to Paxys. Instantiate
`Acceptor`, `Value`, and `Ballot` with finite sets in your MC files.
Keep these sets small to contain the state space of modelchecking.


Submission
==========

Your submission must be a tar ball consisting of seven files:

1. Paxos.tla, MCPaxos.tla, and MCPaxos.cfg, and
2. Paxys.tla, MCPaxys.tla, and MCPaxys.cfg, and
3. A README.md file to help me understand your solution.

Please e-mail your submissions to me before 11th April (Sunday). Good
luck!


