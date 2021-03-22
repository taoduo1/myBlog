package com.example.myblog.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author duo.tao
 * @since 2021-03-23
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Permission extends Model<Permission> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    private String url;

    private String name;

    private String description;

    private Long pid;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
