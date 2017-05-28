/**
 *
 * listings class
 *
 */
package Listings;

import java.util.*;
import java.io.Serializable;
import javax.xml.bind.annotation.*;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "listings")
public class Listings implements Serializable {

    @XmlElement(name = "listing")
    private ArrayList<Listing> list = new ArrayList<Listing>();
    

    public ArrayList<Listing> getListings() {
        return list;
    }

    public void addListing(Listing listing) {
        list.add(listing);
    }

    public void removeListing(Listing listing) {
        list.remove(listing);

    }

    public int Length() {
        return list.size();
    }
}