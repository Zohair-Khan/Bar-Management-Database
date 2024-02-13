# Cocktail Database Application
This is a Java application designed to streamline the management of a mock bar's operations. It provides functionalities to connect to, view, and update a MySQL database containing information about various aspects of the bar, including ingredients, suppliers, and bar employees.

## Requirements
- Apache Maven
- MySQL Server/Workbench

## Included Files
- `src/main/java/AZJ/cocktaildb/`
    - `DB.java`
    - `Launcher.java`
    - `Supplier.java`
    - `Ingredients.java`
    - `Employees.java`
    - `Launcher.form`
    - `Supplier.form`
    - `Ingredients.form`
    - `Employees.form`
- `pom.xml`
- `SeedCocktailDB.sql`

## Creating and Seeding Database
1. Using MySQL Workbench, connect to the host where you would like to host the database for the application. Make note of the host name, login username, and password, as that information will be used to run the application.
2. Open `SeedCocktailDB.sql` in MySQL Workbench, and run the script.

## Running the Application
1. Open [DB.java](src\main\java\AZJ\cocktaildb\DB.java) in your text editor of choice.
2. Set the `databaseURL`, `databaseUser`, and `databasePass` variables to the host name, username, and password recorded in the previous step.
3. In the [main project directory](/), compile the application. The command format is:
    ```
    mvn compile
    ```
4. Run the Launcher class. The command format is:
    ```
    java -cp target/classes AZJ.cocktaildb.Launcher
    ```
5. A window will open with options to view the Ingredients, Suppliers, and Employee tables of the database.
6. For each option, a new window will open where you will be able to add items, edit item values, delete items, and refresh the table.

