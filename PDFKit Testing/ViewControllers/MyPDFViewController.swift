//
//  MyPDFViewController.swift
//  PDFKit Testing
//
//  Created by macbook on 4/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit
import PDFKit  // Need to import PDFKit

class MyPDFViewController: UIViewController {
    
    // MARK: - Properties
    var pdfDoc: PDFDocument?
    
    // MARK: - IBOutlets
    @IBOutlet weak var pdfView: PDFView!
    @IBOutlet weak var pdfThumbnailView: PDFThumbnailView!
    @IBOutlet weak var searchTextField: UITextField!
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPDF()
    }
    
    // MARK: - ViewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        
        highlightPhrase()
    }
    
    // MARK: - IBActions
    @IBAction func searchTextFieldEdited(_ sender: UITextField) {
        
        searchForEnteredTerm()
    }
    
    // MARK: - LoadPDF
    private func loadPDF() {
        
        // 1 - Set path for which to load a PDF
        guard let pathURL = URL(string: "https://www.apple.com/privacy/docs/Location_Services_White_Paper_Nov_2019.pdf")
            
            else {
            print("Failed to get pathURL ")
            return
        }
        
        // 2 - Load the PDF by creating a PDFDocument and then setting it to the pdfView's .document property
        
        // Create a document. You can set the document with data or a path to a URL
        pdfDoc = PDFDocument(url: pathURL)
        
        // Set that doc to our view's document
        pdfView.document = pdfDoc
        
        // 3 - Connect thumbnailView to the pdfView
        pdfThumbnailView.pdfView = pdfView
        pdfThumbnailView.layoutMode = .horizontal  // by default it's set to vertical
        pdfThumbnailView.thumbnailSize = CGSize(width: pdfThumbnailView.bounds.height * 0.5, height: pdfThumbnailView.bounds.height * 0.5)
    }
    
    // MARK: - Highlight a Prase
    private func highlightPhrase() {
        
        // 4 - Find prase
        
        // a - Conduct search for prase
        let foundItems = pdfDoc?.findString("security", withOptions: .caseInsensitive)
        print(foundItems)
        
        // b - Move to that items found, then set selection to item
        guard let firstItem = foundItems?.first else {
            print("did not get first item")
            return
        }
        
        pdfView.go(to: firstItem)
        pdfView.setCurrentSelection(firstItem, animate: true)
        // it will highlight as a normal seletion on the device
        
        // 5 - Create an annotation on item
        
        // a - Get the current page
        guard let currentPage = pdfView.currentPage else {
            print("did not get current page")
            return
        }
        
        // b - Create annotation
        let annotationBounds = firstItem.bounds(for: currentPage)
        
        let annotation = PDFAnnotation(bounds: annotationBounds, forType: .highlight, withProperties: nil)
        
        // c - Add annotation to the cuurent page
        currentPage.addAnnotation(annotation)
    }
    
    // MARK: - Search for a term
    private func searchForEnteredTerm() {
        
        // a - Conduct search for prase
        let foundItems = pdfDoc?.findString(searchTextField.text ?? "", withOptions: .caseInsensitive)
        print(foundItems)
        
        // b - Move to that items found, then set selection to item
        guard let firstItem = foundItems?.first else {
            print("did not get first item")
            return
        }
        
        pdfView.go(to: firstItem)
        pdfView.setCurrentSelection(firstItem, animate: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
