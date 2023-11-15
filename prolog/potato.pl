symptom(1 , "Brown Spots on leaves").
symptom(2 , "White fungal growth on underside of leaves").
symptom(3 , "Sunken brown lesions on tubers").
symptom(4 , "Rough corky patches on tuber skin").
symptom(5 , "Concentric rings on leaves").
symptom(6 , "Brown lesions on stems").
symptom(7 , "Wilting and death of plants").
symptom(8 , "Brown vascular ring visible when stem is cut").
symptom(9 , "Yellow mottling of leaves").
symptom(10 , "Stunting of plants").
symptom(11 , "Necrosis on tubers").
symptom(12 , "Upward rolling of leaves").
symptom(13 , "Leathery leaves").
symptom(14 , "Small and deformed tubers").

disease([1 , 2 ,3] , "Late blight").
disease([4] , "Common scab").
disease([1 , 5] , "Early blight").
disease([6 , 7] , "Blackleg").
disease([7 , 8] , "Bacterial wilt").
disease([9 , 10 , 11] , "Potato virus y").
disease([12 , 13 , 14] , "Potato leafroll virus").

symptoms :-
    write("Call check_disease with all the symptom numbers of the symptoms you identify below as parameters."),nl,nl,
    listing(symptom).

diseases :-
    write("Call check_symptoms with the disease name in quotes as the parameter."),nl,nl,
    listing(disease).

check_symptoms(X) :-
    disease(Y , X),
    member(Z , Y),
    symptom(Z , W),
    write(W),nl.

check_disease(X) :-
    (disease([X] , Y) ->
        format("The disease is ~w" , Y)
    ;   guess_disease(X)).

check_disease(W , X) :-
    (disease([W , X] , Y) ->
        format("The disease is ~w" , Y)
    ;   guess_disease(W , X)).

check_disease(V , W , X) :-
    (disease([V , W , X] , Y) ->
        format("The disease is ~w" , Y)
    ;   guess_disease(V , W , X)).

check_disease(U , V , W , X) :-
    (disease([U , V , W , X] , Y) ->
        format("The disease is ~w" , Y)
    ;   guess_disease(U , V , W , X)).

guess_disease(X) :-
    (disease(A , B),
    member(X , A),
    format("The disease might be ~w but this is uncertain" , B));
    write("No disease with this combination of symptoms was found."),
    !.

guess_disease(W , X) :-
    (disease(A , B),
    member(W , A),
    member(X , A),
    format("The disease might be ~w but this is uncertain" , B));
    write("No disease with this combination of symptoms was found."),
    !.

guess_disease(V , W , X) :-
    (disease(A , B),
    member(V , A),
    member(W , A),
    member(X , A),
    format("The disease might be ~w but this is uncertain" , B));
    write("No disease with this combination of symptoms was found."),
    !.

guess_disease(U , V , W , X) :-
    (disease(A , B),
    member(U , A),
    member(V , A),
    member(W , A),
    member(X , A),
    format("The disease might be ~w but this is uncertain" , B));
    write("No disease with this combination of symptoms was found."),
    !.