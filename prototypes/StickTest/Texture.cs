using System;
using System.Drawing;
using System.Drawing.Imaging;
using CsGL.OpenGL;

namespace StickTest
{
	public class Texture : GL,IDisposable
	{
        uint[] handle;

        private static bool IsPowerOf2(int i)
        {
            return (i&(i-1))==0;
        }

		public Texture(string fname)
		{
            int maxsize;
            GL.glGetIntegerv(GL.GL_MAX_TEXTURE_SIZE,out maxsize);

            Bitmap bmp=new Bitmap(fname);
            int w=1,h=1;
            while ((w<<=1)<bmp.Width);
            while ((h<<=1)<bmp.Height);
            if (w>maxsize) w=maxsize;
            if (h>maxsize) h=maxsize;

            if (w!=bmp.Width && h!=bmp.Height)
                bmp=new Bitmap(bmp,w,h);

            BitmapData bi=bmp.LockBits(new Rectangle(0,0,bmp.Width,bmp.Height),ImageLockMode.ReadOnly,PixelFormat.Format32bppArgb);

            handle=new uint[1];
            glGenTextures(1,handle);
            glBindTexture(GL_TEXTURE_2D,handle[0]);
            glTexImage2D(GL_TEXTURE_2D,0,3,bmp.Width,bmp.Height,0,GL_BGRA,GL_UNSIGNED_BYTE,bi.Scan0);
            glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_NEAREST);
            glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_NEAREST); // no mipmapping
		}

        public void Bind()
        {
            glBindTexture(GL_TEXTURE_2D,handle[0]);
        }

        public uint Handle { get { return handle[0]; } }

        public void Dispose()
        {
            if (handle!=null)
                glDeleteTextures(1,handle);
            handle=null;
        }
	}

    public class Tex1D : GL,IDisposable
    {
        uint[] handle;

        public Tex1D()
        {
            byte[] pixels=new Byte[32*3];
            int i=0;
            
            // cell shading texture thingo
            // a literal array would be too much work
            while (i<3) pixels[i++]=32;
            while (i<33) pixels[i++]=128;
            while (i<32*3) pixels[i++]=255;

            handle=new uint[1];
            glGenTextures(1,handle);
            glBindTexture(GL_TEXTURE_1D,handle[0]);
            glTexImage1D(GL_TEXTURE_1D,0,3,32,0,GL_RGB,GL_UNSIGNED_BYTE,pixels);
            glTexParameteri(GL_TEXTURE_1D,GL_TEXTURE_MIN_FILTER,GL_NEAREST);
            glTexParameteri(GL_TEXTURE_1D,GL_TEXTURE_MAG_FILTER,GL_NEAREST); // no mipmap
        }

        public void Bind()
        {
            glBindTexture(GL_TEXTURE_1D,handle[0]);
        }

        public uint Handle { get { return handle[0]; } }

        public void Dispose()
        {
            if (handle!=null)
                glDeleteTextures(1,handle);
            handle=null;
        }
    }
}
