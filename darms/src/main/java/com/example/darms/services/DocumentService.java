package com.example.darms.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import javax.servlet.http.HttpSession;

import com.example.darms.repository.DocumentRepo;
import com.example.darms.repository.DocumentRepo.DocumentList;

@Service
public class DocumentService {
	
	@Autowired
	DocumentRepo documentModel;
	
	public Page<DocumentList> findNonForwarded(int pageNo, int pageSize, HttpSession session) {
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		Integer userid = Integer.parseInt(session.getAttribute("id").toString());
		Page<DocumentList> pagedata = documentModel.findNonForwardedDocumentsWithPage(pageable, userid);
	    return pagedata;
	}
	
	public Page<DocumentList> findForwarded(int pageNo, int pageSize, HttpSession session) {
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		Integer userTypeId = Integer.parseInt(session.getAttribute("userTypeId").toString());
		Integer loginTypeId = Integer.parseInt(session.getAttribute("loginTypeId").toString());
		String districtCode = session.getAttribute("districtCode").toString();
		String tehsilCode = session.getAttribute("tehsilCode").toString();
		Page<DocumentList> pagedata = documentModel.findForwardedDocumentsWithPage(pageable, userTypeId, loginTypeId, districtCode, tehsilCode);
	    return pagedata;
	}
	
	public Page<DocumentList> findApproved(int pageNo, int pageSize, String doc_type, String khasra_number, HttpSession session) {
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		Integer userid = Integer.parseInt(session.getAttribute("id").toString());
		Integer roleid = Integer.parseInt(session.getAttribute("roleId").toString());
		Integer userTypeId = Integer.parseInt(session.getAttribute("userTypeId").toString());
		Integer loginTypeId = Integer.parseInt(session.getAttribute("loginTypeId").toString());
		String districtCode = session.getAttribute("districtCode").toString();
		String tehsilCode = session.getAttribute("tehsilCode").toString();
		Page<DocumentList> pagedata = documentModel.findApprovedDocumentsWithPage(pageable, userid, doc_type, khasra_number);
		if(roleid == 1 || roleid == 2) {
			pagedata = documentModel.findAllApprovedDocumentsWithPage(pageable, doc_type, khasra_number);
		}
		if(roleid == 6) {
			pagedata = documentModel.findTehsilApprovedDocumentsWithPage(pageable, userTypeId, loginTypeId, districtCode, tehsilCode, doc_type, khasra_number);
		}
	    return pagedata;
	}
}
