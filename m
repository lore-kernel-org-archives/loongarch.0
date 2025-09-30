Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CED1E1E04
	for <loongarch@lists.linux.dev>; Tue, 30 Sep 2025 03:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759201660; cv=none; b=TrcvFShPabOlIAHk8DujFMLVrClwiaTBY8vEW0aX8jcg6Fvf2Fb7iea37TSFhl/aVIBpYaYN+6/yJajs2R0/Jj+BQsmrcoevjzWC70oOZQbWjOlJxCQpTGnwaULW1oHamUAJTEugB7Mjs2crA8oAC0Ezh7X6Vmw3Uc1SV9/bZS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759201660; c=relaxed/simple;
	bh=trQzuaxM7PQI3lc7+SrnpL4ChZ2FG1z0MjB3OtsDT/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R9Mkw2kfUF9FE+t/DGFbYLAEzhsmDs/1IlEsMI5/gVB4dFwTW6HktJoZ31vmlLVUMLHRCpGW5exRZNlGFsiPS+sVrBjEIompkdw8iLvPcMpdcLj360LnjOyzZfdoqqrLDBxNxGmbcN9TVtkOGLmYURB3SpbAZCGuscdMIHTfgsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQfw6lux; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQfw6lux"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-62fb48315ddso9789971a12.2
        for <loongarch@lists.linux.dev>; Mon, 29 Sep 2025 20:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759201657; x=1759806457; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cP8Qg3pgdasQQeaKIyYbB5fXWml1kh5kpaGwLIEk0T8=;
        b=nQfw6luxYIiV6y70Ap+dLIdSLNp5l2v2lf73j6qEiEN6P001zW0otTH1TWfNpqSCwW
         S0yU0d1kv3rlVQLZYVPEH15w65gNxeHA0sfXjGj2A2VD0St/PeH4ykMneJYRsGPEfNR/
         M7lIplVtI2JEpjTp3ybHHJkAGG3XBGXgCiFRmWDkgRvRd3Iir7e8z/4JBbym0FdG8mHS
         ALun2jIxA7FrapSoH5R83oZlfiEpetBBt5jpwfKigVb+B47viJ90xuGdYuZTCJLPdFGd
         csLWIVTWBvmzwziivTPZABWGjp2bnKirXm+HAhOJ7n/MJq1UC1Ohi1bNz6RUQ6tnJvbj
         noUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759201657; x=1759806457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cP8Qg3pgdasQQeaKIyYbB5fXWml1kh5kpaGwLIEk0T8=;
        b=WuS5gy/hOsuBdru+UFobElTBNVC+e0MTZoB9059Up3Logzz9CkRrGf9ZeqqHLHhxF+
         QZTEV5KCspL4lH4v0uVCKp+K4ZWHFF9pC1kEHPWxBho46wRc53aIZbgcuiZydMUt6NS9
         rSZrl63uLXc1DnOCTu+9SDSz8yoE3GfKVxrN5Zi+nvRHq4mTSZkbJmN76DXtoeCRaM3c
         BjIm9gn7+Its9ThECbGqJ3ItvV4mJhGS0+Uyh86/T86uccQqPAQKwJz5P+uYdnbPXdvI
         CyzUZFX7iHxfTa3WiQe/z697aUs9XBwBRnBynZRbdVF8le54xF+MqCWeKJSvh+A9hmxl
         G+9g==
X-Forwarded-Encrypted: i=1; AJvYcCWbfoSSFAUFj6Wfh/MzVmIE8y99OX+3iu6YsW+lg/7TT+bppTBYIu5ksuNkgWsBCAZ3Now6OWxRb34=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4ms0yAHz1DoPX70tnd+riZJJ6/nbCPQFt7yM9goY8sZHzsacm
	rwjhfFLhq5WgIcRBi0jPnWCb6gJ6+Ix6aILWqGvnCy948yRjLKSoRICzOArb1azE7aIpFDw1tRa
	9x00oYULOS1H1T2cN/3cfqb27gEikafY=
X-Gm-Gg: ASbGnct50FW2H+8ZbIKmhAf4VYkr18scvyZJp+RHQbURP1TRvksTqORUQbQ5neqQGbP
	6o6v8on0wzquWTGfhsX8xy2qcVa104D6v+YeDplvw915/8YYAYtHlnB1iSSnbE25XKoU2y457Cx
	VSUChc0iBj2DoCWGr7YbZ87Ku4S2cKyf72+4RYzXAlnmo58nrVVoy/DCertEu9WkUK6jCT23oRW
	hvC/SzPMB4le+YmCMFkUPAJI5pu0qTDDhnO4SMT3xjw
X-Google-Smtp-Source: AGHT+IEN648vI6Hm5m9/RNBdn/c6BTF3t50WrblnPLPcU3GBbVZCvpdfAA56AdTbz+ybr1l29cbfpXFz2yx0RQiYjaE=
X-Received: by 2002:a17:906:c103:b0:b45:44f4:30e1 with SMTP id
 a640c23a62f3a-b4544f479e0mr28136366b.34.1759201656713; Mon, 29 Sep 2025
 20:07:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1758676290.git.zhoubinbin@loongson.cn> <9823e7afe713450e210dab9dba6fa18683dc1fe0.1758676290.git.zhoubinbin@loongson.cn>
 <a985f144-7489-4a99-bcb7-90e7b21d9885@kernel.org>
In-Reply-To: <a985f144-7489-4a99-bcb7-90e7b21d9885@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 30 Sep 2025 11:07:24 +0800
X-Gm-Features: AS18NWDRGIX8ccYnyCzkTicMCR8HLLJvmhoh5wlIK_KmTb0hEwHglsNxtMS1qtU
Message-ID: <CAMpQs4Kpcb5n0g=cH6_RPnjvcwPQ0k0Obcc6c8j6yMxg3THp+w@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] serial: 8250: Add Loongson uart driver support
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Haowei Zheng <zhenghaowei@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jiri:

Thanks for your review.

On Mon, Sep 29, 2025 at 2:27=E2=80=AFPM Jiri Slaby <jirislaby@kernel.org> w=
rote:
>
> On 24. 09. 25, 8:29, Binbin Zhou wrote:
> > Add the driver for on-chip UART used on Loongson family chips.
> >
> > The hardware is similar to 8250, but there are the following
> > differences:
> >   - Some chips (such as Loongson-2K2000) have added a fractional divisi=
on
> >     register to obtain the required baud rate accurately, so the
> >     {get,set}_divisor callback is overridden.
> >   - Due to hardware defects, quirk handling is required for
> >     UART_MCR/UART_MSR.
>
> So how hard would be to implement this in 8250 using existing (or new)
> callbacks+quirks?

Initially, we attempted to directly add Loongson UART support to the
existing 8250 driver. The critical section is as follows:

diff --git a/drivers/tty/serial/8250/8250_port.c
b/drivers/tty/serial/8250/8250_port.c
index aa4de6907f77..6754f496a95c 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -395,14 +404,36 @@ static void hub6_serial_out(struct uart_port *p,
int offset, int value)
        outb(value, p->iobase + 1);
 }

 static unsigned int mem_serial_in(struct uart_port *p, int offset)
 {
+       unsigned int val, offset0 =3D offset;
        offset =3D offset << p->regshift;
-       return readb(p->membase + offset);
+       val =3D readb(p->membase + offset);
+       if (p->type =3D=3D PORT_LOONGSON)
+               val =3D serial_in_fixup(p, offset0, val);
+       return val;
 }

 static void mem_serial_out(struct uart_port *p, int offset, int value)
 {
+       if (p->type =3D=3D PORT_LOONGSON)
+               value =3D serial_out_fixup(p, offset, value);
        offset =3D offset << p->regshift;
        writeb(value, p->membase + offset);
 }

This made the code difficult to read, so I concluded it was not a good
solution. Therefore, I separated it into a standalone driver.

>
> > --- /dev/null
> > +++ b/drivers/tty/serial/8250/8250_loongson.c
> > @@ -0,0 +1,202 @@
> ...
> > +struct loongson_uart_data {
> > +     int line;
> > +     int mcr_invert;
> > +     int msr_invert;
>
> These two should be unsigned. They should be u8, actually.

OK....
>
> > +     struct reset_control *rst;
> > +};
> > +
> > +static unsigned int serial_fixup(struct uart_port *p, unsigned int off=
set, unsigned int val)
>
> Both 'val' and ret type should be u8.

OK... I will check twice.
>
> > +{
> > +     struct loongson_uart_data *ddata =3D p->private_data;
> > +
> > +     if (offset =3D=3D UART_MCR)
> > +             val ^=3D ddata->mcr_invert;
> > +
> > +     if (offset =3D=3D UART_MSR)
> > +             val ^=3D ddata->msr_invert;
> > +
> > +     return val;
> > +}
> > +
> > +static u32 loongson_serial_in(struct uart_port *p, unsigned int offset=
)
> > +{
> > +     unsigned int val;
>
> u8
>
> > +
> > +     val =3D readb(p->membase + (offset << p->regshift));
> > +
> > +     return serial_fixup(p, offset, val);
> > +}
>
> thanks,
> --
> js
> suse labs


--
Thanks.
Binbin
