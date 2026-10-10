
package com.sanjeevmart;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import org.junit.jupiter.api.Test;

public class DatabaseTest {

    @Test
    void testH2Database() throws Exception {

        try (Connection con = DriverManager.getConnection(
                "jdbc:h2:mem:testdb", "sa", "");
             Statement stmt = con.createStatement()) {

            stmt.execute(
                "CREATE TABLE test_users (" +
                "id INT PRIMARY KEY, " +
                "name VARCHAR(100))"
            );

            stmt.execute(
                "INSERT INTO test_users VALUES (1, 'Sanjeev')"
            );

            ResultSet rs =
                stmt.executeQuery("SELECT COUNT(*) FROM test_users");

            rs.next();

            assertEquals(1, rs.getInt(1));
        }
    }
}