
package com.mike.ws;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the com.mike.ws package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _PaymentOnlineResponse_QNAME = new QName("http://ws.mike.com/", "PaymentOnlineResponse");
    private final static QName _PaymentOnline_QNAME = new QName("http://ws.mike.com/", "PaymentOnline");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: com.mike.ws
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link PaymentOnlineResponse }
     * 
     */
    public PaymentOnlineResponse createPaymentOnlineResponse() {
        return new PaymentOnlineResponse();
    }

    /**
     * Create an instance of {@link PaymentOnline }
     * 
     */
    public PaymentOnline createPaymentOnline() {
        return new PaymentOnline();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link PaymentOnlineResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.mike.com/", name = "PaymentOnlineResponse")
    public JAXBElement<PaymentOnlineResponse> createPaymentOnlineResponse(PaymentOnlineResponse value) {
        return new JAXBElement<PaymentOnlineResponse>(_PaymentOnlineResponse_QNAME, PaymentOnlineResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link PaymentOnline }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws.mike.com/", name = "PaymentOnline")
    public JAXBElement<PaymentOnline> createPaymentOnline(PaymentOnline value) {
        return new JAXBElement<PaymentOnline>(_PaymentOnline_QNAME, PaymentOnline.class, null, value);
    }

}
