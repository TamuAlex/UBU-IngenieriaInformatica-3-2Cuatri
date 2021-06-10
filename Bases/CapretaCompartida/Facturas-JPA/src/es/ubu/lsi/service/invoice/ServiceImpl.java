package es.ubu.lsi.service.invoice;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import es.ubu.lsi.dao.invoice.FacturaDAO;
import es.ubu.lsi.dao.invoice.LineaFacturaDAO;
import es.ubu.lsi.model.invoice.Factura;
import es.ubu.lsi.model.invoice.Lineafactura;
import es.ubu.lsi.model.invoice.LineafacturaID;
import es.ubu.lsi.service.PersistenceException;
import es.ubu.lsi.service.PersistenceService;

/**
 * Transaction service solution.
 * 
 * @author <a href="mailto:jmaudes@ubu.es">Jesús Maudes</a>
 * @author <a href="mailto:rmartico@ubu.es">Raúl Marticorena</a>
 * @author <a href="mailto:mmabad@ubu.es">Mario Martínez</a>
 * @since 1.0
 *
 */
public class ServiceImpl extends PersistenceService implements Service{ // complete with extends and implements

	/** Logger. */
	private static final Logger logger = LoggerFactory
			.getLogger(ServiceImpl.class);

	/**
	 * {@inheritDoc}.
	 * @param line {@inheritDoc}
	 * @param nro {@inheritDoc}
	 * 
	 * @throws PersistenceException {@inheritDoc}
	 */
	@Override
	public void borrarLinea(int line, int nro)
			throws PersistenceException {
		EntityManager em = this.createSession();
		try {
			beginTransaction(em);
			
			
			//DAO
			FacturaDAO facturaDAO = new FacturaDAO(em);
			LineaFacturaDAO lineaFacturaDAO = new LineaFacturaDAO(em);
			
			//Busqueda
			LineafacturaID lineaFacturaId = new LineafacturaID(line, nro);
			Lineafactura lineaFactura = lineaFacturaDAO.findById(lineaFacturaId);
			
			if (lineaFactura != null) {
				//Paso 2
				lineaFacturaDAO.remove(lineaFactura); //Delete
				
				//Localizar factura y actualizar importe
				
				Factura factura = lineaFactura.getFactura();
				factura = facturaDAO.findById(Long.valueOf(nro));
				
				if (factura != null) {
					//Total
					//nuevo importe
					//factura.setTotal(BigDecimal.valueOf());
				} else {
					logger.error("Integridad mal referenciada");
				}
			} else {
				logger.error("Linea factura no encontrada. Error de parametros");
				
				throw new InvoiceException(InvoiceError.NOT_EXIST_INVOICE_LINE);
			}
			
			
			
			commitTransaction(em);
			
		} catch (InvoiceException e) {
			rollbackTransaction(em);
			logger.error("Catch");
		} finally {
			em.close();
		}
	}
	
	
	public List<Factura> consultarFacturasDesequilibradas() throws PersistenceException{
		EntityManager em = this.createSession();
		List<Factura> facturasDesequilibradas = new ArrayList<Factura>();
		
		try {
			
			//Get DAO
			FacturaDAO facturaDAO = new FacturaDAO(em);

			//Sol1
			//List<Factura> facturas = facturaDAO.findAll();
			
			//Sol2
			//List<Factura> facturas = facturaDAO.findAllWithLines();
			
			//Sol3
			List<Factura> facturas = facturaDAO.findAllWithLinesUsingGraph();
			
			for(Factura factura : facturas) {
				Set<Lineafactura> lineasFactura = factura.getLineasfacturas();
				
				//Contador
				float sumaLineas = 0.0F;
				for(Lineafactura lineaFactua : lineasFactura) {
					//Suma
				}
			}
			
		} catch (Exception e) {
			rollbackTransaction(em);
			
		} finally {
			em.close();
		}
		return facturasDesequilibradas;
	}
}
