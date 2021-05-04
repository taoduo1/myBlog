package com.example.myblog.test.designpatternDemo.filterpattern;

import java.util.ArrayList;
import java.util.List;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/4/22 22:02
 */

public class CriteriaMale implements Criteria {

    @Override
    public List<Person> meetCriteria(List<Person> persons) {
        List<Person> malePersons = new ArrayList<Person>();
        for (Person person : persons) {
            if(person.getGender().equalsIgnoreCase("MALE")){
                malePersons.add(person);
            }
        }
        return malePersons;
    }
}