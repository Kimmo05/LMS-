package com.min.bean;

import java.util.List;

import com.min.vo.MemberVo;
import com.min.vo.SubjectVo;

public class SubjectListBeanUser {
	
	private List<SubjectVo> lists;
	private MemberVo mem;
	
	public void setLists(List<SubjectVo> lists) {
		this.lists = lists;
	}
	public void setMem(MemberVo mem) {
		this.mem = mem;
	}

	//전체 구성
	public String getListForm() {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < lists.size(); i++) {
			sb.append(listRowForm(lists.get(i)));
		}
		return sb.toString();
	}
	
	//화면 구성
	private String listRowForm(SubjectVo subVo) {
		StringBuffer sb = new StringBuffer();                                                 
	    sb.append ("<div class='card-header'>");
        sb.append ("   <h5 class='mb-0 p-0'> ");
        sb.append ("      <button class='btn btn-link ps-0' data-bs-toggle='collapse' data-bs-target='#collapseicon' aria-expanded='true' aria-controls='collapseicon'>Filter</button> ");
        sb.append ("    </h5>                                                                                                                                                          ");
        sb.append ("  </div>                                                                                                                                                           ");
        sb.append ("  <div class='collapse show' id='collapseicon' aria-labelledby='collapseicon' data-parent='#accordion'>                                                            ");
        sb.append ("    <div class='card-body filter-cards-view animate-chk'>                                                                                                          ");
        sb.append ("      <div class='job-filter mb-3'>                                                                                                                                ");
        sb.append ("        <div class='faq-form'>                                                                                                                                     ");
        sb.append ("          <input class='form-control' type='text' placeholder='Search..'><i class='search-icon' data-feather='search'></i>                                         ");
        sb.append ("        </div>                                                                                                                                                     ");
        sb.append ("      </div>                                                                                                                                                       ");
        sb.append ("      <div class='checkbox-animated'>                                                                                                                              ");
        sb.append ("        <label class='d-block' for='chk-ani'>                                                                                                                      ");
        sb.append ("          <input class='checkbox_animated' id='chk-ani' type='checkbox'> Full-time (8688)                                                                          ");
        sb.append ("        </label>                                                                                                                                                   ");
        sb.append ("        <label class='d-block' for='chk-ani1'>                                                                                                                     ");
        sb.append ("          <input class='checkbox_animated' id='chk-ani1' type='checkbox'>Contract (503)                                                                            ");
        sb.append ("        </label>                                                                                                                                                   ");
 		sb.append ("			</div>                                                                                                                                                 ");
        sb.append ("           <button class='btn btn-primary text-center' type='button'>Find jobs</button>                                                                            ");
        sb.append ("         </div>                                                                                                                                                    ");
        sb.append ("       </div>                                                                                                                                                      ");
        sb.append ("     </div>                                                                                                                                                        ");
        sb.append ("   </div>                                                                                                                                                          ");
        sb.append ("   <div class='col-xl-12'>                                                                                                                                         ");
        sb.append ("     <div class='card'>                                                                                                                                            ");
        sb.append ("       <div class='card-header'>                                                                                                                                   ");
        sb.append ("         <h5 class='mb-0 p-0'>                                                                                                                                     ");
        sb.append ("           <button class='btn btn-link ps-0' data-bs-toggle='collapse' data-bs-target='#collapseicon1' aria-expanded='true' aria-controls='collapseicon1'>Location  </button> ");
        sb.append ("         </h5>                                                                                                                                                                ");
        sb.append ("       </div>                                                                                                                                                                 ");
        sb.append ("       <div class='collapse show' id='collapseicon1' aria-labelledby='collapseicon1' data-parent='#accordion'>                                                                ");
        sb.append ("         <div class='card-body animate-chk'>                                                                                                                                  ");
        sb.append ("           <div class='location-checkbox'>                                                                                                                                    ");
        sb.append ("             <label class='d-block' for='chk-ani6'>                                                                                                                           ");
        sb.append ("               <input class='checkbox_animated' id='chk-ani6' type='checkbox'>                          New York<span class='d-block'>NY (399)</span>                         ");
        sb.append ("             </label>                                                                                                                                                         ");
        sb.append ("            <label class='d-block' for='chk-ani7'>                                                                                                                            ");
        sb.append ("              <input class='checkbox_animated' id='chk-ani7' type='checkbox'>                           San Francisco<span class='d-block'>CA (252)</span>                    ");
        sb.append ("            </label>                                                                                                                                                          ");
		sb.append ("						</div>                                                                                                                                                ");
        sb.append ("                    </div>                                                                                                                                                    ");
        sb.append ("                    <button class='btn btn-block btn-primary text-center' type='button'>All Locations</button>                                                                ");
        sb.append ("                  </div>                                                                                                                                                      ");
        sb.append ("                </div>                                                                                                                                                        ");
        sb.append ("              </div>                                                                                                                                                          ");
        sb.append ("                                                                                                                                                                              ");
        sb.append ("              <div class='col-xl-12'>                                                                                                                                         ");
        sb.append ("                <div class='card'>                                                                                                                                            ");
        sb.append ("                  <div class='card-header'>                                                                                                                                   ");
        sb.append ("                    <h5 class='mb-0 p-0'>                                                                                                                                     ");
        sb.append ("                      <button class='btn btn-link ps-0' data-bs-toggle='collapse' data-bs-target='#collapseicon4' aria-expanded='true' aria-controls='collapseicon4'>Specific skills</button> ");
        sb.append ("                    </h5>                                                                                                                                                                     ");
        sb.append ("                  </div>                                                                                                                                                                      ");
        sb.append ("                  <div class='collapse show' id='collapseicon4' data-parent='#accordion' aria-labelledby='collapseicon4'>                                                                     ");
        sb.append ("                    <div class='card-body animate-chk'>                                                                                                                                       ");
        sb.append ("                      <label class='d-block' for='chk-ani21'>                                                                                                                                 ");
        sb.append ("                        <input class='checkbox_animated' id='chk-ani21' type='checkbox'>                          HTML,scss & sass                                                            ");
        sb.append ("                      </label>                                                                                                                                                                ");
        sb.append ("                      <label class='d-block' for='chk-ani22'>                                                                                                                                 ");
        sb.append ("                        <input class='checkbox_animated' id='chk-ani22' type='checkbox'>                          Javascript                                                                  ");
        sb.append ("                      </label>                                                                                                                                                                ");
        sb.append ("                      <label class='d-block' for='chk-ani23'>                                                                                                                                 ");
        sb.append ("                        <input class='checkbox_animated' id='chk-ani23' type='checkbox'>                          Node.js                                                                     ");
        sb.append ("                      </label>                                                                                                                                                                ");
        sb.append ("                      <label class='d-block' for='chk-ani24'>                                                                                                                                 ");
        sb.append ("                        <input class='checkbox_animated' id='chk-ani24' type='checkbox'>                          Gulp & Pug                                                                  ");
        sb.append ("                      </label>                                                                                                                                                                ");
        sb.append ("                       <label class='d-block mb-0' for='chk-ani25'>                                                                                                                           ");
        sb.append ("                         <input class='checkbox_animated' id='chk-ani25' type='checkbox'>                          Angular.js                                                                 ");
        sb.append ("                       </label>                                                                                                                                                               ");
        sb.append ("                     </div>                                                                                                                                                                   ");
        sb.append ("                     <button class='btn btn-block btn-primary text-center' type='button'>All Skills</button>                                                                                  ");
        sb.append ("                   </div>                                                                                                                                                                     ");
        sb.append ("                 </div>                                                                                                 ");
       sb.append ("                </div>                                                                                                   ");
       sb.append ("              </div>                                                                                                     ");
       sb.append ("            </div>                                                                                                       ");
       sb.append ("          </div>                                                                                                         ");
       sb.append ("        </div>                                                                                                           ");
       sb.append ("      </div>                                                                                                             ");
       sb.append ("                                                                                                                         ");
	sb.append ("			                                                                                                                ");
       sb.append ("                                                                                                                         ");
       sb.append ("          <div class='col-xl-9 xl-60 box-col-8'>                                                                         ");
       sb.append ("                  <c:forEach var='sVo' items='${list}'  varStatus='vs'>                                                  ");
       sb.append ("            <div class='card'>                                                                                           ");
       sb.append ("              <div class='job-search'>                                                                                   ");
       sb.append ("                <div class='card-body'>                                                                                  ");
       sb.append ("                  <div class='media'><img class='img-40 img-fluid m-r-20' src='./assets/images/job-search/2.jpg' alt=''> ");
       sb.append ("                    <div class='media-body'>                                                                             ");
       sb.append ("                    <c:choose>                                                                                           ");
       sb.append ("                    <c:when test='${sVo.cod_name  eq 'JAVA'}'>                                                           ");
       sb.append ("                    <span class='badge rounded-pill' style='background-color:#006400'>${sVo.cod_name}</span>            ");
       sb.append ("                    </c:when>                                                                                            ");
       sb.append ("                      <c:when test='${sVo.cod_name eq 'C'}'>                                                             ");
       sb.append ("                    <span class='badge rounded-pill' style='background-color: #AFEEEE'>${sVo.cod_name}</span>           ");
       sb.append ("                   </c:when>                                                                                             ");
       sb.append ("                    <c:when test='${sVo.cod_name  eq 'HTML'}'>                                                           ");
       sb.append ("                    <span class='badge rounded-pill' style='background-color:#6A5ACD'>${sVo.cod_name}</span>            ");
       sb.append ("                    </c:when>                                                                                            ");
       sb.append ("                      <c:when test='${sVo.cod_name eq 'PYTHON'}'>                                                        ");
       sb.append ("                    <span class='badge rounded-pill' style='background-color: #C71585'>${sVo.cod_name}</span>           ");
       sb.append ("                    </c:when>                                                                                            ");
       sb.append ("                    <c:when test='${sVo.cod_name  eq 'CSS'}'>                                                            ");
       sb.append ("                    <span class='badge rounded-pill' style='background-color:#FFF8DC'>${sVo.cod_name}</span>            ");
       sb.append ("                    </c:when>                                                                                            ");
       sb.append ("                      <c:when test='${sVo.cod_name eq 'LINUX'}'>                                                         ");
       sb.append ("                    <span class='badge rounded-pill' style='background-color: #40E0D0'>${sVo.cod_name}</span>           ");
       sb.append ("                    </c:when>                                                                                            ");
       sb.append ("                    <c:when test='${sVo.cod_name  eq 'C#'}'>                                                             ");
       sb.append ("                    <span class='badge rounded-pill' style='background-color:	#8FBC8F'>${sVo.cod_name}</span>        ");
       sb.append ("                    </c:when>                                                                                            ");
       sb.append ("                      <c:when test='${sVo.cod_name eq 'JAVASCRIPT'}'>                                                    ");
       sb.append ("                    <span class='badge rounded-pill' style='background-color:	#8A2BE2'>${sVo.cod_name}</span>        ");
       sb.append ("                   </c:when>                                                                                             ");
       sb.append ("                    <c:when test='${sVo.cod_name  eq 'AI'}'>                                                             ");
       sb.append ("                    <span class='badge rounded-pill' style='background-color:	#FFB6C1'>${sVo.cod_name}</span>        ");
       sb.append ("                    </c:when>                                                                                            ");
       sb.append ("                      <c:when test='${sVo.cod_name eq 'BIGDATA'}'>                                                       ");
       sb.append ("                    <span class='badge rounded-pill' style='background-color: 	#000080'>${sVo.cod_name}</span>        ");
       sb.append ("                    </c:when>                                                                                            ");
       sb.append ("                    <c:when test='${sVo.cod_name  eq 'DEEPLEARNING'}''>                                                   ");
       sb.append ("                    <span class='badge rounded-pill' style='background-color:	#FA8072'>${sVo.cod_name}</span>         ");
       sb.append ("                    </c:when>                                                                                            ");
       sb.append ("                      <c:when test='${sVo.cod_name eq 'VR'}'>                                                            ");
       sb.append ("                    <span class='badge rounded-pill' style='background-color: #FFA500'>${sVo.cod_name}</span>           ");
       sb.append ("                    </c:when>                                                                                            ");
       sb.append ("                    <c:when test='${sVo.cod_name  eq 'AR'}'>                                                             ");
       sb.append ("                    <span class='badge rounded-pill' style='background-color:	#F0E68C'>${sVo.cod_name}</span>        ");
       sb.append ("                    </c:when>                                                                                            ");
       sb.append ("                      <c:when test='${sVo.cod_name eq 'EXCEL'}'>                                                         ");
       sb.append ("                    <span class='badge rounded-pill' style='background-color: 	#B0C4DE'>${sVo.cod_name}</span>        ");
       sb.append ("                    </c:when>                                                                                            ");
       sb.append ("                    <c:when test='${sVo.cod_name  eq 'POWERPOINT'}''>                                                     ");
       sb.append ("                    <span class='badge rounded-pill' style='background-color:	#2F4F4F'>${sVo.cod_name}</span>         ");
       sb.append ("                    </c:when>                                                                                            ");
       sb.append ("                      <c:when test='${sVo.cod_name eq 'KOTLIN'}'>                                                        ");
       sb.append ("                    <span class='badge rounded-pill' style='background-color: #D8BFD8'>${sVo.cod_name}</span>           ");
       sb.append ("                    </c:when>                                                                                            ");
       sb.append ("                    <c:when test='${sVo.cod_name  eq 'SPRING'}'>                                                         ");
       sb.append ("                    <span class='badge rounded-pill' style='background-color:#1E90FF'>${sVo.cod_name}</span>            ");
       sb.append ("                    </c:when>                                                                                            ");
       sb.append ("                      <c:when test='${sVo.cod_name eq '기타'}''>                                                          ");
       sb.append ("                    <span class='badge rounded-pill' style='background-color: #008080'>${sVo.cod_name}</span>           ");
       sb.append ("                    </c:when>                                                                                            ");
       sb.append ("                    <c:when test='${sVo.cod_name  eq '형상관리'}'>                                                       ");
       sb.append ("                    <span class='badge rounded-pill' style='background-color:	#FFD700'>${sVo.cod_name}</span>         ");
       sb.append ("                    </c:when>                                                                                            ");
       sb.append ("                      <c:when test='${sVo.cod_name eq 'DATABASE'}'>                                                      ");
       sb.append ("                    <span class='badge rounded-pill' style='background-color: #A52A2A'>${sVo.cod_name}</span>           ");
       sb.append ("                   </c:when>                                                                                             ");
       sb.append ("                   <c:otherwise>                                                                                         ");
       sb.append ("                   	 <span class='badge rounded-pill' style='background-color: 	#556B2F'>${sVo.cod_name}</span>        ");
       sb.append ("                   </c:otherwise>                                                                                        ");
       sb.append ("                   </c:choose>                                                                                           ");
       sb.append ("                     <ul class='rating'>                                                                                 ");
       sb.append ("                       <li><i class='fa fa-star font-warning'></i></li>                                                  ");
       sb.append ("                       <li><i class='fa fa-star font-warning'></i></li>                                                  ");
       sb.append ("                       <li><i class='fa fa-star font-warning'></i></li>                                                  ");
       sb.append ("                       <li><i class='fa fa-star font-warning'></i></li>                                                  ");
       sb.append ("                       <li><i class='fa fa-star font-warning'></i></li>                                                  ");
       sb.append ("                     </ul>                                                                                               ");
       sb.append ("                                                                                                                         ");
       sb.append ("                     <h6 class='f-w-600'><a href='./comSubjectDetail.do?sub_num=${sVo.sub_num}'>${sVo.sub_title}</a><span class='pull-right'> <fmt:parseDate var='cDate' value='${sVo.sub_regdate}' pattern='yyyy-MM-dd'/>");
       sb.append ("                  <fmt:formatDate value='${cDate }'/></span></h6>                                                                                                                                                         ");
       sb.append ("                     <p>${sVo.sub_content}</p>                                                                                                                                                                            ");
       sb.append ("                   </div>                                                                                                                                                                                                 ");
       sb.append ("                 </div>                                                                                                                                                                                                   ");
       sb.append ("               </div>                                                                                                                                                                                                     ");
       sb.append ("              </div>                                                                                                                                                                                                      ");
       sb.append ("            </div>                                                                                                                                                                                                        ");
       sb.append ("                    </c:forEach>                                                                                                                                                                    ");
       sb.append ("            </div>                                                                                                                                                                                  ");
       sb.append ("          </div>                                                                                                                                                                                    ");
       sb.append ("                                                                                                                                                                                                    ");
       sb.append ("      <div class='col-xl-6'>                                                                                                                                                                        ");
       sb.append ("                                                                                                                                                                                                    ");
       sb.append ("          <div class='card-body'>                                                                                                                                                                   ");
       sb.append ("            <nav aria-label='Page navigation example'>                                                                                                                                              ");
       sb.append ("              <ul class='pagination justify-content-center pagination-primary'>                                                                                                                     ");
       sb.append ("                <li class='page-item'><a class='page-link' href='javascript:void(0)' aria-label='Previous'><span aria-hidden='true'>«</span><span class='sr-only'>Previous</span></a></li>          ");
       sb.append ("                <li class='page-item'><a class='page-link' href='javascript:void(0)'>1</a></li>                                                                                                     ");
       sb.append ("                <li class='page-item'><a class='page-link' href='javascript:void(0)'>2</a></li>                                                                                                     ");
       sb.append ("                <li class='page-item'><a class='page-link' href='javascript:void(0)'>3</a></li>                                                                                                     ");
       sb.append ("                <li class='page-item'><a class='page-link' href='javascript:void(0)'>4</a></li>                                                                                                     ");
       sb.append ("                <li class='page-item'><a class='page-link' href='javascript:void(0)'>5</a></li>                                                                                                     ");
       sb.append ("                <li class='page-item'><a class='page-link' href='javascript:void(0)' aria-label='Next'><span aria-hidden='true'>»</span><span class='sr-only'>Next</span></a></li>                  ");
       sb.append ("              </ul> ");
       sb.append ("         </nav>     ");
       sb.append ("       </div>       ");
       sb.append ("   </div>           ");
       sb.append ("                    ");
       sb.append ("                    ");
       sb.append ("     </div>         ");
       return sb.toString();                                                
	}
	

}
