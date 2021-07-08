/* 
Brandon Holmes, 500751878
Nya Samahan, 500634913
Rafael Natividadm, 500705909
*/

saved(10000).
earnings(4000).
cash(1000).
dependents(1).

/* (1) */
minSavings(D,M) :- dependents(D), M is D * 9000.
minIncome(D,M) :- dependents(D), A is D * 8000, M is A + 25000.

/* (2) */
savingsAdequate(Amount, D, Min) :- saved(Amount), minSavings(D, Min), Amount >= Min.

/* (3) */
incomeAdequate(Amount, D, Min) :- earnings(Amount), minIncome(D, Min), Amount >= Min.

/* (4) Calculating what amount should be saved depending on whether the savings and income are adequate or not. */
save(What) :- \+ (savingsAdequate(Amount, D, Min)), cash(What), A is What, write('You should save $'), write(A), nl.
save(What) :- savingsAdequate(SAmount, D, SMin), incomeAdequate(IAmount, D, IMin), cash(What),  A is What * 0.5, write('You should save $'), write(A), nl.
save(What) :- savingsAdequate(SAmount, D, SMin), \+ (incomeAdequate(IAmount, D, IMin)), cash(What),  A is What * 0.2, write('You should save $'), write(A), nl.

/* (5) Calculating what amount should be invested depending on whether the savings and income are adequate or not. */
invest(What) :- \+ (savingsAdequate(Amount, D, Min)), cash(What), A is 0, write('You should invest $'), write(A), nl.
invest(What) :- savingsAdequate(SAmount, D, SMin), incomeAdequate(IAmount, D, IMin), cash(What), A is What * 0.5, write('You should invest $'), write(A), nl.
invest(What) :- savingsAdequate(SAmount, D, SMin), \+ (incomeAdequate(IAmount, D, IMin)), cash(What), A is What * 0.8, write('You should invest $'), write(A), nl.