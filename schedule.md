---
layout: page
title: Schedule
permalink: /schedule/
---

Below is a tentative schedule. Lectures 1-10 and 17 will be taught by me (Gowtham Kaki), while the rest are student-led paper discussions. Lecture slides will be posted after each lecture.  

<table id="schedule">
<thead>
  <tr>
    <th class="seqno">Lecture</th>
    <th class="date">Date</th>
    <th class="topic">Topic</th>
    <th class="reading">Recommended Reading</th>
  </tr>
</thead>
<tbody>
  <tr class="lecture">
    <td class="tg-baqh">1</td>
    <td class="tg-0lax">01/14/2021</td>
    <td class="tg-0lax"><a href="../lectures/Lec1.pdf">Introduction and Logistics</a></td>
    <td class="tg-0lax">Google's <a href="../docs/google-intro.pdf">Introduction to Distributed Systems Design</a>. <br>
                        Newcombe et al, <a href="http://lamport.azurewebsites.net/tla/formal-methods-amazon.pdf">Use of Formal Methods at AWS</a>. <br>
                        Leesatapornwongsa et al, <a href="https://www.usenix.org/system/files/conference/osdi14/osdi14-paper-leesatapornwongsa.pdf">SAMC: Semantic-Aware
                        Model Checking for Fast Discovery of Deep Bugs
                        in Cloud Systems</a>, OSDI'14.
  </td>
  </tr>
  <tr class="module">
    <td class="tg-baqh" colspan="5">Review of Fundamental Results</td>
  </tr>
  <tr class="lecture">
    <td class="tg-baqh">2</td>
    <td class="tg-0lax">1/19/2021</td>
    <td class="tg-0lax"><a href="../lectures/Lec2.pdf">Asynchronous Model of a Distributed System <br>
                        Failure Modes<br>
                        Time - Ordering of events</a>
                        [<a href="https://www.youtube.com/watch?v=iJmisIwH-fs">Video</a>]
    </td>
    <td class="tg-0lax">Lamport, <a href="http://www.cs.cornell.edu/courses/cs614/2004sp/papers/Lam78.pdf">Time, Clocks, and the Ordering of Events in a Distributed System</a>, CACM, 1978</td>
  </tr>
  <tr class="lecture">
    <td class="tg-baqh">3</td>
    <td class="tg-0lax">1/21/2021</td>
    <td class="tg-0lax"> <a href="../lectures/Lec3.pdf">Happens-before,
                          Lamport timestamps, Vector clocks</a>
                        [<a href="https://youtu.be/awdMjNTD-i4">Video</a>]
    </td>
    <td class="tg-0lax">
      Lamport, <a href="http://www.cs.cornell.edu/courses/cs614/2004sp/papers/Lam78.pdf">Time, Clocks, and the Ordering of Events in a Distributed System</a>, CACM, 1978
    </td>
  </tr>
  <tr class="lecture">
    <td class="tg-baqh">4</td>
    <td class="tg-0lax">1/26/2021</td>
    <td class="tg-0lax"> <a href="../lectures/Lec4.pdf">FLP Impossibility</a>
                        [<a href="https://youtu.be/blyeB4e2e2A">Video</a>]
    </td>
    <td class="tg-0lax">
      Fischer et al, <a href="https://groups.csail.mit.edu/tds/papers/Lynch/jacm85.pdf">Impossibility of Distributed Consensus with One Faulty Process</a>, JACM, 1985. <br>
    </td>
  </tr>
  <tr class="lecture">
    <td class="tg-baqh">5</td>
    <td class="tg-0lax">1/28/2021</td>
    <td class="tg-0lax"> <a href="../lectures/Lec5.pdf">FLP Impossibility (contd.), CAP, PACELC</a><br />
                        [<a href="https://youtu.be/dq5JwMMih-8">Video</a>]
    </td>
    <td class="tg-0lax">
      Lynch et al, <a href="https://users.ece.cmu.edu/~adrian/731-sp04/readings/GL-cap.pdf">Brewer's Conjecture and the Feasibility of Consistent, Available, Partition-Tolerant Web Services</a>, ACM SIGACT News, 2002. <br>
      Abadi, <a href="http://www.cs.umd.edu/~abadi/papers/abadi-pacelc.pdf">Consistency Tradeoffs in Modern Distributed Database System Design: CAP is Only Part of the Story</a>, IEEE Computer, 2012.
    </td>
  </tr>
  <tr class="module">
    <td class="tg-baqh" colspan="5">Review of Distributed Algorithms</td>
  </tr>
  <tr class="lecture">
    <td class="tg-baqh">6</td>
    <td class="tg-0lax">2/2/2021</td>
    <td class="tg-0lax"><a href="../lectures/Lec6.pdf">Two-Phase Commit (2PC), Introduction to TLA+ &amp; PlusCal</a>
                        [<a href="https://youtu.be/00HxGtWaYhM">Video</a>]
    </td>
    <td class="tg-0lax">
      Lamport, <a href="https://lamport.azurewebsites.net/video/consensus-on-transaction-commit.pdf">Consensus on Transaction Commit</a>, ACM
      Transactions on Databases.<br>
      Hillel Wayne's <a href="https://learntla.com/introduction/">TLA+ & PlusCal Tutorials</a>. <br>
    </td>
  </tr>
  <tr class="lecture">
    <td class="tg-baqh">7</td>
    <td class="tg-0lax">2/4/2021</td>
    <td class="tg-0lax"><a href="../lectures/Lec7.pdf">2PC in TLA+ &amp; PlusCal</a>
                        [<a href="https://youtu.be/B2vzCg9kiFk">Video</a>]
    </td>
    <td class="tg-0lax">
      Lamport, <a href="https://lamport.azurewebsites.net/video/consensus-on-transaction-commit.pdf">Consensus on Transaction Commit</a>, ACM
      Transactions on Databases.<br>
      Marc Brooker's <a href="https://brooker.co.za/blog/2013/01/20/two-phase.html">Exploring TLA+ with two-phase commit</a>. <br>
      Murat Demirbas's <a href="http://muratbuffalo.blogspot.com/2017/12/tlapluscal-modeling-of-2-phase-commit.html">TLA+/Pluscal modeling of 2-phase commit transactions</a>.
    </td>
  </tr>
  <tr class="lecture">
    <td class="tg-baqh">8</td>
    <td class="tg-0lax">2/9/2021</td>
    <td class="tg-0lax"><a href="../lectures/Lec8.pdf">Paxos</a>
                        [<a href="https://youtu.be/hyRfja2InDg">Video</a>]
    </td>
    <td class="tg-0lax">
      Lamport, <a href="https://lamport.azurewebsites.net/pubs/paxos-simple.pdf">Paxos Made Simple</a>, ACM SIGACT News, 2001. <br>
      Chandra et al, <a href="http://www.read.seas.harvard.edu/~kohler/class/08w-dsi/chandra07paxos.pdf">Paxos Made Live: An Engineering Perspective</a>, PODC'07. <br>
    </td>
  </tr>
  <tr class="lecture">
    <td class="tg-baqh">9</td>
    <td class="tg-0lax"></td>
    <td class="tg-0lax"> <a href="../lectures/Lec9.pdf">SC Replication, CRDTs, CALM</a>
                        [<a href="https://youtu.be/2TzHflsRlwQ">Video</a>]
    </td>
    <td class="tg-0lax">
      Shapiro et al, <a href="https://hal.inria.fr/inria-00609399v1/document">Conflict-free Replicated Data Types</a>, HAL TR. <br>
      Hellerstein et al, <a href="https://cacm.acm.org/magazines/2020/9/246941-keeping-calm/fulltext">Keeping CALM: When Distributed Consistency is Easy</a>, CACM Sep 2020.
    </td>
  </tr>
  <!-- tr class="lecture">
    <td class="tg-baqh">10</td>
    <td class="tg-0lax"></td>
    <td class="tg-0lax">Byzantine Generals Problem <br>
                        BFT Consensus</td>
    <td class="tg-0lax">
      Lamport, <a href="https://people.eecs.berkeley.edu/~luca/cs174/byzantine.pdf">The Byzantine Generals Problem</a>, TOPLAS'82. <br>
      Malkhi et al, <a href="https://dahliamalkhi.files.wordpress.com/2015/12/byzquorums-distcomputing1998.pdf">Byzantine Quorum Systems</a>, Distributed Computing, 1998.
      Castro et al, <a href="http://pmg.csail.mit.edu/papers/osdi99.pdf">Practical Byzantine Fault Tolerance</a>, OSDI'99.
    </td>
  </tr -->
  <tr class="module">
    <td class="tg-baqh" colspan="5">Verification Techniques</td>
  </tr>
  <tr class="lecture">
    <td class="tg-baqh">10</td>
    <td class="tg-0lax"></td>
    <td class="tg-0lax">Hoare Logic<br>Rely-Guarantee</td>
    <td class="tg-0lax">
      Chapters 1 & 2 of Mike Gordon's <a href="https://www.cl.cam.ac.uk/archive/mjcg/HL/Notes/Notes.pdf">Background Reading on Hoare Logic</a>. <br>
      Feng, <a href="https://cs.nju.edu.cn/xyfeng/research/publications/LRG.pdf">Local Rely-Guarantee Reasoning</a>, POPL'09.
    </td>
  </tr>
  <tr class="lecture">
    <td class="tg-baqh">11</td>
    <td class="tg-0lax"></td>
    <td class="tg-0lax">Refinement Proof Technique<br>Proof automation</td>
    <td class="tg-0lax">
      Lynch, <a href="http://groups.csail.mit.edu/tds/papers/Lynch/REX94.pdf">Simulation Techniques for Proving Properties of Real-Time Systems</a>, 1993.
    </td>
  </tr>
  <tr class="module">
    <td class="tg-baqh" colspan="5">Paper Discussions - Distributed Systems Verification</td>
  </tr>
  <tr class="lecture">
    <td class="tg-baqh">12</td>
    <td class="tg-0lax"></td>
    <td class="tg-0lax">
      Hawblitzel et al, <a href="https://www.andrew.cmu.edu/user/bparno/papers/ironfleet.pdf">IronFleet: Proving Practical Distributed Systems Correct</a>, SOSP'15.
    </td>
    <td class="tg-0lax"></td>
  </tr>
  <tr class="lecture">
    <td class="tg-baqh">13</td>
    <td class="tg-0lax"></td>
    <td class="tg-0lax">
      Wilcox et al, <a href="https://homes.cs.washington.edu/~ztatlock/pubs/verdi-wilcox-pldi15.pdf">Verdi: A Framework for Implementing and Formally Verifying Distributed Systems</a>, PLDI'15.
    </td>
    <td class="tg-0lax"></td>
  </tr>
  <tr class="lecture">
    <td class="tg-baqh">14</td>
    <td class="tg-0lax"></td>
    <td class="tg-0lax">
      Padon et al, <a href="https://cs.stanford.edu/~padon/ivy.pdf">Ivy: Safety Verification by Interactive Generalization</a>, PLDI'16<br>
    </td>
    <td class="tg-0lax"></td>
  </tr>
  <tr class="lecture">
    <td class="tg-baqh">15</td>
    <td class="tg-0lax"></td>
    <td class="tg-0lax">
      Gleissenthall et al, <a href="https://dl.acm.org/doi/10.1145/3290372">Pretend Synchrony: Synchronous Verification of Asynchronous Distributed Programs</a>, POPL'19.
    </td>
    <td class="tg-0lax"></td>
  </tr>
  <!-- tr class="lecture">
    <td class="tg-baqh">14</td>
    <td class="tg-0lax"></td>
    <td class="tg-0lax">
      Padon et al, <a href="https://dl.acm.org/doi/10.1145/3158114">Reducing Liveness to Safety in First-Order Logic</a>, POPL'18.
    </td>
    <td class="tg-0lax"></td>
  </tr -->
  <tr class="lecture">
    <td class="tg-baqh">16</td>
    <td class="tg-0lax"></td>
    <td class="tg-0lax">
      Ma et al, <a href="https://web.eecs.umich.edu/~barisk/public/i4.pdf">I4: Incremental Inference of Inductive Invariants for Verification of Distributed Protocols</a>, SOSP'19.
    </td>
    <td class="tg-0lax"></td>
  </tr>
  <tr class="module">
    <td class="tg-baqh" colspan="5">From Distributed Systems to Distributed Applications</td>
  </tr>
  <tr class="lecture">
    <td class="tg-baqh">17</td>
    <td class="tg-0lax"></td>
    <td class="tg-0lax">Geo-Replication & Replicated Data Types</td>
    <td class="tg-0lax">
      DeCandia et al, <a href="https://www.allthingsdistributed.com/files/amazon-dynamo-sosp2007.pdf">Dynamo: Amazon’s Highly Available Key-Value Store</a>, SOSP'07. <br>
      Shapiro et al, <a href="https://hal.inria.fr/hal-00932836/file/CRDTs_SSS-2011.pdf">Conflict-free Replicated Data Types</a>, 2011.<br>
      Kaki et al, <a href="https://kcsrk.info/papers/snapl19-mrdt.pdf">Version Control is For Your Data Too</a>, SNAPL'19.
    </td>
  </tr>
  <tr class="module">
    <td class="tg-baqh" colspan="5">Paper Discussions - Distributed Applications Verification</td>
  </tr>
  <tr class="lecture">
    <td class="tg-baqh">18</td>
    <td class="tg-0lax"></td>
    <td class="tg-0lax">
      Sivaramakrishnan et al, <a href="https://www.cs.purdue.edu/homes/suresh/papers/pldi15.pdf">Declarative Programming over Eventually Consistent Data Stores</a>, PLDI'15.
    </td>
    <td class="tg-0lax"></td>
  </tr>
  <tr class="lecture">
    <td class="tg-baqh">19</td>
    <td class="tg-0lax"></td>
    <td class="tg-0lax">
      Bailis et al, <a href="http://pbs.cs.berkeley.edu/pbs-vldb2012.pdf">Probabilistically Bounded Staleness for Practical Partial Quorums</a>, VLDB'12.
    </td>
    <td class="tg-0lax"></td>
  </tr>
  <tr class="lecture">
    <td class="tg-baqh">20</td>
    <td class="tg-0lax"></td>
    <td class="tg-0lax">
      1. Nakamoto, <a href="https://bitcoin.org/bitcoin.pdf">Bitcoin: A Peer-to-Peer Electronic Cash System</a>, 2008<br>
      2. Garay et al, <a href="https://link.springer.com/content/pdf/10.1007%2F978-3-662-46803-6_10.pdf">The Bitcoin Backbone Protocol: Analysis and Applications</a>, EUROCRYPT'15.
    </td>
    <td class="tg-0lax"></td>
  </tr>
  <tr class="lecture">
    <td class="tg-baqh">21</td>
    <td class="tg-0lax"></td>
    <td class="tg-0lax">Wood, <a href="https://gavwood.com/paper.pdf">Ethereum: A Secure Decentralised Generalised Transaction Ledger</a>, 2014</td>
    <td class="tg-0lax"><a href="https://ethereum.org/en/whitepaper/">Ethereum White Paper</a></td>
  </tr>
  <!-- tr class="lecture">
    <td class="tg-baqh">20</td>
    <td class="tg-0lax"></td>
    <td class="tg-0lax">Blockchain Security Survey (Li et al, Arxiv)</td>
    <td class="tg-0lax"></td>
  </tr -->
  <tr class="lecture">
    <td class="tg-baqh">22</td>
    <td class="tg-0lax"></td>
    <td class="tg-0lax">
      Brent et al, <a href="https://yanniss.github.io/ethainter-pldi20.pdf">Ethainter: A Smart Contract Security Analyzer for Composite Vulnerabilities</a>, PLDI'20.
    </td>
    <td class="tg-0lax">
      Li et al, <a href="https://arxiv.org/abs/1802.06993">A Survey on the Security of Blockchain Systems</a>, arXiv:1802.06993.
    </td>
  </tr>
  <tr class="lecture">
    <td class="tg-baqh">23</td>
    <td class="tg-0lax"></td>
    <td class="tg-0lax">
      1. Bonneau et al, <a href="https://eprint.iacr.org/2020/352.pdf">Coda: Decentralized Cryptocurrency at Scale</a>, 2018.<br>
      2. Meckler, <a href="https://codaprotocol.com/blog/snarky-a-high-level-language-for-verifiable-computation">Snarky: A High-Level Language for Verifiable Computation</a>, 2018.
    </td>
    <td class="tg-0lax"></td>
  </tr>
  <tr class="lecture">
    <td class="tg-baqh">24</td>
    <td class="tg-0lax"></td>
    <td class="tg-0lax">
      Gilad et al, <a href="https://dl.acm.org/doi/10.1145/3132747.3132757">Algorand: Scaling Byzantine Agreements for Cryptocurrencies</a>, SOSP'17.
    </td>
    <td class="tg-0lax"></td>
  </tr>
  <!-- tr class="lecture">
    <td class="tg-baqh">25</td>
    <td class="tg-0lax"></td>
    <td class="tg-0lax">Blockchain Consensus Survey (Xiao et al, Arxiv)</td>
    <td class="tg-0lax"></td>
  </tr-->
</tbody>
</table>
