# Zurion Technologies Web Test
### By David May 5, 2024
____

### About
This is a Contact Registry System that stores and manages contacts. 

Additionally, it provides powerful and intuitive visualizations for the distributions of contacts based on their various characteristics.

### Technical Specs
This is a Maven-based Java web application project utilizing JDBC, Servlets and JSPs, with the JSPs employing Bootstrap 5 CSS 
and jQuery for AJAX-style communication between the frontend and backend

Dashboard theme borrowed from [Start Bootstrap](https://startbootstrap.com/template/sb-admin)

#### Developed in Environment:
* OS: CentOS 9
* IDE: Eclipse
* Server: Tomcat v9.0

For a list of dependencies used in the project, see the [pom.xml](./pom.xml) file on the root directory of this project

#### Running the project
1. Clone the project from the repository and run maven install to resolve dependencies
```sh
git clone

mvn clean install  #install maven using yum install maven if not already installed
```


2. Initialize the database with the following script

Find it [here](./zurion_init_script.sql)

```sql
CREATE SCHEMA IF NOT EXISTS `zuriondb` ;
USE `zuriondb` ;

-- -----------------------------------------------------
-- Table `zuriondb`.`contact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zuriondb`.`contact` (
  `CONTACT_ID` INT NOT NULL AUTO_INCREMENT,
  `FULL_NAME` VARCHAR(45) NULL,
  `PHONE` VARCHAR(14) NULL,
  `EMAIL` VARCHAR(45) NULL,
  `COUNTY` VARCHAR(30) NULL,
  `ID_NUMBER` INT(8) NULL,
  `DATE_OF_BIRTH` DATE NULL,
  `GENDER` VARCHAR(10) NULL COMMENT 'MALE / FEMALE (10 char max because of other variations of self identification that could be factored in)',
  `DATE_ADDED` DATETIME NULL,
  `COMMENTS` TEXT NULL COMMENT 'Any information, probably by admin remarking this contact',
  `STATUS` VARCHAR(10) NULL COMMENT 'any status category that could differentiate this contact from normal management workflows e.g. ACTIVE (default), UNSUBSCRIBED etc. If you are reviewing this, visualizing and designing systems is my special talent and success factor, Thank',
  PRIMARY KEY (`CONTACT_ID`))
ENGINE = InnoDB;
```

Kindly note the name of the schema, if you change, please change the Java web app properties as well [/zurionweb/WebContent/WEB-INF/app.properties](./WebContent/WEB-INF/app.properties)

2. Export the web app (war file) to Tomcat V9.x server

3. Start the server

4. Access the web app via browser at [http://localhost:8080/zurionweb/](http://localhost:8080/zurionweb/)

__NOTE:__ Remember to change the database connection details to match the credentials of your running database in `app.properties` (`/zurionweb/WebContent/WEB-INF/app.properties`) file:

```yaml
DB_DRIVER_CLASS=com.mysql.cj.jdbc.Driver
DB_URL=jdbc:mysql://localhost:3306/zuriondb?verifyServerCertificate=false&useSSL=true&requireSSL=true
DB_USER=root
DB_PASSWORD=dbpwd
```

#### You'll be prompted for login credentials:
Use  

- Username: `admin`
- Password: `admin@zurion`


#### Screenshots
###### Dashboard, with all intuitive graphs and recently added contacts
![Dashboard](/screenshots/A.png "Dashboard, with all intuitive graphs and recently added contacts")
###### Dashboard with Pie Charts and recently added contacts
![Dashboard with Pie Charts and recently added contacts](/screenshots/B.png "Dashboard with Pie Charts and recently added contacts")
![Contacts central](/screenshots/C.png "Page containing Table of Contacts")
![Contact Editing Modal](/screenshots/D.png "Friendly and accessible modal for fast editing  / modifying contacts")
![Create Contact page](/screenshots/E.png "New contact creation page")
![Site ADmin reference](/screenshots/F.png "Discovery of internal urls")


##### Support
For questions or assistance regarding this project, kindly reach out to me at the appointed contacts, or drop a comment on GitHub we can connect

