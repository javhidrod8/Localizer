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
        dataSourceBuilder.url("jdbc:mysql://clwxydcjair55xn0.chr7pe7iynqr.eu-west-1.rds.amazonaws.com:3306/o09trq8mm3sharbc?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=CET&createDatabaseIfNotExist=true");
        dataSourceBuilder.username("oohv6vv8h13qehv8");
        dataSourceBuilder.password("gtvtbargmp9dwn34");
        return dataSourceBuilder.build();
    }

}
