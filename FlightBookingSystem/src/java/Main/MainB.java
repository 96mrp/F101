/**
 *
 * Main Booking class for booking functionality
 *
 */
package Main;

import Bookings.Bookings;
import Bookings.Booking;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

public class MainB {

    private String filePath;
    private Bookings bookings;
    
    
//constructor for booking functionality
    public MainB(String filepath, Bookings bookings) {
        super();
        this.filePath = filepath;
        this.bookings = bookings;
    }

    //no parameter constructor
    public MainB() {
        super();

    }

    //sets the list of bookings 
    public void setBookings(Bookings bookings) {
        this.bookings = bookings;
    }
    
    //gets the filepath
    public String getFilePath() {
        return filePath;
    }
    
//gets the list of bookings
    public Bookings getBookings() {
        return bookings;
    }
    
    //adds a booking to the list
    public void addBooking(Booking booking) {
        bookings.addBooking(booking);
    }

        //load the XML into objects to display on page
    public void setFilePath(String filePath) throws JAXBException, IOException {
        this.filePath = filePath;
        // This is the file path given to us.
        // We should use it

        // Load the bookings from the XML file...
        JAXBContext jc = JAXBContext.newInstance(Bookings.class);
        Unmarshaller u = jc.createUnmarshaller();
        FileInputStream fin = new FileInputStream(filePath); // use the given file path
        bookings = (Bookings) u.unmarshal(fin); // This loads the "bookings" object
        fin.close();
    }


    //load the XML into objects to display on page, possibly redundant 
    public void loadBookings() throws JAXBException, IOException {
        // Create the unmarshaller
        JAXBContext jcBooking = JAXBContext.newInstance(Bookings.class);
        Unmarshaller u = jcBooking.createUnmarshaller();

        // Now unmarshal the object from the file
        FileInputStream fin = new FileInputStream(filePath);
        bookings = (Bookings) u.unmarshal(fin); // This loads the "shop" object
        fin.close();
    }

    //Saves the objects into an XML file for storage
    public void saveBookings() throws JAXBException, IOException {
        // Boilerplate code to convert objects to XML...
        JAXBContext jcBooking = JAXBContext.newInstance(Bookings.class);
        Marshaller mBooking = jcBooking.createMarshaller();
        //formats
        mBooking.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        //sends to the file
        OutputStream bs = new FileOutputStream(filePath);
        mBooking.marshal(bookings, bs);
    }
}
