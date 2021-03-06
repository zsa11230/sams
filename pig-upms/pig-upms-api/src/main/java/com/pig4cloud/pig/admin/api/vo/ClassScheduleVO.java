/*
 *  Copyright (c) 2019-2020, 冷冷 (wangiegie@gmail.com).
 *  <p>
 *  Licensed under the GNU Lesser General Public License 3.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *  <p>
 * https://www.gnu.org/licenses/lgpl.html
 *  <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.pig4cloud.pig.admin.api.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author lengleng
 * @date 2019/2/1
 * 角色Dto
 */
@Data
public class ClassScheduleVO implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 课程表Id
	 */
	private Integer id;
	/**
	 * 课程id
	 */
	private String className;
	/**
	 * 上课时间
	 */
	private Integer subjectTime;
	/**
	 * 是否是专业课（0是专业课，1是选修课）
	 */
	private Integer type;
	private Integer isMajor;

}
