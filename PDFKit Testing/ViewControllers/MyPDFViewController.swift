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
    
    // MARK: - Outlets
    @IBOutlet weak var pdfView: PDFView!
    @IBOutlet weak var pdfThumbnailView: PDFThumbnailView!
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPDF()
    }
    
    // MARK: - ViewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
