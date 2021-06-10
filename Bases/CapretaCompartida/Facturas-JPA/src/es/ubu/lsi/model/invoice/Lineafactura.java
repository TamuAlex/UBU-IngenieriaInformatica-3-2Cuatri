package es.ubu.lsi.model.invoice;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;


/**
 * The persistent class for the LINEASFACTURA database table.
 * 
 */
@Entity
@Table(name = "LINEASFACTURA")
public class Lineafactura implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	@AttributeOverrides({
		@AttributeOverride(name = "linea", column = @Column(name = "LINEA",precision = 22, scale = 0)),
		@AttributeOverride(name = "nro", column = @Column(name = "NRO" ,precision = 22, scale = 0))
	})
	private LineafacturaID id;
	
	@Column(name = "DESCRIPCION", length = 10)
	private String descripcion;

	@Column(name = "IMPORTE", precision = 7, scale = 2)
	private BigDecimal importe;

	@Column(name = "UNIDADES", precision = 22, scale = 0)
	private BigDecimal unidades;

	//bi-directional many-to-one association to Factura
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="NRO", nullable = false, insertable = false, updatable = false)
	private Factura factura;

	public Lineafactura() {
	}

	public LineafacturaID getId() {
		return this.id;
	}

	public void setId(LineafacturaID id) {
		this.id = id;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public BigDecimal getImporte() {
		return this.importe;
	}

	public void setImporte(BigDecimal importe) {
		this.importe = importe;
	}

	public BigDecimal getUnidades() {
		return this.unidades;
	}

	public void setUnidades(BigDecimal unidades) {
		this.unidades = unidades;
	}

	public Factura getFactura() {
		return this.factura;
	}

	public void setFactura(Factura factura) {
		this.factura = factura;
	}

}