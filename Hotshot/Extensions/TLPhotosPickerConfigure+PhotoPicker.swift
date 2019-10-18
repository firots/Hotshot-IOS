//
//  TLPhotosPickerConfigure+PhotoPicker.swift
//  Hotshot
//
//  Created by Firot on 19.10.2019.
//  Copyright © 2019 Firot. All rights reserved.
//

import Foundation
import TLPhotoPicker


extension TLPhotosPickerConfigure {
    mutating func photoPicker(maxItems: Int) {
        self.allowedVideo = false
        self.allowedVideoRecording = false
        self.allowedAlbumCloudShared = false
        self.autoPlay = false
        self.maxSelectedAssets = maxItems
    }
}
