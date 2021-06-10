package es.ubu.lsi.model.invoice;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;


@Embeddable
public class DireccionFacturacion implements Serializable{
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 7030315307093418116L;

	private String ciudad;
	
	@Column(name="CP", length = 5)
	private String codigoPostal;

	private String direccion;

	
	
	
	
	public String getCiudad() {
		return this.ciudad;
	}

	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}
	
	
	public String getDireccion() {
		return this.direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	
	
	public String getCp() {
		return this.codigoPostal;
	}

	public void setCp(String cp) {
		this.codigoPostal = cp;
	}


}
