@fish


Sentencecase a list of word in all files

    for i in  (string split " " "userPlayRole userHasRoot userIsGuest userIsMember userIsCoordo userIsOwner");
        set up (echo $i | awk '{$1=toupper(substr($A,0,1))substr($1,2)}1')
        rg $i -l |xargs sed -i "s/$i/$up/g" 
    end
