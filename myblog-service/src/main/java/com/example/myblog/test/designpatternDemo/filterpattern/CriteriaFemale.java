package com.example.myblog.test.designpatternDemo.filterpattern;

import java.util.ArrayList;
import java.util.List;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/22 22:02
 */

public class CriteriaFemale implements Criteria {

    @Override
    public List<Person> meetCriteria(List<Person> persons) {
        List<Person> femalePersons = new ArrayList<Person>();
        for (Person person : persons) {
            if(person.getGender().equalsIgnoreCase("FEMALE")){
                femalePersons.add(person);
            }
        }
        return femalePersons;
    }
}