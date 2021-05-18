//
//  ViewController.swift
//  CollectionSemScroll
//
//  Created by Vitor Gomes on 18/05/21.
//

import UIKit

class ViewController: UIViewController {
    
    var collection: AutoHeightCollectionView!
    var tiposDePagamento: [String]!
    var textLabel: UILabel!
    
    @IBOutlet weak var myCollectionViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()

        tiposDePagamento = ["Cartão de Crédito", "Boleto", "Débito", "Dinheiro", "Pix", "Tranferencia", "Escambo", "Fatura", "Consignado"]
        
        collection.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .clear
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if tiposDePagamento == nil {
            return 0
        }
        return tiposDePagamento.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let customAdapter = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else{
            return UICollectionViewCell()}
        
        customAdapter.setupCell(text: tiposDePagamento[indexPath.row], imageString: "house")
        return customAdapter
        }

    }

extension ViewController {
    func setupLayout() {
    
        let layout = FlowLayout(minimumInteritemSpacing: 15, minimumLineSpacing: 15, sectionInset: .zero)
    
        collection = AutoHeightCollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(collection)
        collection.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
                                        collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                        collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                                        collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
                                      
   
        textLabel = UILabel()
        view.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.text = "Defina a forma de pagamento e aceite o prestador."
        textLabel.numberOfLines = 0
        NSLayoutConstraint.activate([
                                        textLabel.topAnchor.constraint(equalTo: collection.bottomAnchor, constant: 20),
                                        textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                        textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
       
    }
}

