-   Create a database locally named `homestead` utf8_general_ci
-   Download composer https://getcomposer.org/download/
-   Pull Laravel/php project from git provider.
-   Rename `.env.example` file to `.env`inside your project root and fill the database information.
    (windows wont let you do it, so you have to open your console cd your project root directory and run `mv .env.example .env` )
-   Open the console and cd your project root directory
-   Run `composer install` or `php composer.phar install`
-   Run `php artisan key:generate`
-   Run `php artisan migrate`
-   Run `php artisan db:seed` to run seeders, if any.
-   Run `php artisan serve`

#####You can now access your project at localhost:8000 :)

## If for some reason your project stop working do these:

-   `composer install`
-   `php artisan migrate`

# check router

`php artisan route:list`

# Xoa cache

`php artisan cache:clear`
`php artisan route:cache`
`php artisan config:cache`
`php artisan view:clear`

# start laravel

cd `<Package name>` and run `php artisan serve`
