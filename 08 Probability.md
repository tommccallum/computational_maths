# Probability

Given an event such as a coin flip, what is the probility of a head?

$Pr(head) = 0.5$

Why?

The event is "a coin is tossed".  The outcome is either a head or a tail.  That is 2 outcomes.  Each outcome is equally likely so:

$Pr(Head | Coin Flip Outcomes) = \frac{1}{2}$

Read this as "Probability of a head GIVEN all coin flip outcomes".

Given a dice with 6 sides.  The outcomes are $\{1,2,3,4,5,6\}$.  Each outcome is equally likely so:

$Pr(6 | Dice outcomes) = \frac{1}{6}$

In general we can say:

$Pr(Outcome|NumberOfOutcomes)=\frac{NumberOfWaysItCanHappen}{NumberOfOutcomes}$

Remember a probabiliy is a value between 0 and 1.  Similar to a proportion.  You can think of a probability as a proportion of possible outcomes that is the outcome you want.

## Combining probabilities

Events A and B are **mutually exclusive** (aka disjoint) if they cannot occur at the same time.

Pr(event A happens AND event B happens AT THE SAME TIME) = 0

Event A and B are **dependent** if the probability of B is influenced by the probability of A happening.

Events A and B are **independent** if the probability of B is NOT influenced by the probability of B happening.

As a probability is between 0 and 1, we can say that the probability of ~A if the **complement** of the probability of A happening.

$Pr(A) = 1 - Pr(\sim A)$

$Pr(\sim A) = 1 - Pr(A)$

If events A **and** B both occur. This is a **intersection**. Then we can write this as $Pr(A \cap B)$.  If A and B are mutually exclusive, $Pr(A \cap B ) = 0$.

If either events A **or** B occur, this is a **union**. This is written as $Pr(A \cup B)$.

## Sum law

For a random variable, all the possible outcomes **must** sum up to 1.

The event A cannot occur AND not occur at the same time.  Hence the complement:

$Pr(A) = 1 - P(\sim A)$

## Multiplication

Assuming events A and B are not mutually exclusive and therefore can occur at the same time.

$P(A \cap B) = P(A) * P(B|A)$

We read this as:  The probability of A and B both occurring is, the probabilty of A multiplied by the probability of B given A.  Here A is the **independent variable** and B is the **dependent variable**.

Example:

If we have a bag of 3 red balls and 3 blue balls, and we *do not replace the balls after selection*.  What is the probability that after 2 draws both balls are red?

Let A = the event that the first ball is red.

Let B = the event that the second ball is blue.

At first there are 3 red balls out of 6. 

$Pr(red first)=0.5$

After the first selection, there are 5 balls left and 3 are blue.

$Pr(blue|red first) = \frac{3}{5}$

The probability of event A happening and then event B happening:

$Pr(A \cap B) = P(A) * P(B|A)$

$Pr(A \cap B) = 0.5 * \frac{3}{5} = 0.5 * 0.6$

$Pr(A \cap B) = 0.3$

What is the probability of this not happening?

$Pr(\sim(A \cap B)) = 1 - Pr(A \cap B)$

$Pr(\sim(A \cap B)) = 1 - 0.3$

$Pr(\sim(A \cap B)) = 1 - 0.7$

What are the alternatives?

* red first, red second
* blue first, red second
* blue first, blue second

(See stats_ball_picking_example.odg)


# Adding probabilities

The probability of event A **or** event B occurring, is equal to the probability of event A occurring and the probability of event B occurring minus the probability of them both occurring.

$Pr(A \cup B) = Pr(A) + Pr(B) - Pr(A \cap B)$

If event A and B are mutually exclusive $Pr(A \cap B)$ is zero.  So we get $Pr(A \cup B) = Pr(A) + Pr(B)$.

If $Pr(A \cap B) = Pr(A) * Pr(B|A)$ from the multiplication rule, we can do the following substitution:

$Pr(A \cup B) = Pr(A) + Pr(B) - Pr(A \cap B)$

$Pr(A \cup B) = Pr(A) + Pr(B) - Pr(A) * Pr(B|A)$

Example:

A student goes to the library. The probability that she checks out (a) a work of fiction is $0.40$, (b) a work of non-fiction is $0.30$, and (c) both fiction and non-fiction is $0.20$. What is the probability that the student checks out a work of fiction, non-fiction, or both?

Let $F$ = the event that the student checks out fiction

let $N$ = the event that the student checks out non-fiction. 

Then, based on the rule of addition:

$Pr(F \cup N) = Pr(F) + Pr(N) - Pr(F \cap N)$

$Pr(F \cup N) = 0.40 + 0.30 - 0.20 = 0.50$

(See venn diagram images)

## Bayesian Probabilities

Up to now we have assumed we can COUNT the events that we are calculating probabilities for.  This is called the **frequentist** view of probability.

There is an alternative perspectice, **Bayesian probability**.

There are two interpretations of a bayesian probability.  A bayesian probability is either an expectation that everyone with the same information will hold, or a personal belief.

This is Bayes Theorem or Formula:

$Pr(A | B ) = \frac{Pr(B|A)Pr(A)}{P(B)}$

$Pr(A \cap B)$ is a **joint probability**

$Pr(A | B)$ is a **conditional probability**

How did we get here?

$Pr(A \cap B) = Pr(A) * Pr(B|A) = Pr(B) * Pr(A|B)$ (1)

$Pr(A|B) = \frac{Pr(A \cap B)}{Pr(B)}$ if P(B) != 0 (2)

$Pr(B|A) = \frac{Pr(A \cap B)}{Pr(A)}$ if P(A) != 0 (3)

Substitute for $Pr(A \cap B)$ in (2) and (3) by (1):

$Pr(A|B) = \frac{Pr(B|A) * Pr(A)}{Pr(B)}$ if P(B) != 0

$Pr(B|A) = \frac{Pr(A|B) * Pr(B)}{Pr(A)}$ if P(A) != 0

## Why this is important?

This has a useful purpose when analysing which model of data is most correct given the evidence we have.

We reformulate the above to read as follows:

A represents a hypothesis (a guess), H, about a particular event.  For instance, "When I add coke to an empty glass it will bubble."

B represents the observed evidence (E).  For example, 5 times out of 5 when I added coke to a glass it bubbled.

We can write this as:

$Pr(A|B) = \frac{Pr(B|A) * Pr(A)}{Pr(B)}$ if P(B) != 0

in other words:

$Pr(H|E) = \frac{Pr(E|H)}{Pr(E)}* Pr(H)$ if P(E) != 0

$Pr(H)$ is the **prior probability**, which represents the probability that the hypothesis is true.

$Pr(H|E)$ is called the **posterior probability**, which represents the probability that the hypothesis is true GIVEN the evidence we now have.

$\frac{Pr(E|H)}{Pr(E)}$ is called the **likelihood ratio**, which represents the probability of seeing the evidence, given the hypothesis is true vs the probability of seeing the evidence independent of the hypothesis.

An example:

The probability that a king is drawn from a pack of cards is $\frac{4}{52}$ or $\frac{1}{13}$.  Let us say the $King$ represents the event that the card picked is a king.  This has an apriori probability of $\frac{1}{13}$ - its knowledge we think we know.

Let us assume our friend looks at the top card and it is a picture card.  How does that change the probability?  Let $Face$ be the event that the card is a face card.

$Pr(King|Face) = \frac{Pr(Face|King)}{Pr(Face)} * Pr(King)$

Every king is also a face card so $Pr(Face|King) = 1$.

There are 3 face cards (Jack, Queen, King), so $Pr(Face)=\frac{3}{13}$.

Plugging these numbers into Bayes formula gives:

$Pr(King|Face) = \frac{Pr(Face|King)}{Pr(Face)} * Pr(King)$

$Pr(King|Face) = \frac{1}{\frac{3}{13}} * \frac{1}{13}$

$Pr(King|Face) = \frac{13}{3} * \frac{1}{13}$

The $13$ and $\frac{1}{13}$ cancel, leaving:

$Pr(King|Face) = \frac{1}{3}$

So we have gained some knowledge because the probability of the card being a King has gone up given the evidence that the top card is a face card.


Have some fun with the Monty Hall problem at https://brilliant.org/wiki/monty-hall-problem/.


## Reference

* https://stattrek.com/probability/probability-rules.aspx
* https://brilliant.org/wiki/bayes-theorem/










