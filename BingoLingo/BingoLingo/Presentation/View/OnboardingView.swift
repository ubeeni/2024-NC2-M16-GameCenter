//
//  OnboardingView.swift
//  BingoLingo
//
//  Created by KimYuBin on 6/18/24.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0
    @State private var isGoPressed = false
    private let totalPages = 4

    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()

            VStack(spacing: 0) {
                TabView(selection: $currentPage) {
                    onboardingContent(for: 0)
                        .tag(0)
                        .padding(.top, 24)
                    onboardingContent(for: 1)
                        .tag(1)
                        .padding(.top, 24)
                    onboardingContent(for: 2)
                        .tag(2)
                        .padding(.top, 24)
                    onboardingContent(for: 3)
                        .tag(3)
                        .padding(.top, 24)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                
                Spacer()
                
                NavigationLinkWithHaptic(destination: MainView()) {
                    Image(isGoPressed ? .btnGo2 : .btnGo1)
                }
                .onLongPressGesture(
                    minimumDuration: 0.1,
                    pressing: { pressing in
                        withAnimation {
                            isGoPressed = pressing
                        }
                    },
                    perform: {
                        print("Long press completed")
                    }
                )
                .padding(.bottom, 20)
            }
        }
        .navigationBarHidden(true)
    }

    @ViewBuilder
    private func onboardingContent(for page: Int) -> some View {
        switch page {
        case 0:
            VStack(spacing: 0) {
                Text("포항 맛집 쉽게 찾자!")
                  .font(Font.custom("DungGeunMo", size: 26))
                  .multilineTextAlignment(.center)
                  .foregroundStyle(Color.place)
                  .padding(.bottom, 20)
                  .padding(.top, 40)
                
                Image(.imgOnboarding1)
                
                Text("빙고링고에서 제공하는\n음식점의 정보를 확인해 보세요!")
                    .font(Font.custom("Galmuri11", size: 16))
                    .multilineTextAlignment(.center)
                    .lineSpacing(8)
                    .foregroundStyle(Color.place)
                    .padding(.top, 20)
                
                Spacer()
                
                HStack(spacing: 8) {
                    ForEach(0..<totalPages, id: \.self) { index in
                        Circle()
                            .fill(index == currentPage ? Color.place : Color.circle)
                            .frame(width: 8, height: 8)
                    }
                }
                .padding(.bottom, 24)
            }
        case 1:
            VStack(spacing: 0) {
                Text("영수증 인증으로 빙고!")
                  .font(Font.custom("DungGeunMo", size: 26))
                  .multilineTextAlignment(.center)
                  .foregroundStyle(Color.place)
                  .padding(.bottom, 20)
                  .padding(.top, 40)
                
                Image(.imgOnboarding2)
                
                Text("갤러리의 해당 가게 영수증 사진을\n등록하면 빙고가 완성됩니다.")
                    .font(Font.custom("Galmuri11", size: 16))
                    .multilineTextAlignment(.center)
                    .lineSpacing(8)
                    .foregroundStyle(Color.place)
                    .padding(.top, 20)
                
                Spacer()
                
                HStack(spacing: 8) {
                    ForEach(0..<totalPages, id: \.self) { index in
                        Circle()
                            .fill(index == currentPage ? Color.place : Color.circle)
                            .frame(width: 8, height: 8)
                    }
                }
                .padding(.bottom, 24)
            }
        case 2:
            VStack(spacing: 0) {
                Text("친구들과 함께하자!")
                  .font(Font.custom("DungGeunMo", size: 26))
                  .multilineTextAlignment(.center)
                  .foregroundStyle(Color.place)
                  .padding(.bottom, 20)
                  .padding(.top, 40)
                
                Image(.imgOnboarding3)
                
                Text("Game Center의 순위표를 통해\n친구의 기록도 확인해 보세요!")
                    .font(Font.custom("Galmuri11", size: 16))
                    .multilineTextAlignment(.center)
                    .lineSpacing(8)
                    .foregroundStyle(Color.place)
                    .padding(.top, 20)
                
                Text("순위표(게임센터)에 로그인해야만\n친구와 겨루기가 가능합니다!")
                    .font(Font.custom("Galmuri11", size: 13))
                    .multilineTextAlignment(.center)
                    .lineSpacing(8)
                    .foregroundStyle(Color.light)
                    .padding(.top, 20)
                
                Spacer()
                
                HStack(spacing: 8) {
                    ForEach(0..<totalPages, id: \.self) { index in
                        Circle()
                            .fill(index == currentPage ? Color.place : Color.circle)
                            .frame(width: 8, height: 8)
                    }
                }
                .padding(.bottom, 24)
            }
        case 3:
            VStack(spacing: 0) {
                Text("맛집은 널리널리")
                  .font(Font.custom("DungGeunMo", size: 26))
                  .multilineTextAlignment(.center)
                  .foregroundStyle(Color.place)
                  .padding(.bottom, 20)
                  .padding(.top, 40)
                
                Image(.imgOnboarding4)
                
                Text("추천하고 싶은 가게가 있으시다면 맛집 제안하기를 통해 제안 주세요!")
                    .font(Font.custom("Galmuri11", size: 16))
                    .multilineTextAlignment(.center)
                    .lineSpacing(8)
                    .foregroundStyle(Color.place)
                    .padding(.top, 20)
                
                Spacer()
                
                HStack(spacing: 8) {
                    ForEach(0..<totalPages, id: \.self) { index in
                        Circle()
                            .fill(index == currentPage ? Color.place : Color.circle)
                            .frame(width: 8, height: 8)
                    }
                }
                .padding(.bottom, 24)
            }
        default:
            EmptyView()
        }
    }
}

#Preview {
    OnboardingView()
}
