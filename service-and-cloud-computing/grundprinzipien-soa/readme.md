## Definition SOA

**S**ervice-**o**riented **A**rchitecture ist ein Paradigma für die Organisation und Verwendung verteilter Fähigkeiten, die unter der Kontrolle verschiedender Besitzerdomänen stehen können.

Der Begriff SOA wurde durch das [**OASIS-Referenzmodell**](http://www.oasis-open.org/committees/tc_home.php?wg_abbrev=soa-rm) einheitlich definiert. Außerdem deklariert das OASIS-Referenzmodell die notwendigen Fachwörter und schaffte hierdurch ein allgemeines Verständnis für die SOA.
Das Referenzmodell ist normativ, dient also als abstraktes Framework. Es enthält vereinheitlichte Konzepte, Grundsätze und Beziehungen innerhalb eines bestimmten Problemfeldes. Dadurch ist es prinzipiell unabhängig von spezifischen Standards, Technologien und Implementationen und hat weiterhin eine hohe Relevanz als Grundlage für die Entwicklung spezifischer Referenzen und konkreter Architekturen.


## Was sind Services?

Ein **Service** ist ein Mechanismus, der den Zweck hat, die Nutzung einer oder mehreren Fähigkeiten über eine wohldefinierte Schnittstelle zu ermöglichen. Die Schnittstelle muss konsistent zu den Anforderungen und Richtlinien in der Dienstbeschreibung sein. Die Dienstbeschreibung wird hierbei als verbindlicher Vertrag zwischen dem Service User und dem Service Provider betrachtet.
Wichtig ist, an dieser Stelle einzubeziehen, dass die Implementation des Services selbst nicht Teil des Vertrags ist. Das heißt, es steht dem Service Provider frei, wie dieser den Service implementiert.


## Sichtbarkeit, Interaktion und Wirkung

Im Kontext der SOA wurden drei wichtige Konzepte definiert: Sichtbarkeit, Interaktion und Wirkung.

Unter **Sichtbarkeit** versteht man, dass ein Anbieter von Fähigkeiten für den Nutzer sichtbar sein muss. Dies realisiert der Anbieter typischerweise über eine Beschreibung des Angebots. Über funktionale und technische Anforderungen, Richtlinien, Einschränkungen sowie Zugriffs- und Antwortmechanismen definiert der Anbieter, wie der Nutzer sein Angebot nutzen kann. Die Beschreibung des Anbieters muss hierbei syntaktisch und semantisch offen sein.

Das Konzept der **Interaktion** definiert, wie eine Fähigkeit im Rahmen der SOA genutzt werden kann. Dies geschieht in der Regel über einen vermittelten Nachrichtenaustausch. Der Nachrichtenaustausch wird durch eine Reihe von ausgeführten Aktionen und Informationsverarbeitungen repräsentiert.

Zusätzlich zur Sichtbarkeit und der Interaktion wird in der SOA noch das Konzept der **Wirkung** definiert. Die Wirkung ist als Ergebnis einer Interaktion der eigentliche Zweck, warum ein Nutzer eine Fähigkeit des Anbieters nutzt. Eine Wirkung kann eine Zustandsänderung beteiligter Objekte sein, *aber auch eine Rückgabe von Informationen*.

Die vorgestellten Konzepte verstehen sich als abstraktes Framework und lassen sich zum Beispiel auf das Konzept der Services anwenden.

Im Kontext von Services wird die Sichtbarkeit durch eine Dienstbeschreibung realisiert. Diese muss die Service-Eingaben und -Ausgaben klar im Rahmen einer zugehörigen Semantik definieren.
Bei Services geschieht die Interaktion über einen Nachrichtenaustausch, zum Beispiel über Request-Response. Zuletzt wird die Wirkung realisiert durch die Zustandsänderung beteiligter Objekte und die Rückgabe des Ergebnis als Antwort an den Service Consumer.


## Welche Teilnehmer gibt es in einer SOA Referenzarchitektur?

Der Service selbst wird durch einen **Service Provider** bereitgestellt. Diesem steht es frei, wie der Service implementiert wird, jedoch muss der Service Provider eine wohldefinierte Dienstbeschreibung bereitstellen, welche die Schnittstelle des Services beschreibt.

Als Nutzer des Service muss der **Service Consumer** dem Service Provider gegenüber nicht bekannt sein. Außerdem kann der Service Consumer den Dienst des Anbieters auf eine andere Art nutzen, als ursprünglich vom Service Provider vorgesehen. Zu beachten ist, dass der Service Consumer auch im Auftrag weiterer Nutzer handeln kann.

Als zusätzlicher Teilnehmer kann ein **Service Broker** als zentrales Verzeichnis dienen, welches Service Provider auflistet und auffindbar macht.

Betrachten wir alle drei Teilnehmer in einem Bild, so wird vom Service Provider ein Service bereitgestellt. Der Service Provider veröffentlicht eine Dienstbeschreibung über den Service Broker, worüber der Service Consumer den Dienst auffinden und schlussendlich durch direkte Anfrage an den Dienst verwenden kann.


## Was ist "Loose Coupling" (Lose Kopplung)?

In einer SOA werden Funktionalitäten in Diensten (Services) gekapselt. Durch die Interaktion mit der wohldefinierten Schnittstelle des Dienstes ist der Service Consumer nicht unmittelbar mit der Geschäftlogik verbunden, sondern lose an diese gekoppelt.
Daraus resultiert, dass die Dienstimplementierung bzw. die Dienstfunktionalität für den Service-Consumer möglichst transparent gehalten werden soll, damit dieser entsprechend mit dem Dienst interagieren kann.

Das Prinzip der losen Kopplung dient der Förderung von Wiederverwendbarkeit, Weiterentwicklung und Interoperabilität. Der Anbieter der Fähigkeit muss durch das Prinzip der losen Kopplung nicht mehr der Anbieter des Services sein, der die Nutzung der Fähigkeit erlaubt, sondern kann auch als Mittelsmann dienen.

Die lose Kopplung von Diensten bietet eine hohe Flexibilität bei der Austauschbarkeit der verwendeten Hintergrundressourcen. Über so genannte **Mapping Layer** kann hinter einer Schnittstelle ein zusammengesetzter Dienst verwendet werden. Dies ermöglicht die dynamische Einkopplung von neu entwickelten Diensten und eine optimierte Lastverteilung.


## Welche Vorteile/Nachteile bringt SOA?

SOA erleichtert die Entwicklung von großen Unternehmenssystemen mit Fokus auf die Skalierbarkeit, Verteilbarkeit, Weiterentwicklung und Wartbarkeit. SOA ermöglicht zudem die Orientierung an Geschäftsprozessen eines Unternehmens und ermöglicht die Interoperabilität (Zusammenarbeit unterschiedlicher funktioneller Systeme). Durch das einfache Anbieten, Suchen und Nutzen von Diensten über vernetzte Dienstverzeichnisse können durch die Zusammenarbeit von unterschiedlichen Domänen Kosten eingespart werden.

Diese Vorteile sind grundsätzlich abzuwägen gegenüber den Nachteilen, die SOA mit sich bringt. Das Anbieten eines Services erfordert eine Standardisierung von Geschäftsprozessen und Daten in textuelle Repräsentationen (XML, JSON). Diese sind jedoch nicht für alle Einsatzzwecke sinnvoll (z.B. multimediales Streaming). Durch die Transformation in standardisierte Textformate können Performanceverluste eintreten. Ein weiterer Nachteil ist, dass die Planung und Modellierung von Service-orientieren Architekturen inkl. der an diese gekoppelten Geschäftsprozesse aufwändig sein kann.
