Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4609A7E
	for <loongarch@lists.linux.dev>; Tue, 20 Dec 2022 11:47:39 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id r26so17078054edc.10
        for <loongarch@lists.linux.dev>; Tue, 20 Dec 2022 03:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ANkEK2a22lW9dvnfGLj43UaNRf7fTpTnz2/IWWrYDOs=;
        b=KVCjN75cRfFGrEPvEcfVZIGGUOsWCkCb2AGrSnmF8oJivAG5eTgz0asihcnf4PSQwn
         VDisB7cx9lvP7fPzIdIbB2Cec7j5Gm+dWFsVhyrF1mz4o6TlpSSoUml/Vu6X3QWXzk+e
         9Z/2VbplFdrZehsUhiVr4u7sQEAhLA7IKP+jxEwG2LAOzbztYzB47VQtv8g7LMFaAYBi
         9z2W851SR5i1JjpBj+I9Xhh4yGlOcK6hlQOfCAywaF2qm/IztMIGoed8JW2c8MG+Anba
         zFYlp2QpR/7J22wHq/2DWn5WAsqzNbBWATLqcWftVq4WPBdqkslHUMQ9EAGjJDUUL7b/
         vNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ANkEK2a22lW9dvnfGLj43UaNRf7fTpTnz2/IWWrYDOs=;
        b=swEXmabUpHdOOF3ZjNWuGt179QyIJH26IzZJdb2P/dOw1nK0s8dwkD/8LT9qUyvLPo
         mVgKKjLoP+hXArsrDWVwf0irpuKJTJuKw1JkYoh+0RqloTIr8ZrbGP+qH4kqOdabGI+n
         Mno3sZ2TekNTb1E4v8vNjXVSRbMQZIeHLHkA83OPIWEy9Rf+yocvJbcNIE50M4RE50vn
         m2XJ0r9ihHpG//YSVWJLiqNhfksDHZGFwrvYjZc0gLtrapkyJLo6RwlCPcJisglsWjHB
         EwFwf38lZvdyoRPGHtzVUqdMDLdJjGGxLqHQz002TcAjRwfFnH7olUb/3//K6XkDm2n+
         xJ4w==
X-Gm-Message-State: ANoB5plqjwnECcNB8U/AnCrL7YwFa1RGnjXlUTpIdVaFNPJcxkwn7PPw
	RGEXiM3Pe7vWBbwcZIvgT+1UI5XWeCxPGyUb7YY=
X-Google-Smtp-Source: AA0mqf724aq1bzthh+2VkOkrFAK2VplBWViFLKo/lMUM/ifaqHW0JTdfQ8WYHiBqAmZXKuz8pzmsUF/HBaHH+/+G23Q=
X-Received: by 2002:aa7:d34b:0:b0:46a:914c:9bc9 with SMTP id
 m11-20020aa7d34b000000b0046a914c9bc9mr59925861edr.418.1671536857368; Tue, 20
 Dec 2022 03:47:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1671451604.git.zhoubinbin@loongson.cn> <d44eb07245020431f98fd08e0c05b6926fb31b24.1671451604.git.zhoubinbin@loongson.cn>
 <Y6BhRsPAU30Dqbdv@smile.fi.intel.com>
In-Reply-To: <Y6BhRsPAU30Dqbdv@smile.fi.intel.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 20 Dec 2022 19:47:25 +0800
Message-ID: <CAMpQs4KcskSZdezVdNk9Q8UFYA3rFJm8CguiTRLdmffqkZ9FCg@mail.gmail.com>
Subject: Re: [PATCH V7 3/4] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C controller
To: Andy Shevchenko <andy@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Wolfram Sang <wsa@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, linux-i2c@vger.kernel.org, 
	loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	Huacai Chen <chenhuacai@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jianmin Lv <lvjianmin@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

Hi Andy:

On Mon, Dec 19, 2022 at 9:04 PM Andy Shevchenko <andy@kernel.org> wrote:
>
> On Mon, Dec 19, 2022 at 08:28:33PM +0800, Binbin Zhou wrote:
> > This I2C module is integrated into the Loongson-2K SoCs and Loongson
> > LS7A bridge chip.
>
> Almost there, see my comments below (note, you have ~1w of time before this
> can be applied anyway, so take you time for carefully addressing comments,
> (re-)testing, etc.).
>
> ...
>
> > @@ -888,6 +888,17 @@ config I2C_OWL
> >         Say Y here if you want to use the I2C bus controller on
> >         the Actions Semiconductor Owl SoC's.
> >
> > +config I2C_LS2X
>
> I believe in Latin alphabet L goes before O...

Sorry, I will fix it.

>
> > +     tristate "Loongson LS2X I2C adapter"
> > +     depends on MACH_LOONGSON64 || COMPILE_TEST
> > +     help
> > +       If you say yes to this option, support will be included for the
> > +       I2C interface on the Loongson-2K SoCs and Loongson LS7A bridge
> > +       chip.
> > +
> > +       This driver can also be built as a module. If so, the module
> > +       will be called i2c-ls2x.
> > +
> >  config I2C_PASEMI
> >       tristate "PA Semi SMBus interface"
> >       depends on PPC_PASEMI && PCI
>
> ...
>
> >  obj-$(CONFIG_I2C_MXS)                += i2c-mxs.o
> >  obj-$(CONFIG_I2C_NOMADIK)    += i2c-nomadik.o
> >  obj-$(CONFIG_I2C_NPCM)               += i2c-npcm7xx.o
> > +obj-$(CONFIG_I2C_LS2X)               += i2c-ls2x.o
>
> ...and even before n and m.
>
> >  obj-$(CONFIG_I2C_OCORES)     += i2c-ocores.o
> >  obj-$(CONFIG_I2C_OMAP)               += i2c-omap.o
> >  obj-$(CONFIG_I2C_OWL)                += i2c-owl.o
>
> ...
>
> > +static int ls2x_i2c_xfer_one(struct i2c_adapter *adap,
> > +                          struct i2c_msg *msg, bool stop)
> > +{
> > +     int ret;
> > +     bool is_read = msg->flags & I2C_M_RD;
> > +     struct ls2x_i2c_priv *priv = i2c_get_adapdata(adap);
> > +
> > +     /* Contains steps to send start condition and address */
> > +     ret = ls2x_i2c_start(adap, msg);
> > +     if (!ret) {
> > +             if (is_read)
> > +                     ret = ls2x_i2c_rx(adap, msg->buf, msg->len);
> > +             else
> > +                     ret = ls2x_i2c_tx(adap, msg->buf, msg->len);
>
> > +             if (!ret && stop)
> > +                     ret = ls2x_i2c_stop(adap);
>
> So, we will send stop here...
>
> > +     }
>
> > +     if (ret == -ENXIO)
> > +             ls2x_i2c_stop(adap);
>
> ...and if it fails, we send it again here. Is it okay?

First of all, I think the logic here is fine:
In the first case, stop is called when the last msg is transmitted successfully;
In the second case, stop is called when there is a NOACK during the
transmission;
In the third case, init is called when other errors occur during the
transmission, such as TIMEOUT.

The key point is that the current implementation of the stop function
is probably imperfect, it directly ignores the NOACK. The more
reasonable method would be to judge by LS2X_SR_BUSY(bus busy state).
The basic idea: if the i2c bus is detected as idle within the timeout
range of the stop command issued, the stop command is considered
successful, otherwise -ETIMEDOUT is returned.

As follows:
 static int ls2x_i2c_stop(struct i2c_adapter *adap)
 {
-       int ret = ls2x_i2c_send_byte(adap, LS2X_CR_STOP);
+       u8 value;
+       struct ls2x_i2c_priv *priv = i2c_get_adapdata(adap);

-       return (ret == -ENXIO) ? 0 : ret;
+       writeb(LS2X_CR_STOP, priv->base + I2C_LS2X_CR);
+       return readl_poll_timeout(priv->base + I2C_LS2X_SR,
+                                 value, !(value & LS2X_SR_BUSY),
+                                 100, jiffies_to_usecs(adap->timeout));
 }

Now, in the case you mentioned above, the last msg transmission is
completed and the stop command is sent. If the stop command fails, it
will only return -ETIMEDOUT and call ls2x_i2c_init().

Of course, I will use tools like i2c-tools to do more tests.

Thanks for the detailed review.

Binbin

>
> > +     else if (ret < 0)
> > +             ls2x_i2c_init(priv);
> > +
> > +     return ret;
> > +}
>
> ...
>
> > +             ret = ls2x_i2c_xfer_one(adap, msg, msg == (emsg - 1));
>
> Too many parentheses, isn't it?
>
> > +             if (ret)
> > +                     return ret;
>
> ...
>
> > +     r = devm_request_irq(dev, irq, ls2x_i2c_isr, IRQF_SHARED, "ls2x-i2c",
> > +                          priv);
>
> Everywhere else you use 'ret', why is 'r' here?


>
> > +     if (r < 0)
> > +             return dev_err_probe(dev, r, "Unable to request irq %d\n", irq);
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>
