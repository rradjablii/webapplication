package com.rradjabli.webapplication.services;

import com.rradjabli.webapplication.model.Image;
import com.rradjabli.webapplication.model.Product;
import com.rradjabli.webapplication.model.User;
import com.rradjabli.webapplication.repository.ProductRepo;
import com.rradjabli.webapplication.repository.UserRepo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProductService {
    private final ProductRepo productRepo;
    private final UserRepo userRepo;

    public Product getProductById(Long id){
        return productRepo.findById(id).orElse(null);
    }

    public List<Product> productList(String title){
        if(title != null){
            return productRepo.findByTitle(title);
        }else{
            return productRepo.findAll();
        }
    }
    public void saveProduct(Principal principal, Product product, MultipartFile file1, MultipartFile file2, MultipartFile file3) throws IOException {
        product.setUser(getUserByPrincipal(principal));
        Image image1;
        Image image2;
        Image image3;
        if(file1.getSize()!=0){
            image1 = toImageEntity(file1);
            image1.setPreviewImage(true);
            product.addImageToProduct(image1);
        }
        if(file2.getSize()!=0){
            image2 = toImageEntity(file2);
            product.addImageToProduct(image2);
        }
        if(file3.getSize()!=0){
            image3 = toImageEntity(file3);
            product.addImageToProduct(image3);
        }
        log.info("Saving new Product. Title: {}; Author Email: {}", product.getTitle(), product.getUser().getEmail());
        Product productFromDB = productRepo.save(product);
        productFromDB.setPreviewImageId(productFromDB.getImages().get(0).getId());
        productRepo.save(product);
    }

    public void deleteProduct(Long id){
        productRepo.deleteById(id);
    }

    public User getUserByPrincipal(Principal principal){
        if(principal==null) return new User();
        return userRepo.findByEmail(principal.getName());
    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

}























