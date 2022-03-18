/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.test.beans;

import java.sql.Blob;

/**
 *
 * @author ismail bouaddi
 */
public class Location {
    
    private int id;
    private String  titre;
    private String slogan;
    private String  regle;
    private String description;
    private String ville;
    private String region;
    private String address;
    private String base64Image1;
    private String base64Image2;
    private String base64Image3;
    private String base64Image4;
    private String base64Image5;
    private double prix;
    private String type;
    private double surface;
    private int nbrchambre;
    private int nbrsalon;
    private int nbrsalledebain;
    private String balcon;
    private String garage;
    private String parking ;
    private String jardin;
    private String grenier;
    
    
    public String getBalcon() {
        return balcon;
    }

    public void setBalcon(String balcon) {
        this.balcon = balcon;
    }

    public String getGarage() {
        return garage;
    }

    public void setGarage(String garage) {
        this.garage = garage;
    }

    public String getParking() {
        return parking;
    }

    public void setParking(String parking) {
        this.parking = parking;
    }

    public String getJardin() {
        return jardin;
    }

    public void setJardin(String jardin) {
        this.jardin = jardin;
    }

    public String getGrenier() {
        return grenier;
    }

    public void setGrenier(String grenier) {
        this.grenier = grenier;
    }
    


  

    public String getBase64Image1() {
        return base64Image1;
    }

    public void setBase64Image1(String base64Image1) {
        this.base64Image1 = base64Image1;
    }

    public String getBase64Image2() {
        return base64Image2;
    }

    public void setBase64Image2(String base64Image2) {
        this.base64Image2 = base64Image2;
    }

    public String getBase64Image3() {
        return base64Image3;
    }

    public void setBase64Image3(String base64Image3) {
        this.base64Image3 = base64Image3;
    }

    public String getBase64Image4() {
        return base64Image4;
    }

    public void setBase64Image4(String base64Image4) {
        this.base64Image4 = base64Image4;
    }

    public String getBase64Image5() {
        return base64Image5;
    }

    public void setBase64Image5(String base64Image5) {
        this.base64Image5 = base64Image5;
    }
    

    public String getVille() {
        return ville;
    }

    public void setVille(String ville) {
        this.ville = ville;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
   

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public String getSlogan() {
        return slogan;
    }

    public void setSlogan(String slogan) {
        this.slogan = slogan;
    }

    public String getRegle() {
        return regle;
    }

    public void setRegle(String regle) {
        this.regle = regle;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getSurface() {
        return surface;
    }

    public void setSurface(double surface) {
        this.surface = surface;
    }

    public int getNbrchambre() {
        return nbrchambre;
    }

    public void setNbrchambre(int nbrchambre) {
        this.nbrchambre = nbrchambre;
    }

    public int getNbrsalon() {
        return nbrsalon;
    }

    public void setNbrsalon(int nbrsalon) {
        this.nbrsalon = nbrsalon;
    }

    public int getNbrsalledebain() {
        return nbrsalledebain;
    }

    public void setNbrsalledebain(int nbrsalledebain) {
        this.nbrsalledebain = nbrsalledebain;
    }

     public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    
    
}
