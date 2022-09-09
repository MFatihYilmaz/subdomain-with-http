#! /bin/zsh

 while getopts ":h:d" option; do
   case $option in
    h) 
          echo "./sub.sh -d www.example.com"
        echo "Yukarıdaki gibi kullanılmaktadır."
         exit;;
    d)    
        rm file123.txt
        url=$2
        
        
        http_response=$(curl -s -o response.txt -w "%{http_code}" $url)
        if [ $http_response != "200" ];
        then
            url="https://www.${url}"
            echo $url
        else
            echo "İşlem başarılı"
         
        fi
        const=$2
        touch file123.txt
        subdomain(){
            echo $url
            curl -L $url | grep -Eo "(http|https)://[a-zA-Z0-9.]*" | grep $const >> file123.txt
            cat $subf | xargs -n1 | sort -u > file123.txt
        }
        subf="file123.txt"

        if [ -s "file123.txt" ]
        then
            echo "Dosya boş değil"
        else
            subdomain
        fi
        sed 1d $subf | while read line
            do

                url=$line
                subdomain
            done < $subf
        
        ;;
     \?) 
         echo "Hatalı Giriş yaptınız"
         exit;;
   esac
done

