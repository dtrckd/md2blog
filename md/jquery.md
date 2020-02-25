
snippets

get a text insade all mathcing selector, and join the text results:

$($.parseHTML(string_html).filter('a').map(function(i,el){return $(el).text()}).get().join(";")
