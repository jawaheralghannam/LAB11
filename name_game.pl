
% Lab 9 - The Name Game

:- dynamic letter/1.

% Initial set of letters
letter(a).
letter(b).
letter(c).

% Start the game
start :-
    writeln('Hi. This is the Name Game.'),
    writeln('You will be given a set of English letters'),
    writeln('to create your name.'),
    menu.

% Display menu
menu :-
    nl,
    writeln('Choose from the following:'),
    writeln('1- Display the current set of letters'),
    writeln('2- Add a letter'),
    writeln('3- Add a letter at the top'),
    writeln('4- Add a letter at the bottom'),
    writeln('5- Delete a letter'),
    writeln('6- Delete all letters'),
    writeln('7- Exit'),
    write('Enter your choice: '),
    read(Choice),
    action(Choice).

% Option 1 - Display letters
action(1) :-
    writeln('Current letters:'),
    (letter(X), writeln(X), fail ; true),
    menu.

% Option 2 - Add a letter
action(2) :-
    write('Enter a letter: '),
    read(X),
    assert(letter(X)),
    writeln('Letter added.'),
    menu.

% Option 3 - Add at the top
action(3) :-
    write('Enter a letter: '),
    read(X),
    asserta(letter(X)),
    writeln('Letter added at the top.'),
    menu.

% Option 4 - Add at the bottom
action(4) :-
    write('Enter a letter: '),
    read(X),
    assertz(letter(X)),
    writeln('Letter added at the bottom.'),
    menu.

% Option 5 - Delete a letter
action(5) :-
    write('Enter a letter to delete: '),
    read(X),
    (retract(letter(X))
    -> writeln('Letter deleted.')
    ;  writeln('Letter not found.')),
    menu.

% Option 6 - Delete all letters
action(6) :-
    retractall(letter(_)),
    writeln('All letters deleted.'),
    menu.

% Option 7 - Exit
action(7) :-
    writeln('Goodbye!').

% Invalid choice
action(_) :-
    writeln('Invalid choice.'),
    menu.
