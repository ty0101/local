package com.blog.service;

import com.blog.entity.Blogger;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author KazuGin
 * @since 2019-10-11
 */
public interface BloggerService extends IService<Blogger> {


    /**
     * 根据博主名称查询博主信息
     * @param userName
     * @return
     * @throws Exception
     */
    Blogger findBloggerByUserName(String userName) throws Exception;

}
