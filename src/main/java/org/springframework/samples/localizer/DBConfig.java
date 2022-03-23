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
        dataSourceBuilder.url("jdbc:mysql://spryrr1myu6oalwl.chr7pe7iynqr.eu-west-1.rds.amazonaws.com:3306/mwymgumaxhjh0w47?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=CET&createDatabaseIfNotExist=true");
        dataSourceBuilder.username("n4i5j79uxd3nrht5");
        dataSourceBuilder.password("fph2dntkbyjdmdgf");
        return dataSourceBuilder.build();
    }

}
