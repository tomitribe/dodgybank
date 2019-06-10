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

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet("/account/withdrawal")
public class AccountWithdrawalServlet extends HttpServlet {

    @Override
    protected void doPost(final HttpServletRequest req, final HttpServletResponse resp) throws ServletException, IOException {

        final String targetAccountNumber = req.getParameter("targetAccountNumber");
        final String targetAccountName = req.getParameter("reference");

        if (targetAccountName == null || targetAccountNumber == null) {
            resp.sendRedirect("/bank/account/");
            return;
        }

        try {
            final Float amount = -Float.parseFloat(req.getParameter("amount"));
            AccountService.getInstance().getAccount().getAccountTransactionList().add(new AccountTransaction(new Date(), targetAccountNumber, targetAccountName, amount));

            req.setAttribute("account", AccountService.getInstance().getAccount());
            req.getRequestDispatcher("/WEB-INF/account.jsp").forward(req, resp);

        } catch (NumberFormatException e) {
            resp.sendRedirect("/bank/account/");
        }

    }

}
