Brandon Holmes, 500751878
Nya Samahan, 500634913
Rafael Natividadm, 500705909

/*Where the car is*/
at(honda,11,-26).
at(subaru,-3,34).
at(bmw,-22,-19).
at(ford,21,14).

/*What state the light is from where*/
light(green,11,-26).
light(green,-3,34).
light(red,-22,-19).
light(red,21,14).

/*Euclidean Distance between pairs (X1,Y1), (X2,Y2)*/
distance(X1,Y1,X2,Y2,D) :- X is sqrt((X1-X2)^2+(Y1-Y2)^2),X=:=D.

/*Directions*/
northbound(X,Y) :- X>=0,X=<20,Y=<0-20,Y>=0-200. 
eastbound(X,Y) :- X>=0-200,X=<0-20,Y>=0-20,Y=<0.
southbound(X,Y) :- X>=0-20,X=<0,Y>=20,Y=<200.
westbound(X,Y) :- X>=20,X=<200,Y>=0,Y=<20.

/*Opposite directions*/
oppDir(X1,Y1,X2,Y2) :- northbound(X1,Y1),southbound(X2,Y2).
oppDir(X1,Y1,X2,Y2) :- eastbound(X1,Y1),westbound(X2,Y2).
oppDir(X1,Y1,X2,Y2) :- southbound(X1,Y1),northbound(X2,Y2).
oppDir(X1,Y1,X2,Y2) :- westbound(X1,Y1),eastbound(X2,Y2).

/*Perpendicular directions*/
perpendicDir(X1,Y1,X2,Y2) :- northbound(X1,Y1),eastbound(X2,Y2).
perpendicDir(X1,Y1,X2,Y2) :- eastbound(X1,Y1),southbound(X2,Y2).
perpendicDir(X1,Y1,X2,Y2) :- southbound(X1,Y1),westbound(X2,Y2).
perpendicDir(X1,Y1,X2,Y2) :- westbound(X1,Y1),northbound(X2,Y2).

/*Check to see if car can go straight through intersection*/
canDriveStraight(Car,X,Y) :- light(Z,X,Y),Z=green.

/*Check to see if car can turn right at light -- DOES NOT WORK*/
canTurnRight(Car,X,Y) :- light(Z,X,Y),Z=red,at(H,I,J),perpendicDir(X,Y,I,J),\+ (distance(X,Y,I,J,B),B<45).
canTurnRight(Car,X,Y) :- light(Z,X,Y),Z=green.


/*Check to see if car can turn left at light -- DOES NOT WORK*/
canTurnLeft(Car,X,Y) :- light(Z,X,Y),Z=green,at(H,I,J),oppDir(X,Y,I,J),distance(X,Y,I,J,V).
canTurnLeft(Car,X,Y) :- light(Z,X,Y),Z=green.