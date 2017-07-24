PUBLIC TOILET
==

## 개요
1. 빅데이터 청년인재 부산 6팀 자바 웹 프로젝트
2. 회원제
3. 공중 화장실 API의 정보를 이용해 정보 제공
4. 각 화장실의 리뷰와 평점을 통해 평가

  
## 개발 정보
- encoding: EUCKR
- html, javascript, css, java, jsp, servlet
- oracle express edition
- apache tomcat
- eclipse, intelliJ IDEA
- 전국 공중화장실 API 중 부산(데이터의 포맷이 일정하지 않음)
- daum map api
  
  
## 업무 분담
1. back-end  
	* [김대일](https://github.com/KimDaeil)  
	  
2. front-end  
	* [신승현](https://github.com/rofhs12)  
  
  
## 개발 가이드 라인
1. git을 통해서는 소스코드 및 기본환경 관리: 툴에 대한 설정은 개별로 관리
2. [기능 개발 및 branch 관리](#기능개발)  
3. [pull](#pull)  
4. [push](#push)  
  
	
## 기능 개발
1. gitflow를 적용하기 어려우므로, 기능 단위로 branch를 생성  
2. 새로운 브랜치 생성 및 checkout  
```> git checkout -b feat_{기능이름}```  
3. 강제로 feature branch를 master branch에 통합하지 않는다.  
4. master는 오류없이 작동하는 최종 코드  
5. master branch는 pull 혹은 fetch 외에 push는 하지 않는다.
6. **_commit 메시지는 최선과 영혼을 담아서 소울풀하게 작성한다._**
7. 코드 충돌 시 임의로 코드를 수정하지 않고, 해당 개발 담당자와 의논 후 충돌을 제거한다.
8. **_기능 개발을 하기 위해 master를 내려받을 때  개발 기능을 팀원에게 명시하여 충돌을 최대한 피한다._**  
9. ** pull과 push는 프로젝트 최상위 디렉토리에서 실행**
[개발 가이드 라인](#개발_가이드_라인)

  
## pull
1. 개발환경(툴, OS, IDE)에 관계 없이 적용
2. 프로젝트 최상위 디렉토리에서 내려받기(파일명 >> public_toilet)  
3. 해당 디렉토리(public_toilet)에 새로운 프로젝트 생성
```
> git init
> git remote add origin https://github.com/KimDaeIl/public_toilet.git
> git pull origin master
```  
** 프로젝트 이름은 레파지토리 이름과 같다 **

   
## push
1. 기능 단위로 github에 pull request를 통해 브랜치 단위로 push한다.  
```> git push origin feat_{기능이름}```
2. push 후 모든 팀원에게 통보한다.


[readme 참고 사이트](http://blog.eomdev.com/github/2015/12/11/github-markdown.html)
