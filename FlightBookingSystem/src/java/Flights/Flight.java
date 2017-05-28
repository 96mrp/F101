/**
 * 
 * Flight class
 * 
 */

package Flights;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;

@XmlAccessorType(XmlAccessType.FIELD)
public class Flight implements Serializable {
    @XmlElement(name = "departure")
    private String departure;
    
    @XmlElement(name = "arrival")
    private String arrival;

    @XmlElement(name = "price")
    private String price;

    @XmlElement(name = "seats")
    private int seats;

    @XmlElement(name = "origin")
    private String origin;
    
    @XmlElement(name = "destination")
    private String destination;

    @XmlElement(name = "type")
    private String type;

    public Flight() {
        super();

    }

    public Flight(String departure, String arrival, String price, int seats, String origin, String destination, String type) {
        this.departure = departure;
        this.arrival = arrival;
        this.price = price;
        this.seats = seats;
        this.origin = origin;
        this.destination = destination;
        this.type = type;
    }

    public String getDeparture() {
        return departure;
    }

    public String getArrival() {
        return arrival;
    }

    public String getPrice() {
        return price;
    }

    public int getSeats() {
        return seats;
    }

    public String getOrigin() {
        return origin;
    }

    public String getDestination() {
        return destination;
    }

    public String getType() {
        return type;
    }

    public void setDeparture(String departure) {
        this.departure = departure;
    }

    public void setArrival(String arrival) {
        this.arrival = arrival;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public void setSeats(int seats) {
        this.seats = seats;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public void setType(String type) {
        this.type = type;
    }
     
    
}

  
