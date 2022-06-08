<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반회원 과목 등록 양식 페이지</title>
</head>
<%@ include file="../header.jsp" %>
<body>
          <div class="page-body">
          <div class="container-fluid">
            <div class="page-header">
              <div class="row">
                <div class="col-sm-6">
                  <h3>Create Subject</h3>
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item">Subject                                     </li>
                    <li class="breadcrumb-item active">Create Subject</li>
                  </ol>
                </div>

              </div>
            </div>
          <!-- Container-fluid starts-->
           <div class="row project-cards">
              <div class="col-md-12 project-list">
          <div class="card">
            <div class="row">
                <div class="card-header pb-0">
                    <h5>과목 등록</h5>
                    <h6>등록할 과목/커리큘럼에 대한 정보를 입력해주세요!</h6>
                    </div>
                    </div>
                    </div>

              <div class="col-sm-12">
           <div class="card">
                  	<form class="form theme-form" action="/subInsertSubject.do" method="post">
                  <div class="card-body">
                      <div class="row">
                        <div class="col">
                          <div class="mb-3">
                            <label>과목명</label>
                            <input class="form-control" type="text" name="sub_title" placeholder="과목명 *">
                          </div>
                        </div>
                      </div>
                      <div>
                      <div class="row">
                        <div class="col">
                          <div class="mb-3">
                              <label>과목 설명</label>
                             </div>
                         <label class="col">[ 예시 ]</label>
                            <div class="mb-3">
                              <div class="form-control-static">
									과목 설명 예시입니다.
                              </div>
                            </div> 
                            <textarea class="form-control" id="exampleFormControlTextarea4" name="sub_content" rows="3"></textarea>
                          </div>
                        </div>
                      </div>
                      </div>
                      
                  <div class="card-body">
                  
                      <div class="row">
                        <div class="col-sm-4">
                          <div class="mb-3">
                            <label>과목 버전</label>
                            <input class="form-control" type="text" name="cur_version" placeholder="Enter Subject Version">
                          </div>
                        </div>
                        <div class="col-sm-4">
                          <div class="mb-3">
                            <label>과목 수강 시간</label>
                          <!--   <select class="form-select">
                              <option>7</option><option>8</option><option>9</option> <option>10</option> <option>11</option><option>12</option><option>13</option><option>14</option><option>15</option><option>16</option>
                              <option>17</option><option>18</option><option>19</option><option>20</option><option>21</option><option>22</option><option>23</option><option>24</option><option>25</option><option>26</option>
                              <option>27</option><option>28</option><option>29</option><option>30</option><option>31</option><option>32</option><option>33</option><option>34</option><option>35</option><option>36</option>
                              <option>37</option><option>38</option><option>39</option><option>40</option><option>41</option><option>42</option><option>43</option><option>44</option><option>45</option><option>46</option>
                              <option>47</option><option>48</option><option>49</option><option>50</option><option>51</option><option>52</option><option>53</option><option>54</option><option>55</option><option>56</option>
                              <option>57</option><option>58</option><option>59</option><option>60</option><option>61</option><option>62</option><option>63</option><option>64</option><option>65</option><option>66</option>
                              <option>67</option><option>68</option><option>69</option><option>70</option><option>71</option><option>72</option><option>73</option><option>74</option><option>75</option><option>76</option>
							  <option>77</option><option>78</option><option>79</option><option>80</option><option>81</option><option>82</option><option>83</option><option>84</option><option>85</option><option>86</option>
                              <option>87</option><option>88</option><option>89</option><option>90</option><option>91</option><option>92</option><option>93</option><option>94</option><option>95</option><option>96</option>
							  <option>97</option><option>98</option><option>99</option><option>100</option>
                            </select> -->
                             <input class="form-control" type="text" name="cur_time" placeholder="Enter Subject Time">
                          </div>
                        </div>
                        <div class="col-sm-4">
                          <div class="mb-3">
                            <label>과목 난이도</label>
                             <input class="form-control" type="text" name="cur_level" placeholder="Enter Subject Level">
   <!--                  <div class="row">
                      <div class="col">
                        <div class="form-group m-t-15 m-checkbox-inline mb-0">
                          <div class="checkbox checkbox-dark">
                            <input id="inline-1" type="checkbox">
                            <label for="inline-1">초급</label>
                          </div>
                          <div class="checkbox checkbox-dark">
                            <input id="inline-2" type="checkbox">
                            <label for="inline-2">중급</label>
                          </div>
                          <div class="checkbox checkbox-dark">
                            <input id="inline-3" type="checkbox">
                            <label for="inline-3">고급</label>
                          </div>
                        </div>
                      </div>
                    </div> -->
                          </div>
                        </div>
                      </div>
                  
                   <div class="row">
                        <div class="col">
                          <div class="mb-3">
                            <label>커리큘럼 기타내용</label>
                            <textarea class="form-control" id="exampleFormControlTextarea4" name="cur_detail" rows="3"></textarea>
                          </div>
                        </div>
                      </div>
                      
                       <div class="row">
                        <div class="col">
                          <div class="mb-3">
                            <label>커리큘럼 상세내용</label>
                              <div class="form-control-static">
									과목에 대한 수강 요청사항 및 수강생과의 약속을 적어주세요!
                              </div>
                            <textarea class="form-control" id="exampleFormControlTextarea4" name="cur_subcontent" rows="3"></textarea>
                          </div>
                        </div>
                      </div>

      
                     
 <%--                      <div class="row">
                        <div class="col">
                          <div class="mb-3">
                            <label>Upload project file</label>
                            <form class="dropzone" id="singleFileUpload" action="/upload.php">
                              <div class="dz-message needsclick"><i class="icon-cloud-up"></i>
                                <h6>Drop files here or click to upload.</h6><span class="note needsclick">(This is just a demo dropzone. Selected files are <strong>not</strong> actually uploaded.)</span>
                              </div>
                            </form>
                          </div>
                        </div>
                      </div> --%>
                      <div class="row">
                        <div class="col">
                          <div class="text-end">
                          	<a  href="./subjectList.do" style="align-content: right;"><input class="btn btn-light" type="button" value="뒤로가기"></a>
                          	<button class="btn btn-primary" type="submit" onclick="deleteOne()">등록하기</button>
                          </div>
                        </div>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
              </div>
              </div>
<%-- <%@ include file="../footer.jsp" %> --%>
</body>
</html>