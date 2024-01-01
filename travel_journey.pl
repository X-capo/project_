% The available transportation modes
transportation(car).
transportation(train).
transportation(plane).


place(newYork).
place(losAngeles).
place(sanFrancisco).
place(miami).
place(atlanta).
place(chicago).
place(houston).
place(newOrleans).
place(dallas).
place(portland).


% Use_car_to travel
car(newYork,losAngeles).
car(losAngeles,atlanta).
car(losAngeles,sanFrancisco).
car(sanFrancisco,miami).
car(newYork,newOrleans).
car(newOrleans,chicago).
car(chicago, atlanta).
car(newOrleans,dallas).
car(dallas,houston).
car(houston,miami).
car(houston,sanFrancisco).

% Use_train_to travel
train(newYork,losAngeles).
train(losAngeles,sanFrancisco).
train(sanFrancisco,miami).
train(newYork,atlanta).
train(losAngeles,atlanta).
train(newYork,chicago).
train(chicago,atlanta).
train(newYork,newOrleans).
train(newOrleans,atlanta).
train(newYork,dallas).
train(dallas,sanFrancisco).
train(sanFrancisco,miami).

% Use_plane_to travel
plane(newYork,losAngeles).
plane(newYork,sanFrancisco).
plane(newYork,miami).
plane(losAngeles,sanFrancisco).
plane(losAngeles,miami).
plane(sanFrancisco,miami).
plane(newYork,dallas).
plane(dallas,portland).
plane(portland,miami).
plane(portland,sanFrancisco).
plane(dallas,houston).
plane(houston,miami).



travel(City1,City2, [travel(car(City1,City2))]) :-
             car(City1,City2).
             
travel(City1,City2, [travel(train(City1,City2))]) :-
             train(City1,City2).
             
travel(City1,City2, [travel(plane(City1,City2))]) :-
             plane(City1,City2).


travel(City1,City2, [travel(car(City1,Z))|G]) :-
  car(City1,Z),
  travel(Z,City2,G).

travel(City1,City2, [travel(train(City1,Z))|G]) :-
  train(City1,Z),
  travel(Z,City2,G).

travel(City1,City2, [travel(plane(City1,Z))|G]) :-
  plane(City1,Z),
  travel(Z,City2,G).



/*

Valid Travel Journeys:

Query: travel(newYork, sanFrancisco, Journey).
This is a valid query. There is a direct car route from newyork to sanfrancisco.

Query: travel(losAngeles, miami, Journey).
This is a valid query. There is a direct train route from losangeles to miami.

Query: travel(newYork,houston, Journey).
This is a valid query. There is a direct plane route from newyork to houston.

Query: travel(newOrleans, atlanta, Journey).
This is a valid query. There is a direct car route from newOrleas to atlanta.

Query: travel(dallas, sanFrancisco, Journey).
This is a valid query. There is a direct train route from dallas to sanfrncisco.



Invalid Travel Journeys:

Query: travel(miami,losAngeles, Journey).
This is an invalid query. There is no direct route from miami to  losangles by car, train, or plane.

Query: travel(houston ,chicago , Journey).
This is an invalid query. There is no direct route from houston to chicago by car, train, or plane.

Query: travel(losAngeles, portland, Journey).
This is an invalid query. There is no direct route from losangeles to portland Sheikh by car, train, or plane.

Query: travel(losAngeles, houston, Journey).
This is an invalid query. There is no direct route from losangeles to houston Alam by train.

Query: travel(portland ,atlanta , Journey).
This is an invalid query. There is no direct route from portland to atlanta by car or train.
  */


