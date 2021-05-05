package com.example.myblog.common.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.Future;
import java.util.Date;

/**
 *  <p> 创建日期 </p>
 *
 * @description:
 * @author: duo.tao
 * @date: 2019/8/18 0018 1:34
 */
@EqualsAndHashCode(callSuper = true)
@Data
public abstract class BaseEntity<T extends Model> extends Model<T> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 创建日期 - 现在时表示主动创建
     */
    @ApiModelProperty(value = "创建日期")
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private Date createTime;
    /**
     * 创建人
     */
    @ApiModelProperty(value = "创建人")
    @TableField(value = "create_by", fill = FieldFill.INSERT)
    private Long createBy;

    /**
     * 修改时间 - 过去分词表示被动更新
     */
    @ApiModelProperty(value = "修改时间")
    @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
    @Future(message = "修改时间必须是将来时间")
    private Date updateTime;
    /**
     * 修改人
     */
    @ApiModelProperty(value = "修改人")
    @TableField(value = "update_by", fill = FieldFill.INSERT_UPDATE)
    private Long updateBy;

    /**
     * 备注
     */
    @ApiModelProperty(value = "备注")
    @TableField(value = "remark", fill = FieldFill.INSERT_UPDATE)
    private String remark;
}
