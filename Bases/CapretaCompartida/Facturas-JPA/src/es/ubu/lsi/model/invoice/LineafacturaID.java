package es.ubu.lsi.model.invoice;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the LINEASFACTURA database table.
 * 
 */
@Embeddable
public class LineafacturaID implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	private long linea;

	@Column(insertable=false, updatable=false)
	private long nro;

	public LineafacturaID() {
	}
	
	public LineafacturaID(int nro, int linea) {
		this.nro=nro;
		this.linea=linea;
	}
	public long getLinea() {
		return this.linea;
	}
	public void setLinea(long linea) {
		this.linea = linea;
	}
	public long getNro() {
		return this.nro;
	}
	public void setNro(long nro) {
		this.nro = nro;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof LineafacturaID)) {
			return false;
		}
		LineafacturaID castOther = (LineafacturaID)other;
		return 
			(this.linea == castOther.linea)
			&& (this.nro == castOther.nro);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + ((int) (this.linea ^ (this.linea >>> 32)));
		hash = hash * prime + ((int) (this.nro ^ (this.nro >>> 32)));
		
		return hash;
	}
}