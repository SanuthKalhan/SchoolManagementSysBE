const express = require('express');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const multer = require('multer');
const db = require('./models'); 
const cors = require('cors');
const path = require('path');
const Admin = db.admin; 
const Student = db.student;
const Lecturer = db.lecturer;
const Course = db.course;
const StdSub = db.stusub;
const LecSub = db.lecsub;

const app = express();
const PORT = process.env.PORT || 5000;

app.use(express.json());
app.use(cors())

const JWT_SECRET = '$ec_code';


const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'public/uploads/');//
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + path.extname(file.originalname));
  },
});

const upload = multer({ storage });



app.post('/login', async (req, res) => {
  const { username, password } = req.body;

  try {
    const admin = await Admin.findOne({ where: { username } });
    if (!admin) {
      return res.status(401).json({ message: 'Invalid username or password' });
    }
    const isPassVal = await bcrypt.compare(password, admin.password);
    if (!isPassVal) {
      return res.status(401).json({ message: 'Invalid username or password' });
    }

    const token = jwt.sign({ id: admin.id, username: admin.username }, JWT_SECRET, {
      expiresIn: '1h',
    });

    res.json({ message: 'Login successful', token });
  } catch (error) {
    console.error('Error:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
});

app.post('/student', upload.single('birthCertificate'), async (req, res) => {
  const { name, age, gender, address } = req.body;
  const BCURL = `/uploads/${req.file.filename}`; 

  try {
    const newStu = await Student.create({ name, age, gender, address, BCURL });

    res.status(201).json({ message: 'Student added successfully!', student: newStu });
  } catch (error) {
    console.error('Error adding student:', error);
    res.status(500).json({ message: 'Internal server error.' });
  }
});

app.get('/student', async (req, res) => {
  try {
    const students = await Student.findAll();
    res.status(200).json(students);
  } catch (error) {
    console.error('Error fetching students:', error);
    res.status(500).json({ message: 'Internal server error.' });
  }
});

app.put('/student/:id', async (req, res) => {
  const { id } = req.params;
  const updatedData = req.body;

  try {
    const [updated] = await Student.update(updatedData, {
      where: { id: id }
    });

    if (updated) {
      const updatedStudent = await Student.findOne({ where: { id: id } });
      return res.status(200).json(updatedStudent);
    }
    throw new Error('Student not found');
  } catch (error) {
    console.error('Error updating student:', error);
    res.status(500).json({ message: 'Internal server error.' });
  }
});

app.delete('/student/:id', async (req, res) => {
  const { id } = req.params;

  try {
    const deleted = await Student.destroy({
      where: { id: id }
    });

    if (deleted) {
      return res.status(204).send();
    }
    throw new Error('Student not found');
  } catch (error) {
    console.error('Error deleting student:', error);
    res.status(500).json({ message: 'Internal server error.' });
  }
});

app.post('/lecturer', async (req, res) => {
  const { name, age, gender, address, qualifications } = req.body;

  try {
    const newLec = await Lecturer.create({ name, age, gender, address, qualifications });

    res.status(201).json({ message: 'Lecturer added successfully!', lecturer: newLec });
  } catch (error) {
    console.error('Error adding lecturer:', error);
    res.status(500).json({ message: 'Internal server error.' });
  }
});

app.get('/lecturer', async (req, res) => {
  try {
    const lecturers = await Lecturer.findAll();
    res.status(200).json(lecturers);
  } catch (error) {
    console.error('Error fetching lecturers:', error);
    res.status(500).json({ message: 'Internal server error.' });
  }
});

app.put('/lecturer/:id', async (req, res) => {
  const { id } = req.params;
  const updatedData = req.body;

  try {
    const [updated] = await Lecturer.update(updatedData, {
      where: { id: id }
    });

    if (updated) {
      const updatedLecturer = await Lecturer.findOne({ where: { id: id } });
      return res.status(200).json(updatedLecturer);
    }
    throw new Error('Lecturer not found');
  } catch (error) {
    console.error('Error updating lecturer:', error);
    res.status(500).json({ message: 'Internal server error.' });
  }
});

app.delete('/lecturer/:id', async (req, res) => {
  const { id } = req.params;

  try {
    const deleted = await Lecturer.destroy({
      where: { id: id }
    });

    if (deleted) {
      return res.status(204).send();
    }
    throw new Error('Lecturer not found');
  } catch (error) {
    console.error('Error deleting lecturer:', error);
    res.status(500).json({ message: 'Internal server error.' });
  }
});

app.post('/course', async (req, res) => {
  const { code, title, description, difficultyLevel, credits } = req.body;

  try {
    const newCourse = await Course.create({ code, title, description, difficultyLevel, credits });
    res.status(201).json({ message: 'Course added successfully!', course: newCourse });
  } catch (error) {
    console.error('Error adding course:', error);
    res.status(500).json({ message: 'Internal server error.' });
  }
});

app.get('/course', async (req, res) => {
  try {
    const courses = await Course.findAll();
    res.status(200).json(courses);
  } catch (error) {
    console.error('Error fetching courses:', error);
    res.status(500).json({ message: 'Internal server error.' });
  }
});

app.put('/course/:id', async (req, res) => {
  const { id } = req.params;
  const updatedData = req.body;

  try {
    const [updated] = await Course.update(updatedData, {
      where: { id: id }
    });

    if (updated) {
      const updatedCourse = await Course.findOne({ where: { id: id } });
      return res.status(200).json(updatedCourse);
    }
    throw new Error('Course not found');
  } catch (error) {
    console.error('Error updating course:', error);
    res.status(500).json({ message: 'Internal server error.' });
  }
});

app.delete('/course/:id', async (req, res) => {
  const { id } = req.params;

  try {
    const deleted = await Course.destroy({
      where: { id: id }
    });

    if (deleted) {
      return res.status(204).send();
    }
    throw new Error('Course not found');
  } catch (error) {
    console.error('Error deleting course:', error);
    res.status(500).json({ message: 'Internal server error.' });
  }
});



app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
