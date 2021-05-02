package com.example.myblog.designpatternDemo.filterpattern;

import java.util.ArrayList;
import java.util.List;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/22 22:03
 */

public class CriteriaSingle implements Criteria {

    @Override
    public List<Person> meetCriteria(List<Person> persons) {
        List<Person> singlePersons = new ArrayList<Person>();
        for (Person person : persons) {
            if(person.getMaritalStatus().equalsIgnoreCase("SINGLE")){
                singlePersons.add(person);
            }
        }
        return singlePersons;
    }
}