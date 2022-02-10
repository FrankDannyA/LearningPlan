//
//  extentionLessonVS + URLSessuonDownloadDelegate.swift
//  LearningPlan
//
//  Created by Даниил Франк on 10.02.2022.
//

import Foundation

extension LessonViewController: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("downloadLocation:", location)
    }
}
