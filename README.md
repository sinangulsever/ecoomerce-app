#### Step 1:
```bash 
    git clone https://github.com/sinangulsever/ecoomerce-app.git
```
#### Step 2:
```bash 
    cd ecoomerce-app
```
#### Step 3: .env Dosyasını Oluştur
```bash 
    cp .env.example .env
```
#### Step 4: Docker ile Bağımlılıkları Yükleyin
```bash 
    docker run --rm \
    -u "$(id -u):$(id -g)" \
    -v "$(pwd):/var/www/html" \
    -w /var/www/html \
    laravelsail/php84-composer:latest \
    composer install --ignore-platform-reqs
```
#### Step 5
```bash 
    ./vendor/bin/sail build --no-cache
```
#### Step 6
```bash 
    ./vendor/bin/sail up -d
```
#### Step 7: Migrate & Seed
```bash 
    ./vendor/bin/sail artisan migrate --seed
```

