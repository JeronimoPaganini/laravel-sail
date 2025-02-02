function s() {
    if [[ $1 == "cinit" ]]; then
        docker run --rm \
    -u "$(id -u):$(id -g)" \
    -v $(pwd):/var/www/html \
    -w /var/www/html \
    laravelsail/php${2:=81}-composer:latest \
    composer install --ignore-platform-reqs
    elif [[ $1 == "ninit" ]]; then
        docker run --rm \
        -u "$(id -u):$(id -g)" \
        -v $(pwd):/var/www/html \
        -w /var/www/html \
        node:${2:=17} \
        npm install
    else
        bash ./vendor/bin/sail $*
    fi
}
# alias s='bash ./vendor/bin/sail'
alias sup='s up'
alias sud='s up -d'
alias sdown='s down'
alias sa='s artisan'
alias sp='s php'
alias sc='s composer'
alias sn='s npm'
alias swatch='s npm run watch'
alias sprod='s npm run production'
alias sdev='s npm run dev'
alias st='s test'
alias stp='s test --parallel'
alias sdusk='s dusk'
alias ss='s shell'
alias stinker='s tinker'
alias sb='s build'
alias sshare='s share'
alias stan='sp ./vendor/bin/phpstan'
