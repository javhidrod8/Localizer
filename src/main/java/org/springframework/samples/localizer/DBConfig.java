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
        dataSourceBuilder.url("jdbc:mysql://i54jns50s3z6gbjt.chr7pe7iynqr.eu-west-1.rds.amazonaws.com:3306/owjnsr7ke00upon1?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=CET&createDatabaseIfNotExist=true");
        dataSourceBuilder.username("ssga7sst14d2wn45");
        dataSourceBuilder.password("gpf5hbo6hyv6x2pu");
        return dataSourceBuilder.build();
    }

}
