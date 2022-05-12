# Spring Localizer Sample Application 

This is a fork of https://github.com/japarejo/spring-petclinic to be used for the ISPP course.

## Running localizer locally
Localizer is a [Spring Boot](https://spring.io/guides/gs/spring-boot) application built using [Maven](https://spring.io/guides/gs/maven/). You can build a jar file and run it from the command line:


```ssh
git clone https://github.com/javhidrod8/Localizer.git
cd Localizer
./mvnw package
java -jar target/*.jar
```

You can then access localizer here: http://localhost:8080/

<img width="1042" alt="localizer-screenshot" src="https://i.ibb.co/F0bV7Jb/4f1477a2-279a-4676-91cf-63ff53929628.jpg">

Or you can run it from Maven directly using the Spring Boot Maven plugin. If you do this it will pick up changes that you make in the project immediately (changes to Java source files require a compile as well - most people use an IDE for this):

```ssh
./mvnw spring-boot:run
```

## In case you find a bug/suggested improvement for Spring Localizer
Our issue tracker is available here: https://github.com/javhidrod8/Localizer/issues


## Database configuration

In its default configuration, Localizer uses an database (MySQL) which
gets populated at startup with data.

Database configuration file ([DBConfig.java](https://github.com/javhidrod8/Localizer/blob/master/src/main/java/org/springframework/samples/localizer/DBConfig.java))
```java
@Configuration
public class DBConfig {

    @Bean(name = "mySqlDataSource")
    @Primary
    public DataSource mySqlDataSource(){
        DataSourceBuilder dataSourceBuilder = DataSourceBuilder.create();
        dataSourceBuilder.driverClassName("com.mysql.cj.jdbc.Driver");
        dataSourceBuilder.url("jdbc:mysql://localhost:3306/Localizer?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=CET&createDatabaseIfNotExist=true");
        dataSourceBuilder.username("root");
        dataSourceBuilder.password("localizer");
        return dataSourceBuilder.build();
    }
}
```
### Settings
* Database name: Localizer
* User: Root
* Password: localizer

## Working with Localizer in your IDE

### Prerequisites
The following items should be installed in your system:
* Java 8 or newer.
* git command line tool (https://help.github.com/articles/set-up-git)
* Your preferred IDE 
  * Eclipse with the m2e plugin. Note: when m2e is available, there is an m2 icon in `Help -> About` dialog. If m2e is
  not there, just follow the install process here: https://www.eclipse.org/m2e/
  * [Spring Tools Suite](https://spring.io/tools) (STS)
  * IntelliJ IDEA
  * [VS Code](https://code.visualstudio.com)

### Steps:

1) On the command line
```ssh
git clone https://github.com/javhidrod8/Localizer.git
```
2) Inside Eclipse or STS
```ssh
File -> Import -> Maven -> Existing Maven project
```

Then either build on the command line `./mvnw generate-resources` or using the Eclipse launcher (right click on project and `Run As -> Maven install`) to generate the css. Run the application main method by right clicking on it and choosing `Run As -> Java Application`.

3) Inside IntelliJ IDEA

In the main menu, choose `File -> Open` and select the Localizer [pom.xml](pom.xml). Click on the `Open` button.

CSS files are generated from the Maven build. You can either build them on the command line `./mvnw generate-resources`
or right click on the `spring-localizer` project then `Maven -> Generates sources and Update Folders`.

A run configuration named `LocalizerApplication` should have been created for you if you're using a recent Ultimate
version. Otherwise, run the application by right clicking on the `LocalizerApplication` main class and choosing
`Run 'LocalizerApplication'`.

4) Navigate to Localizer

Visit [http://localhost:8080](http://localhost:8080) in your browser.


## Looking for something in particular?

|Spring Boot Configuration | Class or Java property files  |
|--------------------------|---|
|The Main Class | [LocalizerApplication](https://github.com/javhidrod8/Localizer/blob/master/src/main/java/org/springframework/samples/localizer/LocalizerApplication.java) |
|Properties Files | [application.properties](https://github.com/javhidrod8/Localizer/blob/master/src/main/resources) |


## Interesting Spring Localizer branches

The Spring Localizer master branch in the main [spring-projects](https://github.com/javhidrod8/Localizer)
GitHub org is the "canonical" implementation, currently based on Spring Boot, JSP and JavaScript.

# Contributing

The [issue tracker](https://github.com/javhidrod8/Localizer/issues) is the preferred channel for bug reports, features requests and submitting pull requests.

For pull requests, editor preferences are available in the [editor config](.editorconfig) for easy use in common text editors. Read more and download plugins at <https://editorconfig.org>. If you have not previously done so, please fill out and submit the [Contributor License Agreement](https://cla.pivotal.io/sign/spring).

# License

The Spring Localizer sample application is released under version 2.0 of the [Apache License](https://www.apache.org/licenses/LICENSE-2.0).
