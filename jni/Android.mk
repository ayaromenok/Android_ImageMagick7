IMAGE_MAGICK		:= ImageMagick-7.0.5-2/
JPEG_SRC_PATH 		:= jpeg-9b/
PNG_SRC_PATH 		:= libpng-1.5.28/

LOCAL_PATH := $(call my-dir)

#libjpeg +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
include $(CLEAR_VARS)

LOCAL_MODULE := libjpeg
LOCAL_MODULE_FILENAME := libjpegobj

LOCAL_C_INCLUDES  :=  \
	${JPEG_SRC_PATH} 

LOCAL_SRC_FILES := \
        ${JPEG_SRC_PATH}jcapimin.c ${JPEG_SRC_PATH}jcapistd.c ${JPEG_SRC_PATH}jccoefct.c ${JPEG_SRC_PATH}jccolor.c ${JPEG_SRC_PATH}jcdctmgr.c ${JPEG_SRC_PATH}jchuff.c \
        ${JPEG_SRC_PATH}jcinit.c ${JPEG_SRC_PATH}jcmainct.c ${JPEG_SRC_PATH}jcmarker.c ${JPEG_SRC_PATH}jcmaster.c ${JPEG_SRC_PATH}jcomapi.c ${JPEG_SRC_PATH}jcparam.c \
        ${JPEG_SRC_PATH}jcprepct.c ${JPEG_SRC_PATH}jcsample.c ${JPEG_SRC_PATH}jctrans.c ${JPEG_SRC_PATH}jdapimin.c ${JPEG_SRC_PATH}jdapistd.c \
        ${JPEG_SRC_PATH}jdatadst.c ${JPEG_SRC_PATH}jdatasrc.c ${JPEG_SRC_PATH}jdcoefct.c ${JPEG_SRC_PATH}jdcolor.c ${JPEG_SRC_PATH}jddctmgr.c ${JPEG_SRC_PATH}jdhuff.c \
        ${JPEG_SRC_PATH}jdinput.c ${JPEG_SRC_PATH}jdmainct.c ${JPEG_SRC_PATH}jdmarker.c ${JPEG_SRC_PATH}jdmaster.c ${JPEG_SRC_PATH}jdmerge.c \
        ${JPEG_SRC_PATH}jdpostct.c ${JPEG_SRC_PATH}jdsample.c ${JPEG_SRC_PATH}jdtrans.c ${JPEG_SRC_PATH}jerror.c ${JPEG_SRC_PATH}jfdctflt.c ${JPEG_SRC_PATH}jfdctfst.c \
        ${JPEG_SRC_PATH}jfdctint.c ${JPEG_SRC_PATH}jidctflt.c ${JPEG_SRC_PATH}jidctfst.c ${JPEG_SRC_PATH}jidctint.c ${JPEG_SRC_PATH}jquant1.c \
        ${JPEG_SRC_PATH}jquant2.c ${JPEG_SRC_PATH}jutils.c ${JPEG_SRC_PATH}jmemmgr.c ${JPEG_SRC_PATH}jcarith.c ${JPEG_SRC_PATH}jdarith.c ${JPEG_SRC_PATH}jaricom.c \
        ${JPEG_SRC_PATH}jmemnobs.c
include $(BUILD_STATIC_LIBRARY)  
#libjpeg ---------------------------------------------------------------


#libpng ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
include $(CLEAR_VARS)

LOCAL_MODULE    := libpng
LOCAL_MODULE_FILENAME := libpngobj

LOCAL_C_INCLUDES  :=  \
	${PNG_SRC_PATH} \
		
LOCAL_SRC_FILES := \
	${PNG_SRC_PATH}pngerror.c \
	${PNG_SRC_PATH}pngwio.c \
	${PNG_SRC_PATH}pngwrite.c \
	${PNG_SRC_PATH}pngwutil.c \
	${PNG_SRC_PATH}pngwtran.c \
	${PNG_SRC_PATH}pngset.c \
	${PNG_SRC_PATH}pngtrans.c \
	${PNG_SRC_PATH}example.c \
	${PNG_SRC_PATH}png.c \
	${PNG_SRC_PATH}pngrtran.c \
	${PNG_SRC_PATH}pngmem.c \
	${PNG_SRC_PATH}pngpread.c \
	${PNG_SRC_PATH}pngrutil.c \
	${PNG_SRC_PATH}pngrio.c \
	${PNG_SRC_PATH}pngget.c \
	${PNG_SRC_PATH}pngread.c \
	
include $(BUILD_STATIC_LIBRARY)	
#libpng ----------------------------------------------------------------

#Image Magick dynamic +++++++++++++++++++++++++++++++++++++++++++++++++++
include $(CLEAR_VARS)

LOCAL_MODULE    := imagemagick

LOCAL_C_INCLUDES  :=  \
	$(IMAGE_MAGICK) \
	$(IMAGE_MAGICK)MagickCore \
	${PNG_SRC_PATH} \
	${JPEG_SRC_PATH} \


LOCAL_LDLIBS    := -L$(SYSROOT)/usr/lib -llog -lz

LOCAL_SRC_FILES := \
	$(IMAGE_MAGICK)coders/aai.c \
	$(IMAGE_MAGICK)coders/art.c \
	$(IMAGE_MAGICK)coders/avs.c \
	$(IMAGE_MAGICK)coders/bgr.c \
	$(IMAGE_MAGICK)coders/bmp.c \
	$(IMAGE_MAGICK)coders/braille.c \
	$(IMAGE_MAGICK)coders/cals.c \
	$(IMAGE_MAGICK)coders/caption.c \
	$(IMAGE_MAGICK)coders/cin.c \
	$(IMAGE_MAGICK)coders/cip.c \
	$(IMAGE_MAGICK)coders/clip.c \
	$(IMAGE_MAGICK)coders/clipboard.c \
	$(IMAGE_MAGICK)coders/cmyk.c \
	$(IMAGE_MAGICK)coders/cut.c \
	$(IMAGE_MAGICK)coders/dcm.c \
	$(IMAGE_MAGICK)coders/dds.c \
	$(IMAGE_MAGICK)coders/debug.c \
	$(IMAGE_MAGICK)coders/dib.c \
	$(IMAGE_MAGICK)coders/dng.c \
	$(IMAGE_MAGICK)coders/dps.c \
	$(IMAGE_MAGICK)coders/dpx.c \
	$(IMAGE_MAGICK)coders/emf.c \
	$(IMAGE_MAGICK)coders/ept.c \
	$(IMAGE_MAGICK)coders/exr.c \
	$(IMAGE_MAGICK)coders/fax.c \
	$(IMAGE_MAGICK)coders/fits.c \
	$(IMAGE_MAGICK)coders/fpx.c \
	$(IMAGE_MAGICK)coders/gif.c \
	$(IMAGE_MAGICK)coders/gradient.c \
	$(IMAGE_MAGICK)coders/gray.c \
	$(IMAGE_MAGICK)coders/hald.c \
	$(IMAGE_MAGICK)coders/hdr.c \
	$(IMAGE_MAGICK)coders/histogram.c \
	$(IMAGE_MAGICK)coders/hrz.c \
	$(IMAGE_MAGICK)coders/html.c \
	$(IMAGE_MAGICK)coders/icon.c \
	$(IMAGE_MAGICK)coders/info.c \
	$(IMAGE_MAGICK)coders/inline.c \
	$(IMAGE_MAGICK)coders/ipl.c \
	$(IMAGE_MAGICK)coders/jbig.c \
	$(IMAGE_MAGICK)coders/jp2.c \
	$(IMAGE_MAGICK)coders/jpeg.c \
	$(IMAGE_MAGICK)coders/label.c \
	$(IMAGE_MAGICK)coders/mac.c \
	$(IMAGE_MAGICK)coders/magick.c \
	$(IMAGE_MAGICK)coders/map.c \
	$(IMAGE_MAGICK)coders/mat.c \
	$(IMAGE_MAGICK)coders/matte.c \
	$(IMAGE_MAGICK)coders/meta.c \
	$(IMAGE_MAGICK)coders/mono.c \
	$(IMAGE_MAGICK)coders/mpc.c \
	$(IMAGE_MAGICK)coders/mpeg.c \
	$(IMAGE_MAGICK)coders/mpr.c \
	$(IMAGE_MAGICK)coders/msl.c \
	$(IMAGE_MAGICK)coders/mtv.c \
	$(IMAGE_MAGICK)coders/mvg.c \
	$(IMAGE_MAGICK)coders/null.c \
	$(IMAGE_MAGICK)coders/otb.c \
	$(IMAGE_MAGICK)coders/palm.c \
	$(IMAGE_MAGICK)coders/pattern.c \
	$(IMAGE_MAGICK)coders/pcd.c \
	$(IMAGE_MAGICK)coders/pcl.c \
	$(IMAGE_MAGICK)coders/pcx.c \
	$(IMAGE_MAGICK)coders/pdb.c \
	$(IMAGE_MAGICK)coders/pdf.c \
	$(IMAGE_MAGICK)coders/pes.c \
	$(IMAGE_MAGICK)coders/pict.c \
	$(IMAGE_MAGICK)coders/pix.c \
	$(IMAGE_MAGICK)coders/plasma.c \
	$(IMAGE_MAGICK)coders/png.c \
	$(IMAGE_MAGICK)coders/pnm.c \
	$(IMAGE_MAGICK)coders/ps.c \
	$(IMAGE_MAGICK)coders/ps2.c \
	$(IMAGE_MAGICK)coders/ps3.c \
	$(IMAGE_MAGICK)coders/psd.c \
	$(IMAGE_MAGICK)coders/pwp.c \
	$(IMAGE_MAGICK)coders/raw.c \
	$(IMAGE_MAGICK)coders/rgb.c \
	$(IMAGE_MAGICK)coders/rla.c \
	$(IMAGE_MAGICK)coders/rle.c \
	$(IMAGE_MAGICK)coders/scr.c \
	$(IMAGE_MAGICK)coders/sct.c \
	$(IMAGE_MAGICK)coders/sfw.c \
	$(IMAGE_MAGICK)coders/sgi.c \
	$(IMAGE_MAGICK)coders/stegano.c \
	$(IMAGE_MAGICK)coders/sun.c \
	$(IMAGE_MAGICK)coders/svg.c \
	$(IMAGE_MAGICK)coders/tga.c \
	$(IMAGE_MAGICK)coders/thumbnail.c \
	$(IMAGE_MAGICK)coders/tile.c \
	$(IMAGE_MAGICK)coders/tim.c \
	$(IMAGE_MAGICK)coders/ttf.c \
	$(IMAGE_MAGICK)coders/txt.c \
	$(IMAGE_MAGICK)coders/uil.c \
	$(IMAGE_MAGICK)coders/url.c \
	$(IMAGE_MAGICK)coders/uyvy.c \
	$(IMAGE_MAGICK)coders/vicar.c \
	$(IMAGE_MAGICK)coders/vid.c \
	$(IMAGE_MAGICK)coders/viff.c \
	$(IMAGE_MAGICK)coders/wbmp.c \
	$(IMAGE_MAGICK)coders/webp.c \
	$(IMAGE_MAGICK)coders/wmf.c \
	$(IMAGE_MAGICK)coders/wpg.c \
	$(IMAGE_MAGICK)coders/x.c \
	$(IMAGE_MAGICK)coders/xbm.c \
	$(IMAGE_MAGICK)coders/xc.c \
	$(IMAGE_MAGICK)coders/xcf.c \
	$(IMAGE_MAGICK)coders/xpm.c \
	$(IMAGE_MAGICK)coders/xps.c \
	$(IMAGE_MAGICK)coders/xwd.c \
	$(IMAGE_MAGICK)coders/ycbcr.c \
	$(IMAGE_MAGICK)coders/yuv.c \
	$(IMAGE_MAGICK)coders/djvu.c \
	$(IMAGE_MAGICK)coders/fd.c \
	$(IMAGE_MAGICK)coders/jnx.c \
	$(IMAGE_MAGICK)coders/json.c \
	$(IMAGE_MAGICK)coders/mask.c \
	$(IMAGE_MAGICK)coders/miff.c \
	$(IMAGE_MAGICK)coders/pango.c \
	$(IMAGE_MAGICK)coders/rgf.c \
	$(IMAGE_MAGICK)coders/screenshot.c \
	$(IMAGE_MAGICK)coders/sixel.c \
	$(IMAGE_MAGICK)coders/vips.c \
	$(IMAGE_MAGICK)coders/pgx.c \
	$(IMAGE_MAGICK)filters/analyze.c \
	$(IMAGE_MAGICK)MagickCore/accelerate.c \
	$(IMAGE_MAGICK)MagickCore/animate.c \
	$(IMAGE_MAGICK)MagickCore/annotate.c \
	$(IMAGE_MAGICK)MagickCore/artifact.c \
	$(IMAGE_MAGICK)MagickCore/attribute.c \
	$(IMAGE_MAGICK)MagickCore/blob.c \
	$(IMAGE_MAGICK)MagickCore/cache.c \
	$(IMAGE_MAGICK)MagickCore/cache-view.c \
	$(IMAGE_MAGICK)MagickCore/channel.c \
	$(IMAGE_MAGICK)MagickCore/cipher.c \
	$(IMAGE_MAGICK)MagickCore/client.c \
	$(IMAGE_MAGICK)MagickCore/coder.c \
	$(IMAGE_MAGICK)MagickCore/color.c \
	$(IMAGE_MAGICK)MagickCore/colormap.c \
	$(IMAGE_MAGICK)MagickCore/colorspace.c \
	$(IMAGE_MAGICK)MagickCore/compare.c \
	$(IMAGE_MAGICK)MagickCore/composite.c \
	$(IMAGE_MAGICK)MagickCore/compress.c \
	$(IMAGE_MAGICK)MagickCore/configure.c \
	$(IMAGE_MAGICK)MagickCore/constitute.c \
	$(IMAGE_MAGICK)MagickCore/decorate.c \
	$(IMAGE_MAGICK)MagickCore/delegate.c \
	$(IMAGE_MAGICK)MagickCore/deprecate.c \
	$(IMAGE_MAGICK)MagickCore/display.c \
	$(IMAGE_MAGICK)MagickCore/distort.c \
	$(IMAGE_MAGICK)MagickCore/distribute-cache.c \
	$(IMAGE_MAGICK)MagickCore/draw.c \
	$(IMAGE_MAGICK)MagickCore/effect.c \
	$(IMAGE_MAGICK)MagickCore/enhance.c \
	$(IMAGE_MAGICK)MagickCore/exception.c \
	$(IMAGE_MAGICK)MagickCore/feature.c \
	$(IMAGE_MAGICK)MagickCore/fourier.c \
	$(IMAGE_MAGICK)MagickCore/fx.c \
	$(IMAGE_MAGICK)MagickCore/gem.c \
	$(IMAGE_MAGICK)MagickCore/geometry.c \
	$(IMAGE_MAGICK)MagickCore/histogram.c \
	$(IMAGE_MAGICK)MagickCore/identify.c \
	$(IMAGE_MAGICK)MagickCore/image.c \
	$(IMAGE_MAGICK)MagickCore/image-view.c \
	$(IMAGE_MAGICK)MagickCore/layer.c \
	$(IMAGE_MAGICK)MagickCore/linked-list.c \
	$(IMAGE_MAGICK)MagickCore/list.c \
	$(IMAGE_MAGICK)MagickCore/locale.c \
	$(IMAGE_MAGICK)MagickCore/log.c \
	$(IMAGE_MAGICK)MagickCore/magic.c \
	$(IMAGE_MAGICK)MagickCore/magick.c \
	$(IMAGE_MAGICK)MagickCore/matrix.c \
	$(IMAGE_MAGICK)MagickCore/memory.c \
	$(IMAGE_MAGICK)MagickCore/mime.c \
	$(IMAGE_MAGICK)MagickCore/module.c \
	$(IMAGE_MAGICK)MagickCore/monitor.c \
	$(IMAGE_MAGICK)MagickCore/montage.c \
	$(IMAGE_MAGICK)MagickCore/morphology.c \
	$(IMAGE_MAGICK)MagickCore/nt-base.c \
	$(IMAGE_MAGICK)MagickCore/nt-feature.c \
	$(IMAGE_MAGICK)MagickCore/opencl.c \
	$(IMAGE_MAGICK)MagickCore/option.c \
	$(IMAGE_MAGICK)MagickCore/paint.c \
	$(IMAGE_MAGICK)MagickCore/pixel.c \
	$(IMAGE_MAGICK)MagickCore/policy.c \
	$(IMAGE_MAGICK)MagickCore/prepress.c \
	$(IMAGE_MAGICK)MagickCore/profile.c \
	$(IMAGE_MAGICK)MagickCore/property.c \
	$(IMAGE_MAGICK)MagickCore/quantize.c \
	$(IMAGE_MAGICK)MagickCore/quantum.c \
	$(IMAGE_MAGICK)MagickCore/quantum-export.c \
	$(IMAGE_MAGICK)MagickCore/quantum-import.c \
	$(IMAGE_MAGICK)MagickCore/random.c \
	$(IMAGE_MAGICK)MagickCore/registry.c \
	$(IMAGE_MAGICK)MagickCore/resample.c \
	$(IMAGE_MAGICK)MagickCore/resize.c \
	$(IMAGE_MAGICK)MagickCore/resource.c \
	$(IMAGE_MAGICK)MagickCore/segment.c \
	$(IMAGE_MAGICK)MagickCore/semaphore.c \
	$(IMAGE_MAGICK)MagickCore/shear.c \
	$(IMAGE_MAGICK)MagickCore/signature.c \
	$(IMAGE_MAGICK)MagickCore/splay-tree.c \
	$(IMAGE_MAGICK)MagickCore/static.c \
	$(IMAGE_MAGICK)MagickCore/statistic.c \
	$(IMAGE_MAGICK)MagickCore/stream.c \
	$(IMAGE_MAGICK)MagickCore/string.c \
	$(IMAGE_MAGICK)MagickCore/thread.c \
	$(IMAGE_MAGICK)MagickCore/threshold.c \
	$(IMAGE_MAGICK)MagickCore/timer.c \
	$(IMAGE_MAGICK)MagickCore/token.c \
	$(IMAGE_MAGICK)MagickCore/transform.c \
	$(IMAGE_MAGICK)MagickCore/type.c \
	$(IMAGE_MAGICK)MagickCore/utility.c \
	$(IMAGE_MAGICK)MagickCore/version.c \
	$(IMAGE_MAGICK)MagickCore/vision.c \
	$(IMAGE_MAGICK)MagickCore/widget.c \
	$(IMAGE_MAGICK)MagickCore/xml-tree.c \
	$(IMAGE_MAGICK)MagickCore/xwindow.c \

LOCAL_STATIC_LIBRARIES := \
    libpng \
    libjpeg \

#include $(BUILD_STATIC_LIBRARY)
include $(BUILD_SHARED_LIBRARY)
#Image Magick dynamic --------------------------------------------------
