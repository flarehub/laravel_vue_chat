# laravel


## Install
```
composer install
yarn
```

## Setup .env

```
cp .env.example .env
```

Edit database connection

```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=root
DB_PASSWORD=
```

## Setup mail


#### メール設定

1. mailtrapにてアカウントを作成する

https://mailtrap.io/

2. .envを修正する

mailtrapが自動的に.envの項目を出力してくれるので
それを.envに設定する

<img width="1252" alt="スクリーンショット 2021-05-09 11 35 37" src="https://user-images.githubusercontent.com/7978290/117558753-e4904d80-b0ba-11eb-994a-7c14b66aa708.png">


## Run

```
php artisan serve

yarn watch // For frontend development(Vue.js)
```
