# Elasticsearch API

Die vollständige Dokumentation der API ist unter https://www.elastic.co/guide/en/elasticsearch/reference/current/index.html zu finden.

### 1. Anfragen an die Api
Auf der Stage ist die Api unter https://head.holtzbrinck.netshops-lab.com erreichbar.

#### 1.1 Aufruf
Zum Aufrufen der Elasticsearch API kann der apiCaller verwendet werden.

    Usage: php -f apiCaller.php [-- options]
    
      options:
        -h, --help                                                   Shows this usage
    
        Required:
          -m, --method               (get|delete|put|post)           Method/Type of the Api request
          -api                       string                          Main api url (Without terminating /)
    
        Optional:
          -url, --request-url        string                          Request api url (Without leading /)
          -u, --user                 string                          User for auth
          -p, --pass                 string                          Password for auth
          -auth, --auth-method       (basic|digest)                  Method for auth (default: basic)
          
#### 1.2 Suchanfragen

Für Suchanfragen muss _'\_search'_ am Ende der Request-Url angegeben werden.
Die Suchanfragen in JSON-Notation werden dem ApiCaller über STDIN übergeben:

    # Pipe-Operator
    call example.json | php -f apiCaller.php -- -m "post" -api "https://exampleApi.com" -url "_search" -u "user" -p "pasword" 
    
    # or
    php -f apiCaller.php -m 'post' -api 'https://example.com/api' -url 'product' -u 'user' -p 'pasword' -auth 'basic‘ < example.json

Es ist auch möglich Suchanfragen ohne Request-Body zu senden, dazu wird die ganze Anfrage in die Request-Url geschrieben.
_Weitere Informationen dazu sind unter https://www.elastic.co/guide/en/elasticsearch/reference/current/search-uri-request.html
zu finden._
    
### 2. Durchsuchen eines bestimmten Shops
Um nur einen bestimmten Shop zu durchsuchen, wird der Tag dieses zusätzlich als Request-Url verwendet.
Der Tag wird durch Shopware aus dem Prefix _sw_shop_ und der ID des Shops (siehe Tabelle _s_core_shops_) gebildet. 

Beispiel:

Der Tag für den Shop mit der ID 4 ist demnach _'sw_shop4'_. 
Daraus ergibt sich die folgende Request-Url für eine Suche: 

    sw_shop4/_search 

Die vollständige Url - zusammengesetzt aus Api-Url und Request-Url - für die Stage wäre 
demnach https://head.holtzbrinck.netshops-lab.com/sw_shop4/_search.

#### 2.1 Ergebnistypen
Im Index von Elasticsearch gibt es zurzeit zwei Typen: property und product.
Welcher dieser Typen angezeigt werden soll, kann ebanfalls über die Request-Url angegeben werden.
Dazu wird hinter dem Shop-Tag der entsprechende Typ hinzugefügt.
Dies ermöglicht es beispielsweise, nur die Produkte in den Suchergebnissen anzuzeigen:
    
    sw_shop4/product/_search

**Tipp:** Um in allen Shops nur nach einem Bestimmten Typen zu suchen, kann als Tag _'\_all'_ verwendet werden.
Daraus ergibt sich dann für das Suchen nach Produkten die folgende Request-Url:

    _all/product/_search
    
#### 3. Beispiele

* QueryForTyping

    Zeigt eine Möglichkeit Suchvorschläge direkt beim Tippen zu machen.
    
* QueryForTypingWithSlop

    Zeigt eine weitere Möglichkeit Suchvorschläge direkt beim Tippen zu machen, 
    jedoch mit dem Unterschied, dass die Reihenfolge der einzelnen Wörter (Terme) nicht exakt übereinstimmen muss. 
    Der 'Slop' gibt an wie genau diese sein muss.
    
* QueryMultipleField

    In diesem Beispiel wird gezeigt, wie es möglich ist, mehrere festgelegte Felder beim Tippen zu durchsuchen.
    
* QueryMatchAll

    Zeigt eine Möglichkeit bei der alle Felder bei der Suche berücksichtig werden. 
    Dabei werden nur ganze Terme - haben u.a. keine Leerzeichen - berücksichtigt.
    
* QueryMatchingCategoryAndName

    Zeigt eine Möglichkeit bei der nur Produkte einer bestimmten Kategorie und mit entsprechendem Term im Namen gefunden werden.


##### 3.1 Aufruf

Die Beispiel können wie folgend gezeigt aufgerufen werden, dabei muss \<filename> mit dem entsprechenden Beispiel ersetzt werden:

    call ESApi/<fileName>.json | php -f apiCaller.php -- -m "post" -api "https://head.holtzbrinck.netshops-lab.com" -url "_search" -u "elasticsearch" -p "holtzbrinck42" -auth "basic"
    php -f apiCaller.php -- -m "post" -api "localhost:9200" -url "_search" < ESApi/<fileName>.json
    