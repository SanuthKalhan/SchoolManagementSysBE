const bcrypt = require('bcrypt');

(async () => {
  const password = "admin123";
  const salt = await bcrypt.genSalt(10); 
  const hashedPassword = await bcrypt.hash(password, salt);
  
  console.log("Hashed Password:", hashedPassword);
})();
