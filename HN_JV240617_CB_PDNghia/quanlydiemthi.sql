-- Tạo CSDL tên QUANLYDIEMTHI . [5 điểm]
create database quanlydiemthi;
use quanlydiemthi;

create table student(
    studentId varchar(4) not null primary key ,
    studentName varchar(100) not null ,
    birthday date not null ,
    gender bit(1) not null ,
    address text not null ,
    phoneNumber varchar(45) unique
);

create table subjects (
    subjectId varchar(4) not null primary key ,
    subjectName varchar(45) not null ,
    priority int not null
);

create table mark(
	primary key (studentId, subjectId),
    studentId varchar(4) not null ,
    subjectId varchar(4) not null ,
    foreign key (studentId) references student(studentId),
	foreign key (subjectId) references subjects(subjectId),
    point double not null
);


# Bài 2: Thêm , sửa , xoá dữ liệu [35 điểm]:
-- 1. Thêm dữ liệu vào các bảng như sau [15 điểm (mỗi bảng 5 điểm)]:
insert into STUDENT(studentId, studentName, birthday, gender, address, phoneNumber) values
('S001', 'Nguyễn Thế Anh', str_to_date('11/01/1999','%d/%m/%Y'), 1, 'Hà Nội', '0984678082'),
('S002', 'Đặng Bảo Trâm', str_to_date('22/12/1998','%d/%m/%Y'), 0, 'Lào Cai', '0904982654'),
('S003', 'Trần Hà Phương', str_to_date('05/05/2000','%d/%m/%Y'), 0, 'Nghệ An', '0947645363'),
('S004', 'Đỗ Tiến Mạnh', str_to_date('26/03/1999','%d/%m/%Y'), 1, 'Hà Nội', '0983665353'),
('S005', 'Phạm Duy Nhất', str_to_date('04/10/1998','%d/%m/%Y'), 1, 'Tuyên Quang', '0987242678'),
('S006', 'Mai Văn Thái', str_to_date('22/06/2002','%d/%m/%Y'), 1, 'Nam Định', '0982654268'),
('S007', 'Giang Gia Hân', str_to_date('10/11/1996','%d/%m/%Y'), 0, 'Phú Thọ', '0982364753'),
('S008', 'Nguyễn Ngọc Bảo My', str_to_date('22/01/1999','%d/%m/%Y'), 0, 'Hà Nam', '0927867453'),
('S009', 'Nguyễn Tiến Đạt', str_to_date('7/8/1998','%d/%m/%Y'), 1, 'Tuyên Quang', '0989274673'),
('S010', 'Nguyễn Thiều Quang', str_to_date('18/9/2000','%d/%m/%Y'), 1, 'Hà Nội', '0984378291');

insert into subjects( subjectId, subjectName, priority) values
('MH01', 'Toán', 2),
('MH02', 'Vật Lý', 2),
('MH03', 'Hoá Học', 1),
('MH04', 'Ngữ Văn', 1),
('MH05', 'Tiếng Anh', 2);

insert into mark(subjectId, studentId, point) values
('MH01','S001', 8.5), ('MH02','S001', 7), ('MH03','S001',9), ('MH04','S001',9), ('MH05','S001',5),
('MH01','S002',9), ('MH02','S002',8), ('MH03','S002',6.5), ('MH04','S002',8), ('MH05','S002',6),
('MH01','S003',7.5), ('MH02','S003',6.5), ('MH03','S003',8), ('MH04','S003',7), ('MH05','S003',7),
('MH01','S004',6), ('MH02','S004',7), ('MH03','S004',5), ('MH04','S004',6.5), ('MH05','S004',8),
('MH01','S005',5.5), ('MH02','S005',8), ('MH03','S005',7.5), ('MH04','S005',8.5), ('MH05','S005',9),
('MH01','S006',8), ('MH02','S006',10), ('MH03','S006',9), ('MH04','S006',7.5), ('MH05','S006',6.5),
('MH01','S007',9.5), ('MH02','S007',9),('MH03','S007',6), ('MH04','S007',9), ('MH05','S007',4),
('MH01','S008',10), ('MH02','S008',8.5), ('MH03','S008',8.5), ('MH04','S008',6), ('MH05','S008',9.5),
('MH01','S009',7.5), ('MH02','S009',7), ('MH03','S009',9), ('MH04','S009',5), ('MH05','S009',10),
('MH01','S010',6.5), ('MH02','S010',8), ('MH03','S010',5.5), ('MH04','S010',4), ('MH05','S010',7);

-- 2. Cập nhật dữ liệu [10 điểm]:
-- Sửa tên sinh viên có mã `S004` thành “Đỗ Đức Mạnh”.
 update student set studentName = 'Đỗ Đức Mạnh' where studentId = 'S004';
-- select * from student; 

-- Sửa tên và hệ số môn học có mã `MH05` thành “Ngoại Ngữ” và hệ số là 1.
update subjects set subjectName = 'Ngoại Ngữ', priority = 1 where subjectId = 'MH05';
-- select * from subjects; 

-- Cập nhật lại điểm của học sinh có mã `S009` thành (MH01 : 8.5, MH02 : 7,MH03 : 5.5, MH04 : 6, MH05 : 9).
update mark set point = 8.5 where studentId = 'S009' and subjectId = 'MH01';
update mark set point = 7 where studentId = 'S009' and subjectId = 'MH02';
update mark set point = 5.5 where studentId = 'S009' and subjectId = 'MH03';
update mark set point = 6 where studentId = 'S009' and subjectId = 'MH04';
update mark set point = 9 where studentId = 'S009' and subjectId = 'MH05';
--  select * from mark;

-- 3. Xoá dữ liệu[10 điểm]:
-- Xoá toàn bộ thông tin của học sinh có mã `S010` bao gồm điểm thi ở bảng MARK 
delete from mark where studentId = 'S010';

-- thông tin học sinh này ở bảng STUDENT.
delete from student where studentId = 'S010';

-- Bài 3: Truy vấn dữ liệu [25 điểm]:
-- 1. Lấy ra tất cả thông tin của sinh viên trong bảng Student . [4 điểm]
 select * from student;

-- 2. Hiển thị tên và mã môn học của những môn có hệ số bằng 1. [4 điểm]
select subjectName as 'Tên môn học', subjectId as 'Mã môn học'
    from subjects
    where priority = 1;

-- 3. Hiển thị thông tin học sinh bào gồm: mã học sinh, tên học sinh, tuổi (bằng năm hiện tại trừ
-- năm sinh) , giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả học sinh. [4 điểm]
select studentId as 'Mã học sinh', studentName as 'Tên học sinh',
	year(curdate()) -year(birthday) as 'tuổi' ,
	case when gender = 1 then 'Nam' else 'Nữ' end as 'giới tính' ,
	address as 'quê quán'
	from student;

-- 4. Hiển thị thông tin bao gồm: tên học sinh, tên môn học , điểm thi của tất cả học sinh của môn
-- Toán và sắp xếp theo điểm giảm dần. [4 điểm]
 select s.studentName as 'Tên học sinh', sj.subjectName as 'Tên môn học' ,m.point as 'Điểm thi'
    from mark m
    join student s on s.studentId = m.studentId
    join subjects sj on sj.subjectId = m.subjectId
    where sj.subjectName = 'Toán'
    order by m.point desc ;

-- 5. Thống kê số lượng học sinh theo giới tính ở trong bảng (Gồm 2 cột: giới tính và số lượng).-- [4 điểm]
  select case when gender = 1 then 'Nam' else 'Nữ' end as 'Giới tính', count(*) as 'Số lượng'
    from student
    group by gender;


-- 6. Tính tổng điểm và điểm trung bình của các môn học theo từng học sinh (yêu cầu sử dụng hàm
-- để tính toán) , bảng gồm mã học sinh, tên hoc sinh, tổng điểm và điểm trung bình. [5 điểm]
 select s.studentId as 'Mã học sinh', 
	s.studentName as 'Tên học sinh',
	sum(m.point) as 'Tổng Điểm',
	avg(m.point) as 'Điểm TB môn'
    from Mark m
	inner join student s on m.studentId = s.studentId
    group by s.studentId, s.studentName;
-- 1. Tạo VIEW có tên STUDENT_VIEW lấy thông tin sinh viên bao gồm : mã học sinh, tên học sinh, giới tính , quê quán . [3 điểm]
 create view STUDENT_VIEW as
        select studentId as 'mã học sinh',studentName as 'tên học sinh',
               case when gender = 1 then 'Nam' else 'Nữ' end as 'giới tính' ,
               address as 'quê quán'
            from student;
            
-- select * from STUDENT_VIEW;

-- 2. Tạo VIEW có tên AVERAGE_MARK_VIEW lấy thông tin gồm:mã học sinh, tên học sinh, điểm trung bình các môn học . [3 điểm]
create view AVERAGE_MARK_VIEW as
    select s.studentId as 'mã học sinh', s.studentName as 'tên học sinh',
       avg(m.point) as 'Điểm TB môn'
    from mark m
         inner join student s on m.studentId = s.studentId
    group by s.studentId, s.studentName;

-- select * from AVERAGE_MARK_VIEW;

-- 3. Đánh Index cho trường `phoneNumber` của bảng STUDENT. [2 điểm]
create index index_phoneNumber on student(phoneNumber);

# 4. Tạo các PROCEDURE sau:
-- Tạo PROC_INSERTSTUDENT dùng để thêm mới 1 học sinh bao gồm tất cả thông tin học sinh đó. [3 điểm]
delimiter //
    create procedure PROC_INSERTSTUDENT(
        in studentId_in varchar(4),
        in studentName_in varchar(100) ,
        in birthday_in date,
        in gender_in bit,
		in address_in text,
        in phoneNumber_in varchar(45)
    )
    begin
        insert into student(studentId, studentName, birthday, gender, address, phoneNumber)
            value (studentId_in, studentName_in, birthday_in, gender_in, address_in, phoneNumber_in);
    end //
    delimiter ;
call PROC_INSERTSTUDENT('S011', 'Nguyễn Trường Sơn', str_to_date('18/04/2001','%d/%m/%Y'), 1, 'Hưng Yên', '0353090212');   

-- select * from student;
-- Tạo PROC_UPDATESUBJECT dùng để cập nhật tên môn học theo mã môn học.  [3 điểm]
 delimiter //
    create procedure PROC_UPDATESUBJECT(
        in subjectId_in VARCHAR(4),
        in subjectName_in VARCHAR(45)
    )
    begin
        update subjects
            set subjectName = subjectName_in
        where subjectId = subjectId_in;
    end //
delimiter ;
-- call PROC_UPDATESUBJECT('MH05', 'Ngôn Ngữ Anh');
-- select * from subjects;

-- Tạo PROC_DELETEMARK dùng để xoá toàn bộ điểm các môn học theo mã học sinh. [3 điểm]
delimiter //
    create procedure PROC_DELETEMARK(
        in studentId_in varchar(4)
    )
    begin
        delete from mark
            where studentId = studentId_in;
    end //
delimiter ;
-- call PROC_DELETEMARK('S001');
-- select * from mark;
    