package com.example.statefulbean;

import jakarta.ejb.Remote;

import java.util.List;

@Remote
public interface ListElementRemote {
    void addElement(int element);
    void removeElement(int element);
    List<Integer> getElements();
}
