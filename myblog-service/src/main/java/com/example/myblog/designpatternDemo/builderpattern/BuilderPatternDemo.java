package com.example.myblog.designpatternDemo.builderpattern;

/**
 * @author : duo.tao
 * @description : 建造者模式 就是 要构建一个复杂的类的时候，把构建这个复杂的类的过程 放在这个builder类中去构建
 *
 * @date : 2021/4/20 22:25
 */

public class BuilderPatternDemo {

    public static void main(String[] args) {
        MealBuilder mealBuilder = new MealBuilder();

        Meal vegMeal = mealBuilder.prepareVegMeal();
        System.out.println("Veg Meal");
        vegMeal.showItems();
        System.out.println("Total Cost: " +vegMeal.getCost());

        Meal nonVegMeal = mealBuilder.prepareNonVegMeal();
        System.out.println("Non-Veg Meal");
        nonVegMeal.showItems();
        System.out.println("Total Cost: " +nonVegMeal.getCost());
    }
}
