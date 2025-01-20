package com.model;

import javax.persistence.*;

@Entity
@Table(name = "school")
public class School {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

	@Column(name = "code")
    private String code;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "type", nullable = false)
    private String type;

    @Column(name = "district", nullable = false)
    private String district;

    // Default constructor
    public School() {
    }

    // Parameterized constructor
    public School(String code, String name, String type, String district) {
        this.code = code;
        this.name = name;
        this.type = type;
        this.district = district;
    }

    // Getters and setters
    public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }
}
