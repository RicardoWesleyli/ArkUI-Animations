@Entry
@Component
struct Index {
  tags: string[] = [
    "ArtificialIntelligence", "AI", "UX", "Programming","Development",
    "Innovation", "Swift", "Code", "Optima",
    "Kotlin", "Java", "C++", "DataStructures", "Algorithms",
    "new", "Dart", "Flutter"
  ];
  @State selectedTags: Set<string> = new Set();

  build() {
    Flex({
      wrap: FlexWrap.Wrap
    }) {
      ForEach(this.tags, (tag: string) => {
        Button(tag, { type: ButtonType.Capsule, stateEffect: true })
          .fontColor(this.selectedTags.has(tag) ? Color.White : Color.Gray)
          .backgroundColor(this.selectedTags.has(tag) ? 0xFF5733 : 0xF5F5F5)
          .margin(5)
          .onClick(() => this.toggleSelection(tag));
      });
    }
    .margin(10)
    .height('100%')
    .width('100%');
  }

  toggleSelection(tag: string) {
    if (this.selectedTags.has(tag)) {
      this.selectedTags.delete(tag);
    } else {
      this.selectedTags.add(tag);
    }
  }
}
