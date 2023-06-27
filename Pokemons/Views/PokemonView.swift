//
//  PokemonView.swift
//  Pokemons
//
//  Created by Lubos Hromada on 27/6/23.
//

import SwiftUI

struct PokemonView: View {
    @EnvironmentObject var viewModel: ViewModel
    let pokemon: Pokemon
    let dimensions: Double = 140
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(viewModel.getPokemonId(pokemon: pokemon)).png")) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(width: dimensions, height: dimensions)
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: dimensions, height: dimensions)
                            @unknown default:
                                ProgressView()
                                    .frame(width: dimensions, height: dimensions)
                            }
                        }
                        .background(.thinMaterial)
                        .clipShape(Circle())
            
            Text("\(pokemon.name.capitalized)")
                .font(.system(size: 16, weight: .regular, design: .monospaced))
                .padding(.bottom, 20)
                    
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemon: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
    }
}
