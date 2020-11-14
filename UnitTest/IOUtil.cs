using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UnitTest {

    public static class IOUtil {

        public static void Write(string folderPath, string fileName, string content) {
            string fullPath = folderPath + "/" + fileName;
            if (!Directory.Exists(folderPath)) {
                Directory.CreateDirectory(folderPath);
            }
            using (StreamWriter sw = new StreamWriter(fullPath, false, Encoding.UTF8)) {
                sw.Write(content);
            }
        }

        public static string Read(string folderPath, string fileName) {
            string fullPath = folderPath + "/" + fileName;
            using (FileStream fs = new FileStream(fullPath, FileMode.Open, FileAccess.Read)) {
                using (StreamReader sw = new StreamReader(fs, Encoding.UTF8)) {
                    return sw.ReadToEnd();
                }
            }
        }

        public static byte[] ReadBytes(string folderPath, string fileName) {
            string fullPath = folderPath + "/" + fileName;
            return ReadBytes(fullPath);
        }

        public static byte[] ReadBytes(string fullPath) {
            using (FileStream fs = new FileStream(fullPath, FileMode.Open, FileAccess.Read)) {
                using (StreamReader sw = new StreamReader(fs)) {
                    byte[] bytes = new byte[fs.Length];
                    fs.Read(bytes, 0, bytes.Length);
                    return bytes;
                }
            }
        }

    }

}
