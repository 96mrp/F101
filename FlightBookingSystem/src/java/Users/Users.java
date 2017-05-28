/**
 *
 * Users class
 *
 */
package Users;

import java.util.*;
import java.io.Serializable;
import javax.xml.bind.annotation.*;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "users")
public class Users implements Serializable {
    // The list of user elements does NOT have an extra wrapper element.
    // See the comment in the XML file, and compare to the bookshop example.

    @XmlElement(name = "user")
    private ArrayList<User> list = new ArrayList<User>();

    public ArrayList<User> getList() {
        return list;
    }

    public void addUser(User user) {
        list.add(user);
    }

    public void removeUser(User user) {
        list.remove(user);
    }

    public User login(String name, String password) {
        // For each user in the list...
        for (User user : list) {
            if (user.getName().equals(name) && user.getPassword().equals(password)) {
                return user; // Login correct. Return this user.
            }
        }
        return null; // Login incorrect. Return null.
    }

    public boolean adminCheck(User user) {
        // For each user in the list...
            if (user.getAdmin().equals("Yes")) { // admin checked as yess
                return true; 
            }
            else if (user.getAdmin().equals("No")){ //admin checked as no
                 return false;
            }
            return false; // if neither return false
    }
       
}
