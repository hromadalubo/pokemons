//
//  PokemonDetailView.swift
//  Pokemons
//
//  Created by Lubos Hromada on 27/6/23.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var viewModel: ViewModel
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            PokemonView(pokemon: pokemon)
            
            VStack(spacing: 10) {
                Text("**ID**: \(viewModel.pokemonDetails?.id ?? 0)")
                Text("**Height**: \(viewModel.formatHW(value: viewModel.pokemonDetails?.height ?? 0)) m")
                Text("**Weight**: \(viewModel.formatHW(value: viewModel.pokemonDetails?.weight ?? 0)) kg")
            }
        }
        .onAppear {
            viewModel.getDetails(pokemon: pokemon)
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
    }
}
