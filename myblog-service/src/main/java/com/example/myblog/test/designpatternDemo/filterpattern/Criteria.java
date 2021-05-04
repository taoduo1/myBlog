package com.example.myblog.test.designpatternDemo.filterpattern;

import java.util.List;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/22 22:01
 */

public interface Criteria {
    public List<Person> meetCriteria(List<Person> persons);

}
