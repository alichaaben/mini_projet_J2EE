package com.example.conct;

import java.util.ArrayList;

public class Arraylist {
    private ArrayList<String>ListMot;
    public Arraylist(){
        this.ListMot=new ArrayList<>();
    }

    public ArrayList<String> getListMot(){
        return this.ListMot;
    }
    public void addList(String x){
        ListMot.add(x);
    }

}