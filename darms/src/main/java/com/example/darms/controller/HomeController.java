package com.example.darms.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResourceLoader;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.darms.entity.Districts;
import com.example.darms.entity.DocumentTypes;
import com.example.darms.entity.Documents;
import com.example.darms.entity.LoginTypes;
import com.example.darms.entity.Menus;
import com.example.darms.entity.Roles;
import com.example.darms.entity.StorageInfo;
import com.example.darms.entity.Tahsils;
import com.example.darms.entity.Users;
import com.example.darms.entity.Villages;
import com.example.darms.pojo.AccessPermission;
import com.example.darms.pojo.DoctypeEntry;
import com.example.darms.pojo.DocumentEntry;
import com.example.darms.pojo.MenuEntry;
import com.example.darms.pojo.PasswordUpdate;
import com.example.darms.pojo.StorageEntry;
import com.example.darms.pojo.UserEntry;
import com.example.darms.pojo.UserLogin;
//import com.example.darms.pojo.UserList;
import com.example.darms.repository.District;
import com.example.darms.repository.DocumentRepo;
import com.example.darms.repository.DocumentRepo.DocumentList;
import com.example.darms.repository.DocumentTypeRepo;
import com.example.darms.repository.LoginType;
import com.example.darms.repository.MenuRepo;
import com.example.darms.repository.MenuRepo.MenuList;
import com.example.darms.repository.Role;
import com.example.darms.repository.StorageRepo;
import com.example.darms.repository.StorageRepo.StorageDetail;
import com.example.darms.repository.Tahsil;
import com.example.darms.repository.User;
import com.example.darms.repository.User.UserDetail;
import com.example.darms.repository.User.UserList;
import com.example.darms.repository.Village;
import com.example.darms.services.DocumentService;
import com.example.darms.services.FileUploadService;
import com.example.darms.services.UserService;

@Controller
public class HomeController {
	
	@Autowired
	ResourceLoader resourceLoader;
	@Autowired
	District districtModel;
	@Autowired
	Tahsil tehsilModel;
	@Autowired
	Village villageModel;
	@Autowired
	LoginType loginTypeModel;
	@Autowired
	MenuRepo menuModel;
	@Autowired
	DocumentTypeRepo doctypeModel;
	@Autowired
	User userModel;
	@Autowired
	Role roleModel;
	@Autowired
	StorageRepo storageModel;
	@Autowired
	DocumentRepo documentModel;
	@Autowired
	FileUploadService fileUploadService;
	@Autowired
	DocumentService documentService;
	@Autowired
	UserService userService;
	
	//private static String UPLOAD_FOLDER = "F://uploads//";
	
	@RequestMapping("/")
	public String index(ModelMap map) {
		
		System.out.println("success");
		System.out.println("ab");
		return "Login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET )
	public String login() {
		return "Login";
	}
	
	@RequestMapping(value = "/loginaction", method = RequestMethod.POST)
	public String loginaction(@Valid @ModelAttribute("userLogin") UserLogin user, BindingResult result, RedirectAttributes redirectAttr, ModelMap map, HttpSession session) {
		String listtype;
		List<LoginTypes> logintypelist = new ArrayList<LoginTypes>();
		List<Districts> districtlist = new ArrayList<Districts>();
		List<Tahsils> tehsillist = new ArrayList<Tahsils>();
		if(user.getUserTypeId() == 2 || user.getUserTypeId() == 3)
	   	{
			if(user.getUserTypeId() == 2) { listtype = "B"; } else { listtype = "C"; }
			logintypelist = loginTypeModel.getAllLoginTypes(listtype);
	   	} else {
	   		districtlist = districtModel.getAllDistricts();
	   		tehsillist = tehsilModel.getDistTahsil(String.valueOf(user.getDistrictCode()));
	   	}
		map.addAttribute("logintypelist", logintypelist);
		map.addAttribute("districtlist", districtlist);
		map.addAttribute("tehsillist", tehsillist);
		if (result.hasErrors()) {
			/*
			 * map.addAttribute("UserId", user.getUserId()); map.addAttribute("userTypeId",
			 * user.getUserTypeId()); map.addAttribute("loginTypeId",
			 * user.getLoginTypeId()); map.addAttribute("districtCode",
			 * user.getDistrictCode()); map.addAttribute("tehsilCode",
			 * user.getTehsilCode());
			 */
			return "Login";
	    }
		BCryptPasswordEncoder bcryptEncoder = new BCryptPasswordEncoder();
		UserDetail userdetail = userModel.getUserLoginDetail(user.getUserId(), user.getUserTypeId(), user.getLoginTypeId(), user.getDistrictCode(), user.getTehsilCode());
		//UserDetail userdetail = userModel.getUserDetail(user.getUserId(), user.getUserTypeId());
		//String dbpassword = userModel.getUserPassword(user.getUserId(), user.getUserTypeId());
		System.out.println(userdetail);
		if(userdetail != null) {
			try {
				boolean response = bcryptEncoder.matches(user.getPassword(), userdetail.getPassword());
				System.out.println(response);
				if(response == true) {
					String menuids = roleModel.getMenusByRole(userdetail.getRole_id());
					String[] menuArray = null;
					if(menuids != null) {
						menuArray = menuids.split(",");
					}
					List<MenuList> access = menuModel.getAccessPermission(menuArray);
					
					session.setAttribute("id", userdetail.getId());
					session.setAttribute("userId", user.getUserId());
					session.setAttribute("userTypeId", user.getUserTypeId());
					session.setAttribute("loginTypeId", user.getLoginTypeId());
					session.setAttribute("districtCode", user.getDistrictCode());
					session.setAttribute("tehsilCode", user.getTehsilCode());
					session.setAttribute("userName", userdetail.getName());
					session.setAttribute("districtName", userdetail.getDistrict_name());
					session.setAttribute("districtNameHindi", userdetail.getDistrict_name_hindi());
					session.setAttribute("userType", userdetail.getUsertype());
					session.setAttribute("loginType", userdetail.getLogintype());
					session.setAttribute("tnameEng", userdetail.getTname_eng());
					session.setAttribute("tname", userdetail.getTname());
					session.setAttribute("roleId", userdetail.getRole_id());
					session.setAttribute("roleName", userdetail.getRolename());
					session.setAttribute("menuAccess", access);
					return "redirect:/dashboard";
				} else {
					redirectAttr.addFlashAttribute("msg", "danger");
					redirectAttr.addFlashAttribute("message", "Invalid login details! Please try again.");
					return "redirect:/login";
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			redirectAttr.addFlashAttribute("msg", "danger");
			redirectAttr.addFlashAttribute("message", "Invalid login details! Please try again.");
			return "redirect:/login";
		}
		return "redirect:/dashboard";
	}
	
	@RequestMapping("/dashboard")
	public String dashboard(HttpServletRequest request, ModelMap map, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		System.out.println(request.getRequestURI());
		map.addAttribute("requestUri", request.getRequestURI());
		return "Dashboard";
	}
	
	@RequestMapping(value = "/menu_master", method = { RequestMethod.POST,  RequestMethod.GET })
	public String menuMaster(HttpServletRequest request, ModelMap map, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		List<MenuList> menudata = menuModel.getAllMenus();
		map.addAttribute("menudata", menudata);
		map.addAttribute("requestUri", request.getRequestURI());
		return "MenuMaster";
	}
	
	@RequestMapping(value = "/add_menu", method = RequestMethod.GET)
	public String addMenu(@RequestParam(required = false) Integer id, ModelMap map, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		List<Menus> menuoptions = menuModel.getMenuOptions();
		map.addAttribute("menuoptions", menuoptions);
		if(id != null) {
			Menus menudata = menuModel.getMenuById(id);
			map.addAttribute("menudata", menudata);
		}
		map.addAttribute("requestUri", "/menu_master");
		return "AddMenu";
	}
	
	@RequestMapping(value = "/submit_menu", method = RequestMethod.POST)
	public String saveMenu(@RequestParam(required = false) Integer id, @Valid @ModelAttribute("menuEntry") MenuEntry menu, BindingResult result, RedirectAttributes redirectAttr, ModelMap map, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		Menus menudata = null;
		List<Menus> menuoptions = menuModel.getMenuOptions();
		map.addAttribute("menuoptions", menuoptions);
		if(id != null) {
			menudata = menuModel.getMenuById(id);
			map.addAttribute("menudata", menudata);
		}
		if (result.hasErrors()) {
			return "AddMenu";
	    }
		Timestamp timestampNow = new Timestamp(System.currentTimeMillis());
		if(menudata != null) {
			menudata.setParentId(menu.getParent_id());
			menudata.setName(menu.getName());
			menudata.setNameEng(menu.getName_eng());
			menudata.setMappedUrl(menu.getMapped_url());
			menuModel.save(menudata);
		} else {
			Menus ab = new Menus(menu.getParent_id(), menu.getName(), menu.getName_eng(), timestampNow, true, menu.getMapped_url());
			menuModel.save(ab);
		}
		redirectAttr.addFlashAttribute("msg", "success");
		redirectAttr.addFlashAttribute("message", "Menu saved successfully.");
		return "redirect:/menu_master";
	}
	
	@RequestMapping(value = "/access_permission", method = RequestMethod.GET)
	public String accessPermission(ModelMap map, HttpSession session, HttpServletRequest request) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		List<Menus> menus = new ArrayList<Menus>();
		List<Menus> menudata = menuModel.getMenuOptions();
		if (menudata != null && !menudata.isEmpty()) {
			for (Menus menu : menudata) {
				menus.add(new Menus(menu.getId(), menu.getParentId(), menu.getName(), menu.getNameEng()));
				List<Menus> submenudata = menuModel.getSubMenuOptions(menu.getId());
				if (submenudata != null && !submenudata.isEmpty()) {
					for (Menus val : submenudata) {
						menus.add(new Menus(val.getId(), val.getParentId(), val.getName(), val.getNameEng()));
					}
				}
			}
		}
		List<Roles> rolelist = roleModel.findAll();
		map.addAttribute("rolelist", rolelist);
		map.addAttribute("menudata", menus);
		map.addAttribute("requestUri", request.getRequestURI());
		return "AccessPermission";
	}
	
	@RequestMapping(value = "/submit_access_permission", method = RequestMethod.POST)
	public String saveAccessPermission(@RequestParam(name="menuId", required = false) List<Integer> menuId, @Valid @ModelAttribute("accessPermission") AccessPermission access, BindingResult result, RedirectAttributes redirectAttr, ModelMap map, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		List<Menus> menus = new ArrayList<Menus>();
		List<Menus> menudata = menuModel.getMenuOptions();
		if (menudata != null && !menudata.isEmpty()) {
			for (Menus menu : menudata) {
				menus.add(new Menus(menu.getId(), menu.getParentId(), menu.getName(), menu.getNameEng()));
				List<Menus> submenudata = menuModel.getSubMenuOptions(menu.getId());
				if (submenudata != null && !submenudata.isEmpty()) {
					for (Menus val : submenudata) {
						menus.add(new Menus(val.getId(), val.getParentId(), val.getName(), val.getNameEng()));
					}
				}
			}
		}
		List<Roles> rolelist = roleModel.findAll();
		map.addAttribute("rolelist", rolelist);
		map.addAttribute("menudata", menus);
		
		if (result.hasErrors()) {
			return "AccessPermission";
	    }
		Roles roledata = null;
		if(menuId != null && !menuId.isEmpty()) {
			roledata = roleModel.getRoleByRoleId(access.getRoleId());
			String menuids = StringUtils.join(menuId, ",");
			roledata.setMenus(menuids);
			roleModel.save(roledata);
			redirectAttr.addFlashAttribute("msg", "success");
			redirectAttr.addFlashAttribute("message", "Access Permission saved successfully.");
		} else {
			redirectAttr.addFlashAttribute("msg", "danger");
			redirectAttr.addFlashAttribute("message", "Please select menus from the list!");
		}
		return "redirect:/access_permission";
	}
	
	@RequestMapping(path = "/rolewise_access_permission", method = RequestMethod.GET)
	public String rolewiseAccess(@RequestParam int roleId, ModelMap map) {
		List<Menus> menus = new ArrayList<Menus>();
		List<Menus> menudata = menuModel.getMenuOptions();
		if (menudata != null && !menudata.isEmpty()) {
			for (Menus menu : menudata) {
				menus.add(new Menus(menu.getId(), menu.getParentId(), menu.getName(), menu.getNameEng()));
				List<Menus> submenudata = menuModel.getSubMenuOptions(menu.getId());
				if (submenudata != null && !submenudata.isEmpty()) {
					for (Menus val : submenudata) {
						menus.add(new Menus(val.getId(), val.getParentId(), val.getName(), val.getNameEng()));
					}
				}
			}
		}
		String menuids = roleModel.getMenusByRole(roleId);
		String[] menuArray = null;
		if(menuids != null) {
			menuArray = menuids.split(",");
		}
		List<Integer> menuList = new ArrayList<Integer>();
		if (menuArray != null) {
			for (String number : menuArray) {
				menuList.add(Integer.parseInt(number.trim()));
			}
		}
		map.addAttribute("menudata", menus);
		map.addAttribute("menuList", menuList);
		return "AccessMenuAjax";
	}
	
	@RequestMapping(value = "/document_types", method = { RequestMethod.POST,  RequestMethod.GET })
	public String documentTypes(HttpServletRequest request, ModelMap map, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		List<DocumentTypes> documenttypedata = doctypeModel.getAllDocumentTypes();
		map.addAttribute("documenttypedata", documenttypedata);
		map.addAttribute("requestUri", request.getRequestURI());
		return "DocumentTypes";
	}
	
	@RequestMapping(value = "/add_doc_type", method = RequestMethod.GET)
	public String addDocType(@RequestParam(required = false) Integer code, ModelMap map, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		if(code != null) {
			DocumentTypes doctypedata = doctypeModel.getDocumentTypeByCode(code);
			map.addAttribute("doctypedata", doctypedata);
		}
		map.addAttribute("requestUri", "/document_types");
		return "AddDocType";
	}
	
	@RequestMapping(value = "/submit_doc_type", method = RequestMethod.POST)
	public String saveDocType(@RequestParam(required = false) Integer code, @Valid @ModelAttribute("doctypeEntry") DoctypeEntry store, BindingResult result, RedirectAttributes redirectAttr, ModelMap map, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		DocumentTypes doctypedata = null;
		if(code != null) {
			doctypedata = doctypeModel.getDocumentTypeByCode(code);
			map.addAttribute("doctypedata", doctypedata);
		}
		if (result.hasErrors()) {
			map.addAttribute("code", store.getCode());
			map.addAttribute("name", store.getName());
			map.addAttribute("type", store.getType());
			return "AddDocType";
	    }
		if(doctypedata != null) {
			doctypedata.setCode(store.getCode());
			doctypedata.setName(store.getName());
			doctypedata.setType(store.getType());
			doctypeModel.save(doctypedata);
		} else {
			DocumentTypes ab = new DocumentTypes(store.getCode(), store.getName(), store.getType(), true);
			doctypeModel.save(ab);
		}
		redirectAttr.addFlashAttribute("msg", "success");
		redirectAttr.addFlashAttribute("message", "Document Type saved successfully.");
		return "redirect:/document_types";
	}
	
	@RequestMapping(value = "/storage_info", method = RequestMethod.GET)
	public String storageInfo(HttpServletRequest request, ModelMap map, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		String districtCode = (String) session.getAttribute("districtCode");
		String tehsilCode = (String) session.getAttribute("tehsilCode");
		StorageInfo storagedata = storageModel.getStorageByTehsil(districtCode, tehsilCode);
		System.out.println(storagedata);
		map.addAttribute("storagedata", storagedata);
		map.addAttribute("requestUri", request.getRequestURI());
		return "StorageInfo";
	}
	
	@RequestMapping(value = "/submit_storage_info", method = RequestMethod.POST)
	public String saveStorage(@Valid @ModelAttribute("storageEntry") StorageEntry store, BindingResult result, RedirectAttributes redirectAttr, ModelMap map, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		String districtCode = (String) session.getAttribute("districtCode");
		String tehsilCode = (String) session.getAttribute("tehsilCode");
		StorageInfo storagedata = storageModel.getStorageByTehsil(districtCode, tehsilCode);
		map.addAttribute("storagedata", storagedata);
		if (result.hasErrors()) {
			map.addAttribute("total_compactors", store.getTotal_compactors());
			map.addAttribute("total_racks", store.getTotal_racks());
			map.addAttribute("total_bundles", store.getTotal_bundles());
			return "StorageInfo";
	    }
		if(storagedata != null) {
			storagedata.setTotal_compactors(store.getTotal_compactors());
			storagedata.setTotal_racks(store.getTotal_racks());
			storagedata.setTotal_bundles(store.getTotal_bundles());
			storageModel.save(storagedata);
		} else {
			StorageInfo ab = new StorageInfo(districtCode, tehsilCode, store.getTotal_compactors(), store.getTotal_racks(), store.getTotal_bundles());
			storageModel.save(ab);
		}
		redirectAttr.addFlashAttribute("msg", "success");
		redirectAttr.addFlashAttribute("message", "Storage information saved successfully.");
		return "redirect:/storage_info";
	}
	
	@RequestMapping(value = "/storage_detail", method = RequestMethod.GET)
	public String storageDetail(HttpServletRequest request, ModelMap map, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		List<StorageDetail> storagedata = storageModel.getStorageDetail();
		map.addAttribute("storagedata", storagedata);
		map.addAttribute("requestUri", request.getRequestURI());
		return "StorageDetail";
	}
	
	@RequestMapping(value = "/add_user", method = RequestMethod.GET)
	public String addUser(HttpServletRequest request, ModelMap map, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		List<Roles> rolelist = new ArrayList<Roles>();
		rolelist = roleModel.findAll(Sort.by(Sort.Direction.ASC, "nameEng"));
		Users userdata = new Users();
		userdata.setUserTypeId(0);
		map.addAttribute("rolelist", rolelist);
		map.addAttribute("userdata", userdata);
		map.addAttribute("requestUri", request.getRequestURI());
		//session.setAttribute("userdata", userdata);
		return "AddUser";
	}
	
	@RequestMapping(path = "/edit_user", method = RequestMethod.GET)
	public String editUser(@RequestParam long id, HttpServletRequest request, ModelMap map, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		List<Roles> rolelist = new ArrayList<Roles>();
		List<LoginTypes> logintypelist = new ArrayList<LoginTypes>();
		List<Districts> districtlist = new ArrayList<Districts>();
		List<Tahsils> tehsillist = new ArrayList<Tahsils>();
		rolelist = roleModel.findAll();
		Users userdata = userModel.findById(id);
		String listtype;
		if(userdata.getUserTypeId() == 2 || userdata.getUserTypeId() == 3)
	   	{
			if(userdata.getUserTypeId() == 2) { listtype = "B"; } else { listtype = "C"; }
			logintypelist = loginTypeModel.getAllLoginTypes(listtype);
	   	} else {
	   		districtlist = districtModel.getAllDistricts();
	   		tehsillist = tehsilModel.getDistTahsil(String.valueOf(userdata.getDistrictCode()));
	   	}
		map.addAttribute("logintypelist", logintypelist);
		map.addAttribute("districtlist", districtlist);
		map.addAttribute("tehsillist", tehsillist);
		map.addAttribute("rolelist", rolelist);
		map.addAttribute("userdata", userdata);
		map.addAttribute("requestUri", "/view_users");
		return "AddUser";
	}
	
	@RequestMapping(value = "/submit_user", method = RequestMethod.POST)
	public String addUser(@RequestParam(required = false) Long id, @Valid @ModelAttribute("userEntry") UserEntry user, BindingResult result, RedirectAttributes redirectAttr, ModelMap map, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		String listtype;
		List<Roles> rolelist = roleModel.findAll();
		List<LoginTypes> logintypelist = new ArrayList<LoginTypes>();
		List<Districts> districtlist = new ArrayList<Districts>();
		List<Tahsils> tehsillist = new ArrayList<Tahsils>();
		Users userdata = userModel.findById(id);
		if(user.getUserTypeId() == 2 || user.getUserTypeId() == 3)
	   	{
			if(user.getUserTypeId() == 2) { listtype = "B"; } else { listtype = "C"; }
			logintypelist = loginTypeModel.getAllLoginTypes(listtype);
	   	} else {
	   		districtlist = districtModel.getAllDistricts();
	   		tehsillist = tehsilModel.getDistTahsil(String.valueOf(user.getDistrictCode()));
	   	}
		if (result.hasErrors()) {
			map.addAttribute("userdata", userdata);
			map.addAttribute("logintypelist", logintypelist);
			map.addAttribute("districtlist", districtlist);
			map.addAttribute("tehsillist", tehsillist);
			map.addAttribute("rolelist", rolelist);
			return "AddUser";
	    }
		Timestamp timestampNow = new Timestamp(System.currentTimeMillis());
		BCryptPasswordEncoder bcryptEncoder = new BCryptPasswordEncoder();
		if(id > 0) {
			userdata.setName(user.getName());
			userdata.setMobile(user.getMobile());
			userdata.setRoleId(user.getRoleId());
			userdata.setUserTypeId(user.getUserTypeId());
			userdata.setLoginTypeId(user.getLoginTypeId());
			userdata.setDistrictCode(user.getDistrictCode());
			userdata.setTehsilCode(user.getTehsilCode());
			userdata.setModifiedAt(timestampNow);
			if(user.getPassword() != "") {
				String hashedPassword = bcryptEncoder.encode(user.getPassword());
				userdata.setPassword(hashedPassword);
			}
			userModel.save(userdata);
			redirectAttr.addFlashAttribute("msg", "success");
			redirectAttr.addFlashAttribute("message", "User updated successfully.");
		} else {
			String hashedPassword = bcryptEncoder.encode(user.getPassword());
			Users ab = new Users(user.getName(), user.getMobile(), user.getUserId(), hashedPassword, user.getRoleId(), 
					user.getUserTypeId(), user.getLoginTypeId(), user.getDistrictCode(), user.getTehsilCode(), 0, timestampNow,
					0, null, true);
			userModel.save(ab);
			redirectAttr.addFlashAttribute("msg", "success");
			redirectAttr.addFlashAttribute("message", "User added successfully.");
		}
		return "redirect:/view_users";
	}
	
	@RequestMapping(value = "/view_users", method = { RequestMethod.POST,  RequestMethod.GET })
	public String viewUsers(@RequestParam(defaultValue="1", required = false) int page, @RequestParam(defaultValue="20", required = true) int size, @RequestParam(defaultValue="", required = false) String user_id, @RequestParam(defaultValue="", required = false) String mobile_no, @RequestParam(defaultValue="", required = false) String tehsil_code, ModelMap map, HttpSession session, HttpServletRequest request) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		List<Tahsils> tehsillist = tehsilModel.getAllTehsil();
		Page<UserList> pages = userService.findAll(page, size, tehsil_code, user_id, mobile_no); //userService.findAll(page, size);
		//List<Users> userlist = new ArrayList<Users>();
		map.addAttribute("user_id", user_id);
		map.addAttribute("mobile_no", mobile_no);
		map.addAttribute("tehsil_code", tehsil_code);
		map.addAttribute("tehsillist", tehsillist);
		map.addAttribute("number", pages.getNumber());
		map.addAttribute("totalPages", pages.getTotalPages());
		map.addAttribute("totalElements", pages.getTotalElements());
		map.addAttribute("size", pages.getSize());
		map.addAttribute("pagedata", pages.getContent());
		map.addAttribute("requestUri", request.getRequestURI());
		return "ViewUsers";
	}
	
	@RequestMapping(path = "/get_login_type_list", method = RequestMethod.GET)
	@ResponseBody
	public List<LoginTypes> getLoginTypeList(@RequestParam String type, ModelMap map) {
		List<LoginTypes> loginTypeList = loginTypeModel.getAllLoginTypes(type);
		return loginTypeList;
	}
	
	@RequestMapping(path = "/get_districts", method = RequestMethod.GET)
	@ResponseBody
	public List<Districts> getDistricts(ModelMap map) {
		List<Districts> districtList = districtModel.getAllDistricts();
		return districtList;
	}
	
	@RequestMapping(path = "/get_tehsils", method = RequestMethod.GET)
	@ResponseBody
	public List<Tahsils> getTahsils(@RequestParam String distCode, ModelMap map) {
		List<Tahsils> tahsilList = tehsilModel.getDistTahsil(distCode);
		return tahsilList;
	}
	
	/*
	 * @RequestMapping(value = "/add_document", method = { RequestMethod.POST,
	 * RequestMethod.GET }) public String addDocument(@RequestParam MultipartFile
	 * file) throws IllegalStateException, IOException {
	 * fileUploadService.uploadFile(file); return "AddDocument"; }
	 */
	
	@RequestMapping(value = "/add_document", method = { RequestMethod.POST,  RequestMethod.GET })
	public String addDocument(HttpServletRequest request, ModelMap map, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		String districtCode = (String) session.getAttribute("districtCode");
		String tehsilCode = (String) session.getAttribute("tehsilCode");
		List<Villages> villageList = villageModel.getTehsilVillage(tehsilCode);
		List<DocumentTypes> documenttypedata = doctypeModel.getDocumentTypeOptions();
		StorageInfo storagedata = storageModel.getStorageByTehsil(districtCode, tehsilCode);
		map.addAttribute("villagedata", villageList);
		map.addAttribute("documenttypedata", documenttypedata);
		map.addAttribute("storagedata", storagedata);
		map.addAttribute("requestUri", request.getRequestURI());
		return "AddDocument";
	}
	
	@RequestMapping(value = "/submit_document", method = { RequestMethod.POST,  RequestMethod.GET })
	public String addDocument(@RequestParam(required = false) Long id, @RequestParam MultipartFile upload, @Valid @ModelAttribute("documentEntry") DocumentEntry document, BindingResult result, RedirectAttributes redirectAttr, ModelMap map, HttpSession session) throws IllegalStateException, IOException {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		String filename = null;
		Documents documentdata = null;
		String districtCode = (String) session.getAttribute("districtCode");
		String tehsilCode = (String) session.getAttribute("tehsilCode");
		List<Villages> villageList = villageModel.getTehsilVillage(tehsilCode);
		List<DocumentTypes> documenttypedata = doctypeModel.getDocumentTypeOptions();
		StorageInfo storagedata = storageModel.getStorageByTehsil(districtCode, tehsilCode);
		map.addAttribute("villagedata", villageList);
		map.addAttribute("documenttypedata", documenttypedata);
		map.addAttribute("storagedata", storagedata);
		if(id != null) {
			documentdata = documentModel.findById(id);
			map.addAttribute("documentdata", documentdata);
		}
		if (result.hasErrors()) {
			return "AddDocument";
	    }
		if (!upload.isEmpty()) {
			fileUploadService.uploadFile(upload, session);
			filename = districtCode +"_"+ tehsilCode +"."+ fileUploadService.getFileExtension(upload.getOriginalFilename());
		}
		Timestamp timestampNow = new Timestamp(System.currentTimeMillis());
		if(id > 0) {
			documentdata.setStartPage(document.getStart_page());
			documentdata.setDocumentType(document.getDocument_type());
			documentdata.setEndPage(document.getEnd_page());
			documentdata.setKhasraNumber(document.getKhasra_number());
			documentdata.setFasliYear(document.getFasli_year());
			documentdata.setVillageCode(document.getVillage_code());
			documentdata.setCompactorNo(document.getCompactor_no());
			documentdata.setRackNo(document.getRack_no());
			documentdata.setBundleNo(document.getBundle_no());
			documentdata.setTotalPages(document.getTotal_pages());
			documentdata.setDescription(document.getDescription()!=null? document.getDescription() : null );
			if(filename != null) {
				documentdata.setFileName(filename);
			}
			documentdata.setModifiedAt(timestampNow);
			documentModel.save(documentdata);
			redirectAttr.addFlashAttribute("msg", "success");
			redirectAttr.addFlashAttribute("message", "Document updated successfully.");
		} else {
			Integer userid = Integer.parseInt(session.getAttribute("id").toString());
			Documents ab = new Documents(document.getStart_page(), document.getDocument_type(), document.getEnd_page(), document.getKhasra_number(), document.getFasli_year(), 
					document.getVillage_code(), document.getOwner_name(), document.getFather_name(), document.getCompactor_no(), document.getRack_no(), document.getBundle_no(), filename!=null?filename:null, document.getTotal_pages(), 
					document.getDescription()!=null?document.getDescription():null, userid, timestampNow, userid,
					null, false, false, false, false);
			documentModel.save(ab);
			redirectAttr.addFlashAttribute("msg", "success");
			redirectAttr.addFlashAttribute("message", "Document added successfully.");
		}
		return "redirect:/view_document";
	}
	
	@RequestMapping(value = "/view_document", method = RequestMethod.GET)
	public String viewDocument(@RequestParam(defaultValue="1", required = false) int page, @RequestParam(defaultValue="20", required = true) int size, HttpServletRequest request, ModelMap map, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		Page<DocumentList> pages = documentService.findNonForwarded(page, size, session);
	     //do other implementations here
		//Page<DocumentList> pages = documentModel.findAllDocumentsWithPage(pageable);
		//List<Users> userlist = new ArrayList<Users>();
		map.addAttribute("number", pages.getNumber());
		map.addAttribute("totalPages", pages.getTotalPages());
		map.addAttribute("totalElements", pages.getTotalElements());
		map.addAttribute("size", pages.getSize());
		map.addAttribute("pagedata", pages.getContent());
		map.addAttribute("requestUri", request.getRequestURI());
		return "ViewDocuments";
	}
	
	@RequestMapping(path = "/edit_document", method = RequestMethod.GET)
	public String editDocument(@RequestParam long id, ModelMap map, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		String districtCode = (String) session.getAttribute("districtCode");
		String tehsilCode = (String) session.getAttribute("tehsilCode");
		List<Villages> villageList = villageModel.getTehsilVillage(tehsilCode);
		List<DocumentTypes> documenttypedata = doctypeModel.getDocumentTypeOptions();
		StorageInfo storagedata = storageModel.getStorageByTehsil(districtCode, tehsilCode);
		Documents documentdata = documentModel.findById(id);
		map.addAttribute("villagedata", villageList);
		map.addAttribute("documenttypedata", documenttypedata);
		map.addAttribute("storagedata", storagedata);
		map.addAttribute("documentdata", documentdata);
		map.addAttribute("requestUri", "/view_document");
		return "AddDocument";
	}
	
	@RequestMapping(value="/forward_for_approval",  method = RequestMethod.POST)
	public String forwardForApproval(@RequestParam(name="sel", required = false) List<String> docids, RedirectAttributes redirectAttr, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		if(docids != null){
			Integer userid = Integer.parseInt(session.getAttribute("id").toString());
	        for(String docidStr : docids){
	        	Documents documentdata = null;
	            long docid = Long.parseLong(docidStr);
	            documentdata = documentModel.findById(docid);
	            documentdata.setForwarded(true);
	            documentdata.setRejected(false);
	            documentdata.setModifiedBy(userid);
	            Timestamp timestampNow = new Timestamp(System.currentTimeMillis());
	            documentdata.setModifiedAt(timestampNow);
				documentModel.save(documentdata);
            }
	        redirectAttr.addFlashAttribute("msg", "success");
			redirectAttr.addFlashAttribute("message", "Selected Documents forwarded for approval successfully.");
	    } else {
	    	redirectAttr.addFlashAttribute("msg", "danger");
			redirectAttr.addFlashAttribute("message", "Please select at least one document from the list!");
	    }
		return "redirect:/view_document";
	}
	
	@RequestMapping(value = "/document_verification", method = RequestMethod.GET)
	public String documentVerification(@RequestParam(defaultValue="1", required = false) int page, @RequestParam(defaultValue="20", required = true) int size, HttpServletRequest request, ModelMap map, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		Page<DocumentList> pages = documentService.findForwarded(page, size, session);
		map.addAttribute("number", pages.getNumber());
		map.addAttribute("totalPages", pages.getTotalPages());
		map.addAttribute("totalElements", pages.getTotalElements());
		map.addAttribute("size", pages.getSize());
		map.addAttribute("pagedata", pages.getContent());
		map.addAttribute("requestUri", request.getRequestURI());
		return "DocumentVerification";
	}
	
	@RequestMapping(value="/verify_document",  method = RequestMethod.POST)
	public String verifyDocument(@RequestParam(name="sel", required = false) List<String> docids, @RequestParam(name="doc_status") String status, @RequestParam(name="remark", required = false) String remark, RedirectAttributes redirectAttr, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		System.out.println(status);
		if(docids != null){
			Integer userid = Integer.parseInt(session.getAttribute("id").toString());
	        for(String docidStr : docids){
	        	Documents documentdata = null;
	            long docid = Long.parseLong(docidStr);
	            documentdata = documentModel.findById(docid);
	            if(status.equals("A")) {
	            	documentdata.setApproved(true);
				} else {
					documentdata.setRejected(true);
					documentdata.setForwarded(false);
				}
	            documentdata.setModifiedBy(userid);
	            Timestamp timestampNow = new Timestamp(System.currentTimeMillis());
	            documentdata.setModifiedAt(timestampNow);
				documentModel.save(documentdata);
            }
	        redirectAttr.addFlashAttribute("msg", "success");
			redirectAttr.addFlashAttribute("message", "Selected Documents " + (status.equals("A")? "Approved": "Rejected") + ".");
	    } else {
	    	redirectAttr.addFlashAttribute("msg", "danger");
			redirectAttr.addFlashAttribute("message", "Please select at least one document from the list!");
	    }
		return "redirect:/document_verification";
	}
	
	@RequestMapping(value = "/view_approved_documents", method = { RequestMethod.POST,  RequestMethod.GET })
	public String viewApprovedDocuments(@RequestParam(defaultValue="1", required = false) int page, @RequestParam(defaultValue="20", required = true) int size, @RequestParam(defaultValue="", required = false) String doc_type, @RequestParam(defaultValue="", required = false) String khasra_number, HttpServletRequest request, ModelMap map, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		System.out.println(doc_type);
		System.out.println(khasra_number);
		List<DocumentTypes> documenttypedata = doctypeModel.getDocumentTypeOptions();
		Page<DocumentList> pages = documentService.findApproved(page, size, doc_type, khasra_number, session);
	    //do other implementations here
		//Page<DocumentList> pages = documentModel.findAllDocumentsWithPage(pageable);
		//List<Users> userlist = new ArrayList<Users>();
		
		map.addAttribute("doc_type", doc_type);
		map.addAttribute("khasra_number", khasra_number);
		map.addAttribute("documenttypedata", documenttypedata);
		map.addAttribute("number", pages.getNumber());
		map.addAttribute("totalPages", pages.getTotalPages());
		map.addAttribute("totalElements", pages.getTotalElements());
		map.addAttribute("size", pages.getSize());
		map.addAttribute("pagedata", pages.getContent());
		map.addAttribute("requestUri", request.getRequestURI());
		return "ViewApprovedDocuments";
	}
	
	@RequestMapping(value = "/view_document_detail", method = { RequestMethod.POST,  RequestMethod.GET })
	public String viewDocumentDetail(@RequestParam long id, ModelMap map, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		DocumentList documentdata = documentModel.findDocumentById(id);
		map.addAttribute("documentdata", documentdata);
		map.addAttribute("requestUri", "/document_verification");
		return "ViewDocumentDetail";
	}
	
	@RequestMapping(value = "/change_password", method = { RequestMethod.POST,  RequestMethod.GET })
	public String changePassword(HttpServletRequest request, ModelMap map, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		map.addAttribute("requestUri", request.getRequestURI());
		return "ChangePassword";
	}
	
	@RequestMapping(path = "/changepass", method = RequestMethod.POST)
	public String changepass(@RequestParam(required = false) Long id, @Valid @ModelAttribute("passwordUpdate") PasswordUpdate pass, BindingResult result, RedirectAttributes redirectAttr, ModelMap map, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		if (result.hasErrors()) {
			return "ChangePassword";
	    }
		String hashedPassword = new BCryptPasswordEncoder().encode(pass.getNew_password());
		BCryptPasswordEncoder bcryptEncoder = new BCryptPasswordEncoder();
		Users user = userModel.findById(id);
		if(user != null) {
			try {
				boolean res = bcryptEncoder.matches(pass.getOld_password(), user.getPassword());
				if(res == true) {
					if(pass.getNew_password().equals(pass.getConfirm_password())) {
						Timestamp timestampNow = new Timestamp(System.currentTimeMillis());
						Users userdata = userModel.findById(id);
						userdata.setPassword(hashedPassword);
						userdata.setModifiedAt(timestampNow);
						userdata.setModifiedBy(Integer.parseInt(session.getAttribute("id").toString()));
						userModel.save(userdata);
						redirectAttr.addFlashAttribute("msg", "success");
						redirectAttr.addFlashAttribute("message", "Password updated successfully.");
						return "redirect:/change_password";
					} else {
						redirectAttr.addFlashAttribute("msg", "danger");
						redirectAttr.addFlashAttribute("message", "Confirm Password not matched!.");
					}
				} else {
					redirectAttr.addFlashAttribute("msg", "danger");
					redirectAttr.addFlashAttribute("message", "Old Password not matched!.");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "redirect:/change_password";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/files/{filename:.+}", produces = "application/pdf")
	@ResponseBody
	public ResponseEntity<?> getFile(@PathVariable String filename) {
		String file = "///F:/uploads//"+filename;
	    try {
	        return ResponseEntity.ok(resourceLoader.getResource("file:" + file));
	    } catch (Exception e) {
	        return ResponseEntity.notFound().build();
	    }
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		if (session != null) {
	        session.invalidate();
	    }
		return "redirect:/";
	}

}
