/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.nrgsavers.dto;

import java.util.ArrayList;

/**
 *
 * @author HKS
 */
public class Search {
    
    
    ArrayList<Product> products=null;
        ArrayList<Object> news=null;

    public ArrayList<Product> getProducts() {
        return products;
    }

    public ArrayList<Object> getNews() {
        return news;
    }


    public void setProducts(ArrayList<Product> products) {
        this.products = products;
    }

    public void setNews(ArrayList<Object> news) {
        this.news = news;
    }
    
   
}
