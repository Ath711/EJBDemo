package com.example.statefulbean;

import jakarta.ejb.Stateful;

import java.util.ArrayList;
import java.util.List;

@Stateful
public class ListElements implements  ListElementRemote {

    private List<Integer> values = new ArrayList<>();

    @Override
    public void addElement(int element) {
        values.add(element);
    }

    @Override
    public void removeElement(int element) {
        values.remove(element);
    }

    @Override
    public List<Integer> getElements() {
        return values;
    }

}
