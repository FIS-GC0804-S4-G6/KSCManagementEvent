
package com.mike.ws;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for PaymentOnline complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="PaymentOnline">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="bankCodeClient" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="bankCodeCompany" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="money" type="{http://www.w3.org/2001/XMLSchema}float"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "PaymentOnline", propOrder = {
    "bankCodeClient",
    "bankCodeCompany",
    "money"
})
public class PaymentOnline {

    protected String bankCodeClient;
    protected String bankCodeCompany;
    protected float money;

    /**
     * Gets the value of the bankCodeClient property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getBankCodeClient() {
        return bankCodeClient;
    }

    /**
     * Sets the value of the bankCodeClient property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setBankCodeClient(String value) {
        this.bankCodeClient = value;
    }

    /**
     * Gets the value of the bankCodeCompany property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getBankCodeCompany() {
        return bankCodeCompany;
    }

    /**
     * Sets the value of the bankCodeCompany property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setBankCodeCompany(String value) {
        this.bankCodeCompany = value;
    }

    /**
     * Gets the value of the money property.
     * 
     */
    public float getMoney() {
        return money;
    }

    /**
     * Sets the value of the money property.
     * 
     */
    public void setMoney(float value) {
        this.money = value;
    }

}
