package com.mengma.mis.self.sys.tree.service;


import com.mengma.mis.core.util.Page;
import com.mengma.mis.self.sys.tree.entity.DirectoryTree;
import com.mengma.mis.self.sys.tree.entity.Tree;

import java.util.List;

/**
 * 
 * @author sdh
 *
 */
public interface DirectoryTreeService {
	public List<DirectoryTree> findAllResourceByTreeCode(String treeCode);
	public List<DirectoryTree> findChildren(DirectoryTree directoryTree);
    public List<DirectoryTree> findResourcePageByTreeCode(DirectoryTree directoryTree, Page<DirectoryTree> page);
	public Integer saveResource(DirectoryTree directoryTree);
	public DirectoryTree findResourceInfo(String id);
	public Integer updateResource(DirectoryTree directoryTree);
	public List<DirectoryTree> findResourceByName(DirectoryTree directoryTree, Page<DirectoryTree> page);
	public List<DirectoryTree> findResourceByParent(DirectoryTree directoryTree, Page<DirectoryTree> page);
	public List<DirectoryTree> searchDirectory(DirectoryTree directoryTree, Page<DirectoryTree> page);
	public Integer selectAndDeleteAllChilds(String id);
	public List<DirectoryTree> checkName(DirectoryTree directoryTree);
	public List<DirectoryTree> checktreeCode(DirectoryTree directoryTree);
	public Integer updateAllChildTreeCode(DirectoryTree directoryTree);	
	public List<DirectoryTree> getAllResource();
	public List<String> getAllChildsId(String id);
	public List<Tree> createOneTree(String treeCode);
	public Integer updateAllChildParentName(DirectoryTree directoryTree);
	public String findAllThisAndChildsId(String[] ids);
}
