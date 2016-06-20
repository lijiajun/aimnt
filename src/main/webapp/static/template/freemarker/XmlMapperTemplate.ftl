<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="com.ai.mnt.persistence.${module}.${modelName}Mapper">

    <resultMap id="${modelName}ResultMap" type="com.ai.mnt.model.${module}.${modelName}">
        <#list columns as column>
        <#if column.columnKey == "PRI">
        <id column="${column.columnName}" property="${column.javaField}" />
        <#else>
        <result column="${column.columnName}" property="${column.javaField}" />
        </#if>
        </#list>
    </resultMap>

    <sql id="${modelName}Columns">
        <#list columns as column>
        ${column.columnName}<#if column_has_next>,</#if>
        </#list>
    </sql>

    <insert id="save" useGeneratedKeys="true" keyProperty="${pkJavaField}">
        insert into ${tableName} (
        <#list columns as column>
        <#if column.columnKey != "PRI" && column.extra != "auto_increment">
        ${column.columnName}<#if column_has_next>,</#if>
        </#if>
        </#list>
        )
        values (
        <#list columns as column>
        <#if column.columnKey != "PRI" && column.extra != "auto_increment">
        ${"#{"}${column.javaField}}<#if column_has_next>,</#if>
        </#if>
        </#list>
        )
    </insert>

    <insert id="saveAll">
        insert into ${tableName} (
        <#list columns as column>
        <#if column.columnKey != "PRI" && column.extra != "auto_increment">
        ${column.columnName}<#if column_has_next>,</#if>
        </#if>
        </#list>
        )
        values
        <foreach item="item" collection="list" separator=",">
            (
            <#list columns as column>
            <#if column.columnKey != "PRI" && column.extra != "auto_increment">
            ${"#{"}item.${column.javaField}}<#if column_has_next>,</#if>
            </#if>
            </#list>
            )
        </foreach>
    </insert>

    <delete id="deleteByPrimaryKey">
        delete from ${tableName}
        where
        ${pkField} = ${"#{"}${pkJavaField}}
    </delete>

    <delete id="deleteList">
        delete from ${tableName}
        where ${pkField} in
        <foreach item="item" collection="list" separator="," open="(" close=")">
            ${"#{"}item}
        </foreach>
    </delete>

    <update id="updateByPrimaryKey">
        update ${tableName}
        <set>
            <#list columns as column>
            <#if column.columnKey != 'PRI'>
            <if test="${column.javaField} != null">
                ${column.columnName} = ${"#{"}${column.javaField}}<#if column_has_next>,</#if>
            </if>
            </#if>
            </#list>
        </set>
        where
        ${pkField} = ${"#{"}${pkJavaField}}
    </update>

    <select id="findByPrimaryKey" resultMap="${modelName}ResultMap">
        select
        <include refid="${modelName}Columns" />
        from ${tableName}
        where ${pkField} = ${"#{"}${pkJavaField}}
    </select>

    <select id="findList" resultMap="${modelName}ResultMap">
        select
        <include refid="${modelName}Columns" />
        from ${tableName}
        <where>
            <#list columns as column>
            <#if column.javaType == "String">
            <if test="${column.javaField} != null and ${column.javaField} != ''">
            <#else>
            <if test="${column.javaField} != null">
            </#if>
                <#if column_index != 0>and </#if>${column.columnName} = ${"#{"}${column.javaField}}
            </if>
            </#list>
        </where>
    </select>

    <select id="findAll" resultMap="${modelName}ResultMap">
        select
        <include refid="${modelName}Columns" />
        from ${tableName}
    </select>
    
    <cache type="org.mybatis.caches.ehcache.EhcacheCache"/>
    
</mapper>