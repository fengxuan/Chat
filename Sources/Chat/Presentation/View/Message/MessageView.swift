//
//  MessageView.swift
//  Chat
//
//  Created by Alex.M on 23.05.2022.
//

import SwiftUI

struct MessageView: View {
    let message: Message
    let onTapAttachment: (any Attachment) -> Void

    @Environment(\.messageUseMarkdown) var messageUseMarkdown

    var body: some View {
        MessageContainer(user: message.user) {
            VStack(alignment: .leading) {
                if !message.text.isEmpty {
                    Group {
                        if messageUseMarkdown,
                           let attributed = try? AttributedString(markdown: message.text) {
                            Text(attributed)
                        } else {
                            Text(message.text)
                        }
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 8)
                }

                if !message.attachments.isEmpty {
                    AttachmentsGrid(attachments: message.attachments, onTap: onTapAttachment)
                }
            }
        }
    }
}