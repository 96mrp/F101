package DOM; //can filter in the DOM parser

import java.io.*;
import javax.xml.parsers.*;
import org.w3c.dom.*;
import org.xml.sax.*;

public class Parser {

    public static final Printer bookingsP = new BookingPrinter();
    public static final Printer flightsP = new FlightPrinter();
        public static final Printer listingP = new ListingPrinter();

    public static abstract class Printer {

        public abstract void print(Node node, PrintWriter out);

        public void print(String filePath, Writer out) throws ParserConfigurationException, SAXException, IOException {
            print(filePath, new PrintWriter(out, true));
        }

        public void print(String filePath, PrintWriter out) throws ParserConfigurationException, SAXException, IOException {
            FileInputStream in = new FileInputStream(filePath);
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document document = builder.parse(in);
            Element root = document.getDocumentElement();
            print(root, out);
            out.flush();
        }
    }

    public static class BookingPrinter extends Printer {

        public void print(Node node, PrintWriter out) {
            int type = node.getNodeType();
            String name = node.getNodeName();
            String value = node.getNodeValue();
            switch (type) {
                case Node.ELEMENT_NODE:
                    if (name.equals("flights")) {
                        name = "table";
                    } else if (name.equals("flight")) {
                        name = "tr";
                    } else {
                        name = "td width=\"5%\"";
                    }

                    out.print("<" + name + ">");
                    if (name.equals("table")) {
                        out.print("<hr>");
                        out.print("<h2>Booking List</h2>");
                        out.print("\n<tr><td>Booking ID</td><td>Flight ID</td><td>User</td></tr>");
                        out.print("</hr>");
                    }
                    NodeList children = node.getChildNodes();
                    for (int i = 0; i < children.getLength(); i++) {
                        Node child = children.item(i);
                        print(child, out);
                    }
                    out.print("</" + name + ">");
                    break;
                case Node.TEXT_NODE:
                        out.print(value);
                    }
            }
        }

    public static class FlightPrinter extends Printer {

        public void print(Node node, PrintWriter out) {
            int type = node.getNodeType();
            String name = node.getNodeName();
            String value = node.getNodeValue();
            switch (type) {
                case Node.ELEMENT_NODE:
                    if (name.equals("flights")) {
                        name = "table";
                    } else if (name.equals("flight")) {
                        name = "tr";
                    } else {
                        name = "td width=\"5%\"";
                    }

                    out.print("<" + name + ">");
                    if (name.equals("table")) {
                        out.print("<hr>");
                        out.print("<h2>Flights</h2>");
                        out.print("\n<tr><td>Flight ID</td><td>Departure Date</td><td>Departure Time</td><td>Return Date</td><td>Return Time</td><td>Price</td><td>Seats (Max 50)</td><td>Origin</td><td>Destination</td><td>Type</td></tr>");
                        out.print("</hr>");
                    }
                    NodeList children = node.getChildNodes();//make f number clickable thus parsing the name to check
                    for (int i = 0; i < children.getLength(); i++) {
                        Node child = children.item(i);
                        print(child, out);
                    }
                    out.print("</" + name + ">");
                    break;
                case Node.TEXT_NODE:

                    if (value.contains("FN")) { // if the text node contains a 

                        out.print("<a href=\"book.jsp\")>" + value + "</a>"); // \* is reserved as a java string                     
                    } else {
                        out.print(value);
                    }
            }
        }
    }
    
        public static class ListingPrinter extends Printer {

        public void print(Node node, PrintWriter out) {
            int type = node.getNodeType();
            String name = node.getNodeName();
            String value = node.getNodeValue();
            switch (type) {
                case Node.ELEMENT_NODE:
                    if (name.equals("listing")) {
                        name = "table";
                    } else if (name.equals("listing")) {
                        name = "tr";
                    } else {
                        name = "td width=\"5%\"";
                    }

                    out.print("<" + name + ">");
                    if (name.equals("table")) {
                        out.print("<hr>");
                        out.print("<h2>Search Results</h2>");
                        out.print("\n<tr><td>Flight ID</td><td>Departure Date</td><td>Departure Time</td><td>Return Date</td><td>Return Time</td><td>Price</td><td>Seats</td><td>Origin</td><td>Destination</td><td>Type</td></tr>");
                        out.print("</hr>");
                    }
                    NodeList children = node.getChildNodes();//make f number clickable thus parsing the name to check
                    for (int i = 0; i < children.getLength(); i++) {
                        Node child = children.item(i);
                        print(child, out);
                    }
                    out.print("</" + name + ">");
                    break;
                case Node.TEXT_NODE:

                    if (value.contains("FN")) { // if the text node contains a 

                        out.print("<a href=\"book.jsp\")>" + value + "</a>"); // \* is reserved as a java string                     
                    } else {
                        out.print(value);
                    }
            }
        }
    }
    
}
    
