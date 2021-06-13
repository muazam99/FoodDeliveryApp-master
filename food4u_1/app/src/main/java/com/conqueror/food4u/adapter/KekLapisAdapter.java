package com.conqueror.food4u.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.conqueror.food4u.R;
import com.conqueror.food4u.model.KekLapis;

import java.util.List;

public class KekLapisAdapter extends RecyclerView.Adapter<KekLapisAdapter.KekLapisViewHolder>{

    Context context;
    List<KekLapis> kekLapisList;



    public KekLapisAdapter(Context context, List<KekLapis> kekLapisList) {
        this.context = context;
        this.kekLapisList = kekLapisList;
    }

    @NonNull
    @Override
    public KekLapisViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {

        View view = LayoutInflater.from(context).inflate(R.layout.kek_lapis_row_item, parent, false);
        return new KekLapisAdapter.KekLapisViewHolder(view);
    }

    @Override
    public void onBindViewHolder(KekLapisAdapter.KekLapisViewHolder holder, int position) {

        holder.foodImage.setImageResource(kekLapisList.get(position).getImageUrl());
        holder.name.setText(kekLapisList.get(position).getName());
        holder.price.setText(kekLapisList.get(position).getPrice());
        holder.rating.setText(kekLapisList.get(position).getRating());
        holder.restorantName.setText(kekLapisList.get(position).getRestorantname());

    }

    @Override
    public int getItemCount() {
        return kekLapisList.size();
    }


    public static final class KekLapisViewHolder extends RecyclerView.ViewHolder{


        ImageView foodImage;
        TextView price, name, rating, restorantName;

        public KekLapisViewHolder(@NonNull View itemView) {
            super(itemView);

            foodImage = itemView.findViewById(R.id.food_image);
            price = itemView.findViewById(R.id.price);
            name = itemView.findViewById(R.id.name);
            rating = itemView.findViewById(R.id.rating);
            restorantName = itemView.findViewById(R.id.restorant_name);



        }
    }

}
