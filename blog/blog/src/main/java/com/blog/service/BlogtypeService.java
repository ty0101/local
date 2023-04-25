package com.blog.service;

import com.blog.entity.Blogtype;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author KazuGin
 * @since 2019-10-11
 */
public interface BlogtypeService extends IService<Blogtype> {
    /**
     * 查询每个博客分类下的博客名称及博客数量
     * @return
     * @throws Exception
     */
    String getBlogTypeNameAndBlogCount() throws Exception;
}
