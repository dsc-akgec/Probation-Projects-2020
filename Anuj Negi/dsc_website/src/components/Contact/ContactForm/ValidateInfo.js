export default function validateInfo(values) {
  let errors = {};

  if (!values.fullName.trim()) {
    errors.fullName = "Full Name required";
  }

  if (!values.email) {
    errors.email = "Email required";
  } else if (!/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i.test(values.email)) {
    errors.email = "Email address is invalid";
  }

  if (!values.section) {
    errors.section = "Enter Section";
  } else if (!/^\d+$/.test(values.section)) {
    errors.section = "Invalid! Number only";
  }

  if (!values.studentNumber) {
    errors.studentNumber = "Enter Student Number";
  } else if (values.studentNumber.length !== 7) {
    errors.studentNumber = "Student Number should be of 7 digits";
  } else if (!/^\d+$/.test(values.studentNumber)) {
    errors.studentNumber = "Invalid! Numbers only";
  }

  if (!values.universityRollNumber) {
    errors.universityRollNumber = "Enter University Roll Number";
  } else if (
    values.universityRollNumber.length !== 13 &&
    values.universityRollNumber.length !== 10
  ) {
    errors.universityRollNumber = "Invalid University Roll Number";
  } else if (!/^\d+$/.test(values.universityRollNumber)) {
    errors.universityRollNumber = "Invalid! Numbers only";
  }

  return errors;
}
