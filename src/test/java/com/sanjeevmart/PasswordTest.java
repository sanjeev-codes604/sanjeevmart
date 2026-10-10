package com.sanjeevmart;

import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;
import org.mindrot.jbcrypt.BCrypt;

public class PasswordTest {

    @Test
    void testPasswordHashing() {

        String password = "Test@123";

        String hashedPassword =
                BCrypt.hashpw(password, BCrypt.gensalt());

        assertTrue(BCrypt.checkpw(password, hashedPassword));
    }
}   