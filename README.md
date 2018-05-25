# Architektura Serwisów Internetowych 2017/2018 

<table>
  <tr>
   <td><b>Tytuł</b><td>Music Library </td>
   </tr>
    <tr>
    <td><b>Autorzy</b><td>Mikołaj Bronk, Wiktor Przybyłowski </td>
   </tr>
    <tr>
    <td><b>Wersja Ruby / Rails</b><td>2.5.1 / 5.2.0 </td>
   </tr>
     <tr>
    <td><b>Heroku</b><td> http://songsforpros.herokuapp.com/ </td>
   </tr>
  </tr>
  </table>
  
 # Docker
 Aby pobrać i uruchomić aplikację za pomocą obrazu docker należy podać: 
> ``docker pull lubimy/dockerized-lubimy:lubimy``  
> ``docker run -i -t --net=host lubimy/dockerized-lubimy:lubimy``
  
 # Możliwości  
- Podstawowe operacje na tabelach (dodawanie, usuwanie, edytowanie)
- Wyszukiwanie w każdej tabeli
- Paginacja
  
# Podział modeli
  ## Model Bands 
- Zapewnia możliwość dodawania, usuwania i edytowania zespołu

 ## Model Albums
- Zapewnia możliwość dodawania, usuwania i edytowania albumu
- Wymaga przypisania wcześniej stworzonego zespołu do albumu

## Model Songs
- Zapewnia możliwość dodawania, usuwania i edytowania piosenek
- Wymaga przypisania wcześniej stworzonego albumu do piosenki

## Zrzuty ekranu
Strona główna aplikacji
<img src="https://mmiki26.nstrefa.pl/obrazki/1.png">
Widok na piosenki
<img src="https://mmiki26.nstrefa.pl/obrazki/2.png">



