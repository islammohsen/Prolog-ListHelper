domains
ilist = integer*
clist = symbol*

predicates

len(ilist, integer)
append(ilist, ilist, ilist)
reverse(ilist, ilist)
even(ilist)
nth(clist, integer, symbol)
swap(ilist, ilist)
split(ilist, integer, ilist, ilist, ilist)
subset(ilist, ilist).
member(ilist, integer).

clauses

len([], 0):-!.
len([_|T], Ret):-len(T, NewRet), Ret = NewRet + 1.

append([], [], []):-!.
append([], [H|T], Ret):- append([], T, NewRet), Ret = [H | NewRet].
append([H | T], List2, Ret):- append(T, List2, NewRet), Ret = [H | NewRet].

reverse([], []):-!.
reverse([H|T], Ret):- reverse(T, NewRet), append(NewRet, [H], Ret).

even([]):-!.
even([_, _|T]):-even(T).

nth([H|_], 0, H):-!.
nth([_|T], Index, Ret):- NewIndex = Index - 1, nth(T, NewIndex, Ret).

swap([H | T], Ret):- reverse(T, [NewH | NewT]), reverse(NewT, LastT),append([NewH], LastT, TempRet), append(TempRet, [H], Ret). 

split([H| T], H, [], [H], T):-!.
split([H | T], Num, Ret1, Ret2, Ret3):- split(T, Num, NewRet1, Ret2, Ret3), Ret1 = [H | NewRet1].

subset([], _):-!.
subset([H | T], List2):- member(List2, H), subset(T, List2).

member([H | _], H):-!.
member([_ | T], Num):-member(T, Num).

goal
subset([5,6,7, 10] ,[7,2,5,4,6,8]).