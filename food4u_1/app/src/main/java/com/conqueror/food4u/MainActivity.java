package com.conqueror.food4u;

import android.os.Bundle;
import android.view.MenuItem;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;
import androidx.navigation.NavController;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.conqueror.food4u.adapter.AsiaFoodAdapter;
import com.conqueror.food4u.adapter.KekLapisAdapter;
import com.conqueror.food4u.adapter.PopularFoodAdapter;
import com.conqueror.food4u.model.AsiaFood;
import com.conqueror.food4u.model.KekLapis;
import com.conqueror.food4u.model.PopularFood;
import com.google.android.material.bottomnavigation.BottomNavigationView;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {

    RecyclerView popularRecycler, asiaRecycler, kekLapisRecycler;
    PopularFoodAdapter popularFoodAdapter;
    AsiaFoodAdapter asiaFoodAdapter;
    KekLapisAdapter kekLapisAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // now here we will add some dummy data to out model class

        List<PopularFood> popularFoodList = new ArrayList<>();
        popularFoodList.add(new PopularFood("Spicy Salty Egg Cornflake", "RM7.05", R.drawable.saltyegg));
        popularFoodList.add(new PopularFood("Float Cake Vietnam", "RM7.05", R.drawable.popularfood1));
        popularFoodList.add(new PopularFood("Chiken Drumstick", "RM17.05", R.drawable.popularfood2));
        popularFoodList.add(new PopularFood("Fish Tikka Stick", "RM25.05", R.drawable.popularfood3));

        setPopularRecycler(popularFoodList);


        List<AsiaFood> asiaFoodList = new ArrayList<>();
        asiaFoodList.add(new AsiaFood("Chicago Pizza", "RM20", R.drawable.asiafood1, "4.5", "Briand Restaurant"));
        asiaFoodList.add(new AsiaFood("Straberry Cake", "RM25", R.drawable.asiafood2, "4.2", "Friends Restaurant"));

        setAsiaRecycler(asiaFoodList);

        List<KekLapis> kekLapisList = new ArrayList<>();
        kekLapisList.add(new KekLapis("Kek Lapis 3 Dara", "RM13", R.drawable.keklapis3dara, "4.5", "Afiq Restaurant"));
        kekLapisList.add(new KekLapis("Kek Lapis Asam Manis", "RM25", R.drawable.keklapisasammanis, "4.2", "Muaz Restaurant"));

        setKekLapisRecycler(kekLapisList);

        BottomNavigationView bottomNav = findViewById(R.id.bottomNavigation);
       
        bottomNav.setOnNavigationItemSelectedListener(navListener);
    }

    private BottomNavigationView.OnNavigationItemSelectedListener navListener =
            new BottomNavigationView.OnNavigationItemSelectedListener() {
                @Override
                public boolean onNavigationItemSelected(@NonNull MenuItem item) {
                    Fragment selectedFragment = null;

                    switch (item.getItemId()) {
                        case R.id.nav_home:
                            selectedFragment = new first_page();
                            break;
                        case R.id.nav_profile:
                            selectedFragment = new second_page();
                            break;
                    };
                        getSupportFragmentManager().beginTransaction().replace(R.id.fragment_container,selectedFragment).commit();
                        return true;
                };


            };


    private void setPopularRecycler(List<PopularFood> popularFoodList) {

        popularRecycler = findViewById(R.id.popular_recycler);
        RecyclerView.LayoutManager layoutManager = new LinearLayoutManager(this, RecyclerView.HORIZONTAL, false);
        popularRecycler.setLayoutManager(layoutManager);
        popularFoodAdapter = new PopularFoodAdapter(this, popularFoodList);
        popularRecycler.setAdapter(popularFoodAdapter);

    }

    private void setAsiaRecycler(List<AsiaFood> asiaFoodList) {

        asiaRecycler = findViewById(R.id.asia_recycler);
        RecyclerView.LayoutManager layoutManager = new LinearLayoutManager(this, RecyclerView.VERTICAL, false);
        asiaRecycler.setLayoutManager(layoutManager);
        asiaFoodAdapter = new AsiaFoodAdapter(this, asiaFoodList);
        asiaRecycler.setAdapter(asiaFoodAdapter);

    }

    private void setKekLapisRecycler(List<KekLapis> kekLapisList) {

        kekLapisRecycler = findViewById(R.id.kekLapis_recycler);
        RecyclerView.LayoutManager layoutManager = new LinearLayoutManager(this, RecyclerView.VERTICAL, false);
        kekLapisRecycler.setLayoutManager(layoutManager);
        kekLapisAdapter = new KekLapisAdapter(this, kekLapisList);
        kekLapisRecycler.setAdapter(kekLapisAdapter);

    }

    // Hi all,
    // Today we are going to build a food app.
    // so the first things frist lets add font and image assets
    // so lets see the design
    // now we will setup recyclerview
    // first we make a model class then adapter class.
    // now we will create a recyclerview row item layout file
    // so our adapter class is ready
    // now we will bind data with recyclerview
    // so we have successfully setup popular recyclerview
    // now same setup we need to do for asia food
    // will make model class then adapter and setup recyclerview
    // so lets do it fast.
    // so asia food setup done.
    // Now we will setup Bottom app bar
    // bottom app bar setup done if you want you can increase menu item in menu file
    // now we will setup details activity and on click listener in recyclerview row item
    // so this tutorial has been completed if you have any
    // question and query please do comment
    // Like share and subscribe
    // Thankyou for watching
    // see you in the next tutorial
}
