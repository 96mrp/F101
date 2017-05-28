/**
 * 
 * User class
 * 
 */

package Users;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;

@XmlAccessorType(XmlAccessType.FIELD)
public class User implements Serializable {

    @XmlElement(name = "name")
    private String name;

    @XmlElement(name = "email")
    private String email;
    
      @XmlElement(name = "password")
    private String password;
      
        @XmlElement(name = "DOB")
    private String DOB;
                @XmlElement(name = "admin")
    private String admin;
        


    public User() {
        super();
        // TODO Auto-generated constructor stub
    }

    public User(String name, String email, String password, String DOB, String admin) {
        super();
        
        this.name = name;
        this.password = password;
        this.email = email;
        this.DOB = DOB;
        this.admin = admin;

    }

    public String getAdmin() {
        return admin;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setDOB(String DOB) {
        this.DOB = DOB;
    }

    public void setAdmin(String admin) {
        this.admin = admin;
    }

    public String getEmail() {
        return email;
    }

    public String getDOB() {
        return DOB;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}