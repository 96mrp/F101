/**
 * 
 * Booking class
 * 
 */

package Bookings;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlAccessorType(XmlAccessType.FIELD)
public class Booking implements Serializable {

    @XmlElement(name = "BookingId")//fields
    private String bookingId;

    @XmlElement(name = "flightId")
    private String flightId;
    
        @XmlElement(name = "name")
    private String name;

    public Booking() {
        super();
        // TODO Auto-generated constructor stub
    }

    public Booking(String bookingId, String flightId, String name) {
        super();//constructor

        this.bookingId = bookingId;
        this.flightId = flightId;
        this.name = name;

    }

    public void setBookingId(String bookingId) {
        this.bookingId = bookingId;
    }

    public void setFlightId(String flightId) {
        this.flightId = flightId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBookingId() {
        return bookingId;
    }

    public String getFlightId() {
        return flightId;
    }

    public String getName() {
        return name;
    }

}
