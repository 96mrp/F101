/**
 * 
 * Main User class for user functionality
 * 
 */
package Main;

import Users.Users;
import Users.User;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

public class MainU { 

    private String filePath;
    private Users users;

    public MainU() {//no parameter constructor

    }

    public String getFilepath() {
        return filePath;
    }
        public Users getUsers() {
        return users;
    }
    public void setUsers(Users users) {
        this.users = users;
    }
    
    public void addUser(User user) {
        users.addUser(user);
    }
    
  
    
    public void setFilePath(String filePath) throws JAXBException, IOException {
        // Create the unmarshaller
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Unmarshaller u = jc.createUnmarshaller();

        // Now unmarshal the object from the file
        FileInputStream fin = new FileInputStream(filePath);
        users = (Users) u.unmarshal(fin); // This loads the "user" object
        fin.close();

        this.filePath = filePath;
    }
    
     public void saveUsers() throws JAXBException, IOException {
        // Boilerplate code to convert objects to XML...
        JAXBContext jcuser = JAXBContext.newInstance(Users.class);
        Marshaller muser = jcuser.createMarshaller();
        //formats
        muser.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        //sends to the file
        OutputStream cs = new FileOutputStream(filePath);
        muser.marshal(users, cs);
    }
 
 
}
