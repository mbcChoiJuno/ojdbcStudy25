package mbcboard.interfaces;

import java.util.List;

public interface IRepository<T, V> {

	// C
	public void post(T dto);

	// R one
	public T findById(V id);

	// R all
	public List<T> findAll();
	
	// U
	public void update(T dto, V id);
	
	// D
	public void delete(V id);
}
