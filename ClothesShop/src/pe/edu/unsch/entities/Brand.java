package pe.edu.unsch.entities;
// Generated 02/06/2018 05:10:41 PM by Hibernate Tools 5.2.10.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Brand generated by hbm2java
 */
@Entity
@Table(name = "brand", catalog = "clothesshopdb")
public class Brand implements java.io.Serializable {

	private Integer idbrand;
	private String name;
	private Set<Product> products = new HashSet<Product>(0);

	public Brand() {
	}

	public Brand(String name, Set<Product> products) {
		this.name = name;
		this.products = products;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "idbrand", unique = true, nullable = false)
	public Integer getIdbrand() {
		return this.idbrand;
	}

	public void setIdbrand(Integer idbrand) {
		this.idbrand = idbrand;
	}

	@Column(name = "name", length = 100)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "brand")
	public Set<Product> getProducts() {
		return this.products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

}