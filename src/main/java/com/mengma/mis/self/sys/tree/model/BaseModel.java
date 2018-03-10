package com.mengma.mis.self.sys.tree.model;

import javax.persistence.Transient;
import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author 
 *
 */
public abstract class BaseModel implements Serializable {

	private static final long serialVersionUID = 1L;

	static final String[] types2 = { "java.lang.Integer", "java.lang.String", "java.lang.Boolean",
			"java.lang.Character", "java.lang.Float", "java.lang.Double", "java.lang.Long",
			"java.lang.Short", "java.lang.Byte", "java.util.Date" };

	/**
	 * 
	 * @param model
	 * @param parms
	 * @param tableName
	 * @param ignore			需要忽略的字段
	 * @return
	 */
	public static String genUpdateSql(BaseModel model, Map<String, Object> parms, String tableName,
			List<String> ignore) {
		if (model == null)
			return "";

		if (ignore == null) {
			ignore = new ArrayList<String>();
		}

		StringBuilder sql = new StringBuilder("update ");
		sql.append(tableName).append(" set");

		Field[] fields = model.getClass().getDeclaredFields();

		for (int j = 0; j < fields.length; j++) {
			fields[j].setAccessible(true);
			for (int i = 0; i < types2.length; i++) {

				if (fields[j].getType().getName().equalsIgnoreCase(types2[i])
						&& !Modifier.isStatic(fields[j].getModifiers())) {
					try {
						Field field = fields[j];
						Object tr = field.getAnnotation(Transient.class);
						String fieldName = field.getName();
						if (tr == null && !ignore.contains(fieldName)) {
							Object fieldValue = fields[j].get(model);
							if (fieldValue != null && fieldValue != "") {
								sql.append(" " + fieldName + " = :" + fieldName).append(",");
								parms.put(fieldName, fieldValue);
							}
						}
						/*if (tr == null && !ignore.contains(fieldName)) {
							Object fieldValue = fields[j].get(model);
							if (fieldValue != null) {
								sql.append(" " + fieldName + " = :" + fieldName).append(",");
								parms.put(fieldName, fieldValue);
							}
						}*/

					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}

		String editSql = sql.toString();

		if (editSql.endsWith(",")) {
			editSql = editSql.substring(0, editSql.length() - 1);
		}

		if (editSql.equals("update " + tableName + " set")) {
			return "";
		}

		return editSql;
	}
}

