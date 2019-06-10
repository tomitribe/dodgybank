/**
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 * <p/>
 * http://www.apache.org/licenses/LICENSE-2.0
 * <p/>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.superbiz.bank;

import java.text.ParseException;
import java.text.SimpleDateFormat;

public class AccountService {

    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
    private static final AccountService INSTANCE = new AccountService();

    private final Account account;

    private AccountService() {
        account = new Account("David's Account");
        try {
            account.getAccountTransactionList().add(new AccountTransaction(DATE_FORMAT.parse("2019-06-01"), "007", "Jon", -10.00f));
            account.getAccountTransactionList().add(new AccountTransaction(DATE_FORMAT.parse("2019-06-03"),"12345678", "Grocery Store", -102.68f));
            account.getAccountTransactionList().add(new AccountTransaction(DATE_FORMAT.parse("2019-06-03"),"55490912", "Book Store", -22.42f));
            account.getAccountTransactionList().add(new AccountTransaction(DATE_FORMAT.parse("2019-06-05"),"001", "Bank Charges", -5.00f));
            account.getAccountTransactionList().add(new AccountTransaction(DATE_FORMAT.parse("2019-06-06"),"63850663", "Guitar Store", -400.00f));
        } catch (ParseException e) {
            // shouldn't happen
        }
    }

    public static AccountService getInstance() {
        return INSTANCE;
    }

    public Account getAccount() {
        return account;
    }
}
