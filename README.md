# swift-photos-09 - dale, chez :) 

## STEP1 - ColorCollecionView 

### 작업 내용

- Model

  - Colorcell 구현

  - CellCollection 구현

  - Color 구현

- Protocol
  - Cellable 구현

- CellFactory 구현

- Color Convertor 구현

- Model-VC 연결

### 고민과 해결

- Git 으로 협업하는 과정에서 rebase가 진행되지 않고 pull로만 작업내용이 가져와지는 문제 발생.

  git fetch 를 진행할때 fetch upstream으로 하지않아 fetch 를 받아와도 rebase 할 작업내용이 없어서 발생하는 문제.

- CollectionView 를 ViewController에 추가하고 해당 CollectionView에 40개의 셀을 띄우는 방법을 고민.

  여러 자료를 참고해서 CollectionViewDelegate와 CollectionViewDatasource를 ViewController가 채택함으로써 CollectionView를 만들기 위한 기능들을 구현.

- 각자의 맥북이 m1 - intel 로 서로 달라 다른팀원의 코드를 가져와서 시뮬레이터로 실행하는중 버그가 발생하여 아키텍쳐 설정도 바꾸어보고 실제 아이폰에서 구동해보는등 여러 시도.

  결과적으로는 m1 - intel 의 문제가 아니라 Xcode 버젼이 달라서 발생했던 문제.

### 결과물

<img src="https://user-images.githubusercontent.com/78553659/159283558-c58fb96a-8ae7-4c86-87ba-2aea826f30fe.png" width="250" height="500">

---

## STEP2 - 사진불러오기 

### 작업 내용

-  PhotoCellModel 구현
-  AlbumCollectionViewCell - ColorCell, PhotoCell 분리
- Photos framework 활용하여 사진 불러오기 구현
  -  PHFetchResult 활용 PHAssetCollection 불러오기
  -  PHFetchOption 활용 PHAsset 시간순 정렬
  -  PHCachingImageManager 활용 PHAsset -> UIIMage 변환
  -  PHPhotoLibrary 활용 Vc 옵저버 등록
- PhotoCellModel - Vc - PhotoCellView 흐름 구현
- Navigation Controller embeded

### 고민과 해결

- PhotoCellModel의 이미지 정보를 Data 타입으로 넣으려고 했으나 MVC 흐름 구현에서 문제.

  PHAsset 타입을 활용하는게 용이해 PhotoCellModel의 이미지 타입을 PHAsset으로 변경.

- Photos library를 활용한 로직구현 / MVC 설계 파트를 나누어 각자 작업을 진행하고 merge할때 충돌

  충돌부분이 많지 않아 서로 조율끝에 각자의 코드에서 필요한 부분만 가져와서 충돌해결.

### 결과물

<img src="https://user-images.githubusercontent.com/78553659/159646697-a90c73cd-fb82-4286-adff-b3d569c0d5e6.png" width="400" height="800">

---

## STEP3 - 이미지 받아오기

### 작업 내용

- json 파싱
  -  json load 구현
  -  json decode 구현
-  이미지 전달
  -  jsonURL 을 Data로 **비동기**로 가져오기
  -  비동기로 가져온 Image를 순서대로 보여주기 위해 딕셔너리를 이용한 로직 구현
  -  사진을 받아오는 동안에 메인 스레드에서는 다른 뷰 보여주도록 구현

### 고민과 해결 

- json 의 load와 decode 하는 작업의 책임분리에 대한 고민, JsonManager라는 객체를 만들어서 ViewController 로부터 책 분리. 

- 비동기 작업을 할때, 이미지를 다 받아오기 전에 cell을 생성하지 않도록 고민. 
  처음에는 `DispatchQueue.global().Sync` 안에 `DispatchQueue.global().Async`를 넣어보기도 하고,`DispatchQueue.global().Sync`로만 구성도 해보았지만 원하는 결과를 얻지 못함.

  `DispatchGroup` 의 `enter()` `leave()` `wait()` 를 사용하여 그룹안에 있는 작업들이 다 완료되기 전 까지 동기 방식으로 진행되도록 구현하여 해결

- Sync 와 async를 사용해보면서 고민을 해보니 async를 사용했을때 여러 이미지를 동시에 받아오도록 할 수 있었지만, 받아온 이미지가 json의 순서대로 받아지지 않는 문제점.  
  배열을 미리 만들어 인덱스로도 접근해보고, 배열의 append() 부분만 sync로 처리를 하려고 시도 및 실패

  Json 파일에 있는 title을 딕셔너리의 key 값으로 사용해서, for문을 통해 순서대로 정렬하여 해결.  
  만약 title이 없거나, 숫자가 아닌경우 정렬이 되지 않는 문제점은 여전히 존재. 

### 실행 결과 

![Simulator Screen Recording - iPhone 13 Pro - 2022-03-25 at 16 33 16](https://user-images.githubusercontent.com/78553659/160075250-ac8657af-4006-465b-a406-d75c646b1742.gif)
