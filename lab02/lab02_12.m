clc;
clear all;

%ZAD 1

N = 20;  
A = zeros(N, N);
A(1, :) = sqrt(1/N);        %wype?nienie pierwszego wiersza
%disp(A(1, :)); 
for k = 1 : N-1             %wype?nienie pozosta?ych wierszy
    for n = 1 : N
        A(k + 1, n) = sqrt(2/N) * cos(pi * k / N * ((n - 1) + 0.5)); 
    end
end

w1 = zeros(1, N);
w2 = zeros(1, N);

czyOrtogonalna = 1;                  
for x = 1 : N                   %sprawdzenie ortogonalno?ci
    w1 = A(x, :);
    for j = 1 : N
        if x < j
            w2 = A(j, :);
            w12 = w1 .* w2;
            prod1 = sum(w12);
            if round(prod1, 10) ~= 0
                fprintf('Wiersze nieortogonalne: %u %u \n', x, j);
                 czyOrtogonalna = 0;
            end
        end
    end
end

    
if czyOrtogonalna == 0
    disp('macierz nie jest ortogonalna');
else
    disp('macierz jest ortogonalna');
end

    
    


%ZAD 2
S = A';
C = S * A;              %C -macierz podejrzewana o identycznoœæ

 ident = 1; %zmienna okreslajaca czy macierz jest iden.
 tol = 10^(-14); % tolerancja bledu przy sprawdzaniu identycznosci %

 for o = 1:N
     for p = 1:N;
        if o == p && (abs(I(o,p)-1) > (tol))
            ident = 0;
        end
        if o ~= p && (abs(I(o,p)) > tol);
             ident = 0;
        end
     end
 end

maxA = max(max(abs(A'-inv(A)))); % blad DCT macierz A %

(A'-inv(A)
C = round(C, 10);
if (C == eye(20)) % eye - macierz identycznosciowa
    disp('S*A jest identycznosciowa');
else 
    disp('S*A nie jest identycznosciowa');
end

xrand = rand(20,1) ;                       %tworzenie sygna?u losowego

X = A * xrand;

xsyn = S * X;

if round(xsyn,10) == round(xrand, 10)       %sprawdzenie czy rekonstrukcja sie udala
    disp('rekonstrukcja (z dokladnoscia do 10) udala sie');
else
    disp('rekonstrukcja siê nie uda?a');
end

figure(1);
plot(xrand - xsyn);
hold on;
title('roznice w sygnalach - oryginalnym i rekonstruowanym');
pause;


%2B

A = randn(N); 
% sprawdzanie ortonormalnosci (ortonormalnosc = ortogonalnosc + norma = 1)
czyOrtogonalny = 1;
czyOrtonormalny = 1;
for i = 1 : 1 : length(A)
    temp = A(i,:);
    % sprawdzanie normy
    if round(norma(temp), 10) ~= 1 
       %fprintf("Wiersz %u nie jest ortonormalny \n", i);
       czyOrtonormalny = 0;
    end
    
    % ortogonalnosc z innymi wierszami
    for j = i + 1: 1 : length(A)
        ilocznyWektorowy = dot(temp, A(j,:));
        if round(ilocznyWektorowy, 10) ~= 0
            czyOrtogonalny = 0;
        end
    end
end

if czyOrtonormalny
    disp('Macierz jest ortonormalna');
else 
    disp('Macierz nie jest ortonormalna');
end

if czyOrtogonalny
    disp('Macierz jest ortogonalna');
else
    disp('Macierz nie jest ortogonalna');
end

S = inv(A);
C = S * A;
C = round(C, 10);
if (C == eye(20))
    disp('S*A jest identycznosciowa; zad 2B');
else 
    disp('S*A nie jest identycznosciowa; zad 2B');
end

xrand = randn(20,1)                        %tworzenie sygnalu losowego

X = A * xrand;

xsyn = S * X;

if round(xsyn,10) == round(xrand, 10)       %sprawdzenie czy rekonstrukcja sie udala
    disp('rekonstrukcja 2b sie udala z bledem 10^-10');
else
    disp('rekonstrukcja 2b sie nie udala');
end

figure(2);
plot(xrand - xsyn);
hold on;
title('roznice w sygnalach - oryginalnym i rekonstruowanym - macierz A losowa');

pause;



%zepsute DCT

N = 20;  
A = zeros(N, N);
A(1, :) = sqrt(1/N);        %wypelnienie pierwszego wiersza
%disp(A(1, :)); 
for k = 1 : N-1             %wypelnienie pozostalych wierszy zepsutego DCT
    for n = 1 : N
        A(k + 1, n) = sqrt(2/N) * cos(pi * (k + 0.25) / N * ((n - 1) + 0.5)); 
    end
end

%sprawdzenie ortogonalnosci
for j = i + 1: 1 : length(A)
        ilocznyWektorowy = dot(temp, A(j,:));
        if round(ilocznyWektorowy, 10) ~= 0
            czyOrtogonalny = 0;
        end
end
if czyOrtogonalny
    disp('Macierz jest ortogonalna');
else
    disp('Macierz nie jest ortogonalna');
end

S = inv(A);
C = S * A;

C = round(C, 10);
if (C == eye(20))
    disp('S*A jest identycznosciowa; zepsute DCT');
else 
    disp('S*A nie jest identycznosciowa; zepsute DCT');
end

xrand = rand(20,1); %tworzenie sygna³u losowego

%xrand = awgn(xrand,10); %sygnal szumowy
X = A * xrand;

xsyn = S * X;

if round(xsyn, 10) == round(xrand, 10)       %sprawdzenie czy rekonstrukcja sie udala
    disp('rekonstrukcja (z dok³adnoœci¹ do 10^-10) siê uda³a; zepsute DCT');
else
    disp('rekonstrukcja siê nie uda³a; zepsute DCT');
end

figure(3);
plot(xrand - xsyn);
title('roznice w sygnalach - oryginalnym i rekonstruowanym - zepsute DCT');
hold on;