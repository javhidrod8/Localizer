package org.springframework.samples.localizer;

import javax.sql.DataSource;

import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

@Configuration
public class DBConfig {

    @Bean(name = "mySqlDataSource")
    @Primary
    public DataSource mySqlDataSource(){
        DataSourceBuilder dataSourceBuilder = DataSourceBuilder.create();
        dataSourceBuilder.driverClassName("com.mysql.cj.jdbc.Driver");
        dataSourceBuilder.url("jdbc:mysql://ilzyz0heng1bygi8.chr7pe7iynqr.eu-west-1.rds.amazonaws.com:3306/r3riqmlrzacro8q7?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=CET&createDatabaseIfNotExist=true");
        dataSourceBuilder.username("g1mtsqhpan3h69pt");
        dataSourceBuilder.password("i61xg43m4fmzwsrm");
        return dataSourceBuilder.build();
    }

}
