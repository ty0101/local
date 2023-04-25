package com.blog.dao;

import com.blog.entity.Blogtype;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author KazuGin
 * @since 2019-10-11
 */
public interface BlogtypeMapper extends BaseMapper<Blogtype> {

    /**
     * 查询每个博客分类下的博客名称及博客数量
     * @return
     * @throws Exception
     */
    List<Blogtype> getBlogTypeNameAndBlogCount() throws Exception;
}
