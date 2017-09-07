package com.kosta.inhair.service.logic;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.inhair.dao.DesignerDAO;
import com.kosta.inhair.dao.ReserveDAO;
import com.kosta.inhair.domain.Designer;
import com.kosta.inhair.domain.Reserve;
import com.kosta.inhair.service.DesignerService;

@Service
public class DesignerServiceLogic implements DesignerService {
	
	@Autowired
	DesignerDAO designerDAO;
	@Autowired
	ReserveDAO reserveDAO;

	@Override
	public int designerCreate(Designer designer) {
		return designerDAO.designerCreate(designer);
	}

	@Override
	public int designerUpdate(Designer designer) {
		return designerDAO.designerUpdate(designer);
	}

	@Override
	public Designer designerSearch(String designer_id) {
		return designerDAO.designerSearch(designer_id);
	}

	@Override
	public Designer designerSearchByName(String shopCode, String designer_name) {
		return designerDAO.designerSearchByName(shopCode, designer_name);
	}

	@Override
	public int designerDelete(String id, String password) {
		Designer designer = designerDAO.designerSearch(id);
		
		if(password.equals(designer.getPassword())) {
			designerDAO.designerDelete(id, password);
		}
		return 0;
	}

	@Override
	public int designerOut(String id) {
		return designerDAO.designerOut(id);
	}

	@Override
	public List<Designer> designerList() {
		return designerDAO.designerList();
	}

	@Override
	public List<Designer> designerListByHairshop(String shopCode) {
		return designerDAO.designerListByHairshop(shopCode);
	}

	@Override
	public List<Designer> designerListByAddress(String gu) {
		return designerDAO.designerListByAddress(gu);
	}

	@Override
	public boolean idDesignerCheck(String id) {
		return designerDAO.idDesignerCheck(id);
	}

	@Override
	public boolean login(String id, String password) {
		Designer designer = designerDAO.designerSearch(id);
		
		if (designer != null && designer.getPassword().equals(password)){
			return true;
		}
		return false;
	}

	@Override
	public boolean shopCodeCheck(String shopCode) {
		// TODO Auto-generated method stub
		return designerDAO.shopCodeCheck(shopCode);
	}

	@Override
	public List<Designer> openCloseDesignerSchedule(int open, int close, List<Designer> list) {
		List<Designer> result = new ArrayList<Designer>();
		
		for(Designer de : list) {
			int[] sche = new int[48];
			for(int i = 0;i<sche.length;i++) {
				sche[i] = 0;
			}
			for(int i = 0;i<open;i++) {
				sche[i] = 1;
			}
			for(int i = close;i<sche.length;i++) {
				sche[i] = 1;
			}
			de.setSchedule(sche);
			result.add(de);
		}
		
		return result;
	}

	@Override
	public Designer reserveDesignerSchedule(String shopCode, String designer_name, String days, int leadtime, Designer designer) {
		List<Reserve> reserve = reserveDAO.designerSearchByName(shopCode, designer_name, days);
		for(Reserve reserves : reserve) {
			int[] sche = designer.getSchedule();
			int loop = 0;
			for(int i=reserves.getTime();i<sche.length;i++) {
				if(loop == reserves.getLeadtime()){
					break;					
				}else {
					sche[i] = 1;
					loop++;					
				}
			}
			designer.setSchedule(sche);
		}
			int[] sche2 = designer.getSchedule();
			for (int i = 0; i < sche2.length - leadtime; i++) {
		         if (sche2[i] == 0) {
		            int temp = i;
		            for (int j = temp; j < temp + leadtime; j++) {
		               if (sche2[j] == 1) {
		            	   sche2[i] = 1;
		               }
		   
		            }
		         }
		      }
			designer.setSchedule(sche2);

		return designer;
	}

	@Override
	public List<Designer> designerListByDate(String shopCode, String days) {
		return designerDAO.designerListByDate(shopCode, days);
	}

}
