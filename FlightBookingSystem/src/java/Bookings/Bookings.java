/**
 * 
 * Bookings class
 * 
 */

package Bookings;


import java.util.*;
import java.io.Serializable;
import javax.xml.bind.annotation.*;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "bookings")
public class Bookings implements Serializable {//conversion involved


    @XmlElement(name = "booking")
    private ArrayList<Booking> list = new ArrayList<Booking>();//list field

    public ArrayList<Booking> getBookings() {//getter
        return list;
    }

    public void addBooking(Booking booking) {//adds
        list.add(booking);
    }

    public void removeBooking(Booking booking) {//removes
        list.remove(booking);

    }

    public int Length() {//length
        return list.size();
    }

}
