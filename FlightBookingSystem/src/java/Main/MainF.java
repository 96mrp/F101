/**
 * 
 * Main Flight class for flight functionality
 * 
 */

package Main;

import Flights.Flight;
import Flights.Flights;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

public class MainF {

    private String filePath;
    private Flights flights;

    public MainF(String filepath, Flights flights) {
        super();
        this.filePath = filepath;
        this.flights = flights;
    }

    public MainF() {
        super();
   
    }

    public void setflights(Flights flights) {
        this.flights = flights;
    }

    public void addflight(Flight flight) {
        flights.addflight(flight);
    }

    public void setFilePath(String filePath) throws JAXBException, IOException {
        this.filePath = filePath;
        // This is the file path given to us.
        // We should use it

        // Load the flights from the XML file...
        JAXBContext jc = JAXBContext.newInstance(Flights.class);
        Unmarshaller u = jc.createUnmarshaller();
        FileInputStream fin = new FileInputStream(filePath); // use the given file path
        flights = (Flights) u.unmarshal(fin); // This loads the "flights" object
        fin.close();
    }

    public String getFilePath() {
        return filePath;
    }

    public Flights getflights() {
        return flights;
    }
    

    public void loadflights() throws JAXBException, IOException {
        // Create the unmarshaller
        JAXBContext jcflight = JAXBContext.newInstance(Flights.class);
        Unmarshaller u = jcflight.createUnmarshaller();

        // Now unmarshal the object from the file
        FileInputStream fin = new FileInputStream(filePath);
        flights = (Flights) u.unmarshal(fin); // This loads the "shop" object
        fin.close();
    }

    public void saveflights() throws JAXBException, IOException {
        // Boilerplate code to convert objects to XML...
        JAXBContext jcflight = JAXBContext.newInstance(Flights.class);
        Marshaller mflight = jcflight.createMarshaller();
        //formats
        mflight.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        //sends to the file
        OutputStream cs = new FileOutputStream(filePath);
        mflight.marshal(flights, cs);
    }
}
