package pe.edu.unsch.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pe.edu.unsch.dao.ColourDao;
import pe.edu.unsch.entities.*;

@Service("colourService")
@Transactional
public class ColourServiceImpl implements ColourService {
	
	@Autowired
	private ColourDao colourDao;
	
	@Override
	public List<Colour> findAll() {
		return colourDao.findAll();
	}

}
