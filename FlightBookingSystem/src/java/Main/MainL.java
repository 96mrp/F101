/**
 * 
 * Main Listing class for Listing functionality
 * 
 */

package Main;

import Listings.Listings;
import Listings.Listing;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;


public class MainL {

    private String filePath;
    private Listings listings;

    public MainL(String filepath, Listings listings) {
        super();
        this.filePath = filepath;
        this.listings = listings;
    }

    public MainL() {
        super();
   
    }

    public void setListings(Listings listings) {
        this.listings = listings;
    }

    public void addListing(Listing listing) {
        listings.addListing(listing);
    }

    public void setFilePath(String filePath) throws JAXBException, IOException {
        this.filePath = filePath;
        // This is the file path given to us.
        // We should use it

        // Load the Listings from the XML file...
        JAXBContext jc = JAXBContext.newInstance(Listings.class);
        Unmarshaller u = jc.createUnmarshaller();
        FileInputStream fin = new FileInputStream(filePath); // use the given file path
        listings = (Listings) u.unmarshal(fin); // This loads the "Listings" object
        fin.close();
    }

    public String getFilePath() {
        return filePath;
    }

    public Listings getListings() {
        return listings;
    }
    
    public void loadListings() throws JAXBException, IOException {
        // Create the unmarshaller
        JAXBContext jcListing = JAXBContext.newInstance(Listings.class);
        Unmarshaller u = jcListing.createUnmarshaller();

        // Now unmarshal the object from the file
        FileInputStream fin = new FileInputStream(filePath);
        listings = (Listings) u.unmarshal(fin); // This loads the "shop" object
        fin.close();
    }

    public void saveListings() throws JAXBException, IOException {
        // Boilerplate code to convert objects to XML...
        JAXBContext jcListing = JAXBContext.newInstance(Listings.class);
        Marshaller mListing = jcListing.createMarshaller();
        //formats
        mListing.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        //sends to the file
        OutputStream cs = new FileOutputStream(filePath);
        mListing.marshal(listings, cs);
    }
}
