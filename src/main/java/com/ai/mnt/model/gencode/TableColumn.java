package com.ai.mnt.model.gencode;

public class TableColumn {

    // Schema
    public String tableSchema;
    // 表名
    public String tableName;
    //字段名
    public String columnName;
    // 字段数据类型
    public String dataType;
    // 主键 PRI
    public String columnKey;
    // 自增长 auto_increment
    public String extra;
    // 字段注释
    public String columnComment;

    public String javaField;
    public String javaType;

    public String getTableSchema() {
        return tableSchema;
    }

    public void setTableSchema(String tableSchema) {
        this.tableSchema = tableSchema;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }

    public String getDataType() {
        return dataType;
    }

    public void setDataType(String dataType) {
        this.dataType = dataType;
    }

    public String getColumnKey() {
        return columnKey;
    }

    public void setColumnKey(String columnKey) {
        this.columnKey = columnKey;
    }

    public String getExtra() {
        return extra;
    }

    public void setExtra(String extra) {
        this.extra = extra;
    }

    public String getColumnComment() {
        return columnComment;
    }

    public void setColumnComment(String columnComment) {
        this.columnComment = columnComment;
    }

    public String getJavaField() {
        return javaField;
    }

    public void setJavaField(String javaField) {
        this.javaField = javaField;
    }

    public String getJavaType() {
        return javaType;
    }

    public void setJavaType(String javaType) {
        this.javaType = javaType;
    }

    @Override
    public String toString() {
        return "TableColumn [tableSchema=" + tableSchema + ", tableName="
                + tableName + ", columnName=" + columnName + ", dataType="
                + dataType + ", columnKey=" + columnKey + ", extra=" + extra
                + ", columnComment=" + columnComment + ", javaField="
                + javaField + ", javaType=" + javaType + "]";
    }


}
