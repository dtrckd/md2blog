
Matching the substring insied of quotes pair

    echo '""blabh blah",' | grep -oP '(?<=\").*(?=\")'   
