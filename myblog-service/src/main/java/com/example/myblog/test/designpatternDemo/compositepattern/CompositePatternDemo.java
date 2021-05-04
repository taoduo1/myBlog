package com.example.myblog.test.designpatternDemo.compositepattern;

/**
 * @author : duo.tao
 * @description : 组合模式 组合模式形成树形结构对数据进行整理，以下声明了
 * --CEO
 *     |-Head Sales
 *          |-Sales1
 *          |-Sales2
 *     |-Head Marketing
 *          |-Marketing1
 *          |-Marketing2
 * 这样一个结构，然后可以通过循环或递归调用，完成统计
 * @date : 2021/4/22 22:16
 */

public class CompositePatternDemo {
    public static void main(String[] args) {
        Employee CEO = new Employee("John","CEO", 30000);

        Employee headSales = new Employee("Robert","Head Sales", 20000);
        Employee headMarketing = new Employee("Michel","Head Marketing", 20000);

        CEO.add(headSales);
        CEO.add(headMarketing);

        Employee salesExecutive1 = new Employee("Richard","Sales", 10000);
        Employee salesExecutive2 = new Employee("Rob","Sales", 10000);

        headSales.add(salesExecutive1);
        headSales.add(salesExecutive2);

        Employee clerk1 = new Employee("Laura","Marketing", 10000);
        Employee clerk2 = new Employee("Bob","Marketing", 10000);

        headMarketing.add(clerk1);
        headMarketing.add(clerk2);

        //打印该组织的所有员工
        System.out.println(CEO);
        for (Employee headEmployee : CEO.getSubordinates()) {
            System.out.println(headEmployee);
            for (Employee employee : headEmployee.getSubordinates()) {
                System.out.println(employee);
            }
        }
    }
}
