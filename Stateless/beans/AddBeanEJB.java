package com.example.StateLessBean.beans;

import jakarta.ejb.Stateless;

@Stateless
public class AddBeanEJB {
    private int i;
    private int j;
    private int k;

    public int getI() {
        return i;
    }

    public void setI(int i) {
        this.i = i;
    }

    public int getJ() {
        return j;
    }

    public void setJ(int j) {
        this.j = j;
    }

    public int getK() {
        return k;
    }

    public void setK(int k) {
        this.k = k;
    }

    public void add(){
        k = i + j;
    }
}
