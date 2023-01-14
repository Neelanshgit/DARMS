package com.example.darms.pojo;

import java.util.List;

//import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Range;


public class AccessPermission {
	
	@NotNull(message = "Please select role  from the list")
	@Range(min = 1, message= "Please select role from the list")
	private Integer roleId;
	//@NotEmpty(message = "Please select menus")
	private List<Integer> menuId;
	
	public AccessPermission() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AccessPermission(Integer roleId, List<Integer> menuId) {
		super();
		this.roleId = roleId;
		this.menuId = menuId;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public List<Integer> getMenuId() {
		return menuId;
	}

	public void setMenuList(List<Integer> menuId) {
		this.menuId = menuId;
	}

	@Override
	public String toString() {
		return "AccessPermission [roleId=" + roleId + ", menuId=" + menuId + "]";
	}
	
}

