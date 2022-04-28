package Servlets;

import Beans.Item;
import Beans.Transaction;
import Beans.User;
import SQL.ItemSQL;
import SQL.TransactionSQL;
import SQL.UserSQL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/rent-item")
public class RentItemServlet extends HttpServlet {//Facade the logic for renting items was abstracted away from the client.
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long itemId = Long.parseLong(req.getParameter("itemId"));
        Long buyerId = Long.parseLong(req.getParameter("buyerId"));
        Double pickupTimeD = Double.parseDouble(req.getParameter("pickupTime"));
        Long pickupTime = pickupTimeD.longValue();
        Double dropOffTimeD = Double.parseDouble(req.getParameter("dropOffTime"));
        Long dropOffTime = dropOffTimeD.longValue();

        ItemSQL itemSQL = new ItemSQL();
        Item item = itemSQL.readById(itemId);

        if (item != null) {
            if (item.getIsRented() == 0) {
                itemSQL.updateIsRented(itemId);

                TransactionSQL transactionSQL = new TransactionSQL();
                Transaction transaction = new Transaction();
                transaction.setItemId(itemId);
                transaction.setBuyerId(buyerId);
                transaction.setPickupTime(pickupTime);
                transaction.setDropOffTime(dropOffTime);
                transactionSQL.create(transaction);

                UserSQL userSQL = new UserSQL();
                User user = userSQL.readById(item.getUserId());

                resp.getWriter().print(user.getEmail());

            } else {
                resp.getWriter().print("Someone is already renting this item.");
            }
        } else {
            resp.getWriter().print("Item does not exist.");
        }
    }
}
