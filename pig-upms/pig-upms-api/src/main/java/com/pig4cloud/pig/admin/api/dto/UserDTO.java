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

package com.pig4cloud.pig.admin.api.dto;

import com.pig4cloud.pig.admin.api.entity.SysUser;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * @author lengleng
 * @date 2019/2/1
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class UserDTO extends SysUser {
	/**
	 * 角色ID
	 */
	private List<Integer> role;

	private Integer deptId;

	/**
	 * 新密码
	 */
	private String newpassword1;
	/**
	 * 学生姓名
	 */
	private String realName;
	/**
	 * 民族
	 */
	private String nation;
	/**
	 * 性别
	 */
	private String sex;
	/**
	 * 出生年月
	 */
	private String birthDate;
	/**
	 * 个人信息
	 */
	private String personalInformation;
	/**
	 * 个人荣誉
	 */
	private String honor;
	/**
	 * 联系地址
	 */
	private String contactAddress;
	/**
	 * 入学日期
	 */
	private String enrollment;
	/**
	 * 个人头像
	 */
	private String headImage;
}
