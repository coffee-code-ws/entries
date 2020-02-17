[TOC]

# Basic Protocol Stack

Teilnehmer in einer Web Service Architektur sind:
- Dienstnutzer, auch Service Consumer
- Dienstanbieter, auch Service Provider
- Dienstverzeichnis, auch Service Broker

Zur Kommunikation zwischen den einzelnen Teilnehmern der Web Service Architektur sind spezifische Protokolle vorgesehen.
In der Gesamtheit des Systems müssen folgende Kriterien erfüllt sein:
- Auffindbarkeit (Discovery),
- Beschreibung (Description),
- Nachrichtenaustausch (Messaging) sowie
- der allgemeine Transport der Nachrichten.


# Nachrichtenaustausch über SOAP

SOAP (ursprünglich **S**imple **O**bject **A**ccess **P**rotocol) ist ein Protokoll für den Nachrichtenaustausch in Web Service Architekturen. Der ursprüngliche Name des Protokolls stammt daher, dass Anfragen (im Unterschied zu REST) über so genannte Proxy-Objekte getätigt werden, welche als technische Schnittstelle für den Informationsaustausch dienen. Diese Art des Zugriffs nennt man **R**emote **P**rocedure **C**all (Akronym: RPC), da die verwendeten Proxy-Objekte entfernte Methoden eines Web Services verfügbar machen.

SOAP setzt auf vorhandenen Protokollen auf (HTTP, HTTPS, SMTP, FTP, WebSockets ...) und nutzt somit die bestehende Infrastruktur des Internets.

## Aufbau von SOAP-Nachrichten

Eine SOAP-Nachricht besteht aus einer Envelope (einem "Briefumschlag"), in der sich ein optionaler header und ein body mit Nutzdaten befinden. SOAP-Nachrichten sind XML-kodiert:

```xml
<?xml version="1.0"?>

<soap:Envelope
xmlns:soap="http://www.w3.org/2003/05/soap-envelope/"
soap:encodingStyle="http://www.w3.org/2003/05/soap-encoding">

<soap:Body>
  <m:GetPrice xmlns:m="https://www.w3schools.com/prices">
    <m:Item>Fiktives Produkt</m:Item>
  </m:GetPrice>
</soap:Body>

</soap:Envelope>
```

Im Beispiel ist eine Anfrage an einen SOAP-Endpunkt, wobei der Preis für ein fiktives Produkt abgefragt wird. Eine Antwort auf diese Anfrage könnte wie folgt aussehen:

```xml
<?xml version="1.0"?>

<soap:Envelope
xmlns:soap="http://www.w3.org/2003/05/soap-envelope/"
soap:encodingStyle="http://www.w3.org/2003/05/soap-encoding">

<soap:Body>
  <m:GetPriceResponse xmlns:m="https://www.w3schools.com/prices">
    <m:Price>1337.00</m:Price>
  </m:GetPriceResponse>
</soap:Body>

</soap:Envelope>
```

## Kontrollstrukturen in SOAP

SOAP ist sehr umfangreich und bietet z.B. eine große Menge von Kontrollfunktionen für die Kommunikation an:
- `<soap:Fault>` Elemente im Response Body für die Darstellung von Fehlern
- Das `<soap:actor>` Attribut im Header zur Definition der Station, für die die Nachricht definiert ist (Load Balancer, Firewall, etc.)
- Das `<soap:mustUnderstand>` Attribut im Header, um bei nicht verstandenen Nachrichten einen Fehler emittieren zu lassen

## Teilnehmer in einem SOAP-Austausch

Teilnehmer eines SOAP-Austauschs sind
- der Sender,
- der Vermittler (auch Intermediary) sowie
- der Receiver.

Ein SOAP-Nachrichtenaustausch erfolgt über den Vermittler bidirektional zwischen dem Sender und dem Receiver.


# Description über WSDL

Die **W**eb **S**ervices **D**escription **L**anguage wird ihrem deskriptiven Namen gerecht, denn es handelt sich hierbei um eine allgemeingültige, programmiersprachenunabhängige Schnittstellenbeschreibung nach W3C-Empfehlung.

## Aufbau einer WSDL-Beschreibung

Eine WSDL-Beschreibung enthält 6 Hauptelemente:
- `Service`: enthält eine Menge von Endpoints
- `Endpoint`: enthält die Adresse für ein Binding
- `Binding`: legt ein konkretes Protokoll und Datenformate für Operationen und Nachrichten eines Porttyps fest
- `Interface`: eine Menge von abstrakten Operationen
- `Message`: eine abstrakte Beschreibung der Nachrichten
- `Types`: alle Datentypen, die zwischen Client und Server ausgetauscht werden

Die Beschreibung lässt sich entsprechend den oben genannten Bestandteilen in Deklarationen der **Konkreten Implementierung** (`Service`, `Endpoint`, `Binding`) und Deklarationen für ein **abstraktes Interface** (`Interface`, `Message`, `Types`) unterteilen.

## Konkrete Vorgehensweise zur Erstellung einer WSDL-Beschreibung

Stellen wir uns einen hypothetischen Dienst einer Hotelbuchung vor, den wir nun in einer `hotelbooking.wsdl` beschreiben möchten. Dann identifizieren und definieren wir zunächst die benötigten Datenstrukturen (`Types`). Auf Grundlage dessen können entsprechende Nachrichten (`Messages`), jeweils unterteilt in `Parts` (Parameter eines bestimmten Typs), definieren, welche vom Service entgegengenommen werden bzw. zurückgesendet werden. Wir senden diese Nachrichten über die Interaktion mit bestimmten `Operationen` nach einem bestimmten **M**essage **E**xchange **P**attern (Akronym: MEP). Diese Operationen gruppieren wir zu einer abstrakten Definition als `Interface`.

Unsere WSDL-Beschreibung könnte dann ungefähr wie im folgenden Schema aussehen, wobei wir noch Protokolle und Formate in einem `Binding` definieren und unsere Service-Definition unter dem `Service` Knoten eintragen:
```xml
<?xml version="1.0">
<wsdl:definitions
    xmlns:"http://schemas.xmlsoap.org/wsdl/"
    name="HotelBooking"
    targetNamespace="urn:HotelBooking">
    <wsdl:documentation ... />
    <wsdl:types> Schema Imports </wsdl:types>
    <wsdl:message> Nachrichten </wsdl:message>
    <wsdl:interface> Operationen </wsdl:Interface>
    <wsdl:binding> Protokolle und Formate </wsdl:binding>
    <wsdl:service> Service-Definition </wsdl:service>
</wsdl:definitions>
```

## Definition von Operationen

Unter WSDL werden Operationen in bestimmte MEP-Kategorien unterteilt, zum Beispiel:
- `In-Only` für Operationen ausschließlich mit Statusrückgabe
- `In-Out` für Operationen mit Datentransfer bei Eingabe und Ausgabe
- `In-Optional-Out` für Operationen mit einer optional mit Daten behafteten Rückgabe
- `Out-Only` für Daten ausgebende Operationen
- `Robust In-Only` für Operationen, die einen `<soap:Fault>` hervorrufen können, auf den der Service Consumer reagieren muss
- weitere Variationen

## Fehlermeldungen (Fault Messages)

Zusätzlich zu normalen `<wsdl:input ...>` und `<wsdl:output ...>` Nachrichten können mit WSDL noch `<wsdl:fault ...>` Nachrichten deklariert werden. Die zusätzliche Fehler-Nachricht nutzt der Client, um auf Fehler beim Nachrichtenaustausch zu reagieren.


# Discovery über UDDI

Als letzter Teil des Basic Protocol Stacks von Web Service dient **U**niversal **D**escription, **D**iscovery and **I**ntegration (nach OASIS-Standard) als eine weitere Beschreibungssprache für den angebotenen Web Service. Im Unterschied zu WSDL jedoch ist der Hauptzweck von UDDI nicht die technisch präzise Beschreibung des Web Services, sondern die Realsierung der Auffindbarkeit des Web Service.

Eine Beschreibung in UDDI ist in drei Hauptkategorien gegliedert:
- **White Pages** sind Seiten, die als Namensregister fungieren und einen Kontakt zum Anbieter bereitstellen. Hierzu werden ggf. mehrsprachige Unternehmensbeschreibungen bereitgestellt oder besondere Klassifizierungscodes (z.B: "Bank")
- **Yellow Pages** sind Seiten, die als "Branchenbuch" fungieren und eine Einordnung der Web Services in eine standardisierte Geschäftskategorie einordnen
- **Green Pages** enthalten technische Informationen zu den angebotenen Web Services, sowie relevante Geschäftsmodelle und -prozesse.

Eine mögliche Anfrage an eine UDDI-Registry via SOAP Nachrichten könnte wiefolgt aussehen:
- Authentifikation bei der UDDI-Registry
- Suchen in der UDDI-Registry
- Detailinformationen abfragen
- Hinzufügen, Löschen und Ändern von Einträgen
