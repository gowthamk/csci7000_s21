---
layout: page
title: Sample Projects
permalink: /resources/
---

I listed a few problems you could take up as course projects below.
These are research problems, hence necessarily open-ended. Any
progress is valuable and would earn you points towards a grade. So
don't be deterred if a problem seems too ambitious for a course
project; if it interests you, just take it up!


## TLA+ DSL In A Functional Language

The language TLA+ is a thin veneer over the logic TLA, which itself is
a simple extension of Temporal Logic. As such TLA+ is just a syntax to
write some formal mathematics, making it ideal for quick and dirty
prototyping of system specifications. Specifications however grow in
complexity as we progressively add more details to realize
implementations. Unlike programming languages, TLA+ is unfortunately
not designed to handle the growth of complexity in software
development, making it painful to write larger and more elaborate
specifications. The aim of this project is to address this problem
from a PL standpoint. In particular, we aim to build a DSL in a
functional language that lets us write and compose TLA+ specifications
making use of the modularity features available in these languages (I
recommend OCaml or F\* as their module system is quite sophisticated.
F\* also has support for automated reasoning). The TLA+ functional DSL
would have the following features:

* **Compositional actions**: A TLA+ action is a predicate that relates
  next state to the current state. For each variable `x` in the
  specification, an action describes how the variable `x'` in next
  state relates to the variable `x` in the current state. TLA+
  actions are not compositional. For instance, let's say we define a
  `send` action:

      send(msgs,m) == msgs' = msgs \cup {m}

  And a `recv` action:

      recv(msgs, m) == /\ m \in msgs
                       /\ msgs' = msgs \ {m}

  Let's say at a later point of time we would like to define a new
  action that sends a message `m1` and receives a message `m2`, we
  cannot write `send(msgs, m1) /\ recv(msgs, m2)` as it is effectively
  equivalent to `msgs' = msgs \cup {m1}  /\ msgs' = msgs \ {m2}`,
  which evaluates to a contradiction (as `msgs'` cannot be two
  distinct values). The workaround is to write a new `sendAndRecv`
  action that sends one message and receives another. This is clearly
  unsatisfactory. We would like our TLA+ DSL to address this problem
  by letting actions be composed, for instance, as functions or
  algebraic effects.

* **Modular Specifications**: TLA+ does have a simple first-order
  module system, but complex specifications can benefit from powerful
  higher-order module systems of ML family languages. 

* **Property-directed Testing and Fuzzing**: TLA+ comes with its own
  modelchecker TLC that is general enough to check any specification
  written in Temporal Logic. The generality makes TLC comparable to
  explicit-state modelcheckers written for turing-complete languages,
  which are inturn comparable to property-directed testing and fuzzing
  frameworks. Tools of the latter kind, e.g., QuickCheck for Haskell
  and Crowbar for OCaml, have turned out to be quite effective
  in finding bugs in functional programs. Transplanting TLA+ as a DSL
  into these languages lets us apply the state-of-the-art testing and
  fuzzing techniques to distributed programs *for free*. This is an
  exciting possibility considering that TLC hasn't fundamentally
  improved in many years (to the best of my knowledge).

## Fuzz Testing Distributed Systems

[Greybox fuzzing](https://www.fuzzingbook.org/html/GreyboxFuzzer.html)
pioneered by [AFL](https://lcamtuf.coredump.cx/afl/) has been
unreasonably effective at finding deep bugs and security
vulnerabilities across a range of software applications.
Interestingly there hasn't been much work towards applying greybox
fuzzing in the context of distributed systems
([1](https://github.com/asatarin/testing-distributed-systems#fuzzing),
[2](https://project-awesome.org/cpuu/awesome-fuzzing#papers)). In this
project our aim is to explore such an application. This could be done
at multiple levels of abstraction, for e.g., on an executable
specification or on a real implementation. Either strategy would
require us to (re)engineer our distributed programs to make them
amenable for (greybox) fuzzing. For instance, fuzzers act on complete
programs, so an implementation of a distributed protocol (e.g., Paxos)
or a distributed application (e.g., e-banking) needs to be
complemented with an implementation of the underlying system model to
generate a self-contained executable to fuzz.  Furthermore, the
implementation of the system model has to expose necessary hooks to
let fuzzer explore various system-level events such as message losses,
network partitions, node crashes etc. There are many ways of doing
this, but only some would lead to effective fuzzing; talk to me to
understand why. Depending on the complexity of the fuzzing problem,
you may chose to focus either on distributed applications with an aim
of finding consistency anomalies or on distributed protocols with an
intention of finding safety and liveness violations.


## Probabilistic Error Bounds on Distributed Applications

The overarching goal is to lift the probabilistic reasoning of [Bailis
et
al](https://pages.cs.wisc.edu/~remzi/Classes/739/Fall2017/Papers/pbs-vldb2012.pdf)
to the semantic level. I will update this space with more details
shortly.
