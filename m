Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD1F1847
	for <loongarch@lists.linux.dev>; Fri, 30 Dec 2022 01:46:39 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id u9so48733187ejo.0
        for <loongarch@lists.linux.dev>; Thu, 29 Dec 2022 17:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7Nd5KWlnignm+0+n2z7O9ah6tkWyMYwpWMBck0sxN0A=;
        b=UBh6DQ3LnsgZCcP5QZTRQjAGjfLPvbVMkJe+77jq+NbhA5iI9AeROZZKuzhsdlis/1
         qx4vqVFCIsO56/AZw/I1PyIwF07PBnrNy2/SodAQz9c+iRl7rn9/VeFL5Bkb/gYAJsoq
         Q8I3gpXI2zUI8rpyTjdUesWSa0skVRSxHJTAEkgUx3o6hiNcwac5IgyfeAOel6dw4pt7
         x6Z8dJkblUFGYRbPqI6zr3ClW+LzH8CWSLmNGD7mTsJXgrVq0fnkxcM6JAYvrZWXOHMU
         mQbm75OsjXc+rDkvvQcCKsGyTBNEKrnu7oc/UiqctdCOQxp8u0FaU8ziIJVXmCzjqa83
         7xLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Nd5KWlnignm+0+n2z7O9ah6tkWyMYwpWMBck0sxN0A=;
        b=7bimGqO2ubp4qb6RwYcVvFZxmxf95kzRk78CQSvb/MvBqJckfm3e1ud/okvaGvFeyT
         wsGX64rtXGsSEqCZ2PHcYkqyxQ90nXUdJ2COwjERz6BVhJljZmPADbzozkb2RGwcJI+f
         Sx/yFDh/NGOWQ/2wGvtqpphxQvxHizTQ1WFswHr2YzVGWdhrf0u88r5Ji9QIlwCOb/eX
         Gyu+bwGz1EKSUpe/XZcRVgGECYLnxqp9FICsV+IaX16SPpfSFVXEkJGZegdOMN4gXhNi
         PE4djO8tdPfsTv3cNTHaMJ4xtdF+CPFdlLeTAOt+Fprx+H4+y/PnXlBwxO8bgMyoeKz5
         5ncg==
X-Gm-Message-State: AFqh2kqAIUXNNP7ALZkVQnCVMZeC8BhGuWwHMlc15/TSoNvkPJxZOIW2
	ZXjLoziQNugznuKTEGegNjRrX8vu+xHJTJSm3MM=
X-Google-Smtp-Source: AMrXdXuLkYMGrJmoMhSV4WH1S4MTCKUn8MsLYEyKBOGp5AegSfK9UbrQ/I9T0tFn3JFG1tmN33K/nVGejBFfuAesadU=
X-Received: by 2002:a17:906:694e:b0:82d:18e3:3de8 with SMTP id
 c14-20020a170906694e00b0082d18e33de8mr4038618ejs.602.1672364797911; Thu, 29
 Dec 2022 17:46:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1671688961.git.zhoubinbin@loongson.cn> <9d3e4997519fd9ecebae6fd241148cc22d3fe04f.1671688961.git.zhoubinbin@loongson.cn>
 <Y6tqPenv3NBEl9qD@smile.fi.intel.com> <CAMpQs4L-2stVQA43hd2Q-uR8fgekLZJmWzmBZvEDg1+AvT3uSQ@mail.gmail.com>
 <Y61bwY4OpRFixx5r@smile.fi.intel.com> <Y61chbeq9bo8bi7p@smile.fi.intel.com>
In-Reply-To: <Y61chbeq9bo8bi7p@smile.fi.intel.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 30 Dec 2022 09:46:25 +0800
Message-ID: <CAMpQs4LK5xmG2467csM=C5a1EAg8pFkqj=0OwSYL4rcO+8eFHA@mail.gmail.com>
Subject: Re: [PATCH V8 3/4] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C controller
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

On Thu, Dec 29, 2022 at 5:23 PM Andy Shevchenko <andy@kernel.org> wrote:
>
> On Thu, Dec 29, 2022 at 11:20:01AM +0200, Andy Shevchenko wrote:
> > On Thu, Dec 29, 2022 at 03:31:47PM +0800, Binbin Zhou wrote:
> > > On Wed, Dec 28, 2022 at 5:57 AM Andy Shevchenko <andy@kernel.org> wrote:
> > > > On Fri, Dec 23, 2022 at 05:00:51PM +0800, Binbin Zhou wrote:
>
> ...
>
> > > > > +static int ls2x_i2c_xfer_one(struct ls2x_i2c_priv *priv,
> > > > > +                          struct i2c_msg *msg, bool stop)
> > > > > +{
> > > > > +     int ret;
> > > > > +     bool is_read = msg->flags & I2C_M_RD;
> > > > > +
> > > > > +     /* Contains steps to send start condition and address */
> > > > > +     ret = ls2x_i2c_start(priv, msg);
> > > > > +     if (!ret) {
> > > > > +             if (is_read)
> > > > > +                     ret = ls2x_i2c_rx(priv, msg->buf, msg->len);
> > > > > +             else
> > > > > +                     ret = ls2x_i2c_tx(priv, msg->buf, msg->len);
> > > > > +
> > > > > +             if (!ret && stop)
> > > > > +                     ret = ls2x_i2c_stop(priv);
> > > > > +     }
> > > > > +
> > > > > +     if (ret == -ENXIO)
> > > > > +             ls2x_i2c_stop(priv);
> > > > > +     else if (ret < 0)
> > > > > +             ls2x_i2c_init(priv);
> > > > > +
> > > > > +     return ret;
> > > > > +}
> > > >
> > > > Still this code is odd from reader's perspective. It's in particular not clear
> > > > if the stop can be called twice in a row. I recommend to split it to two
> > >
> > > Sorry,
> > > Actually, I don't quite understand why you keep thinking that the stop
> > > can be called twice in a row.
> >
> > Because nothing in the code suggests otherwise. You need deeply understand
> > the flow to ensure that it won't. This means that the code is fragile and
> > needs refactoring (even comment, which you can do a least won't help, because
> > changing code in the other parts may break all this and you won't notice it).
> >
> > > As I said in my last email, the logic here should be:
> > > In the first case, stop is called when the last msg is transmitted successfully;
> > > In the second case, stop is called when there is a NOACK during the
> > > transmission;
> > > In the third case, init is called when other errors occur during the
> > > transmission, such as TIMEOUT.
> > >
> > > The key pointer is the stop function will only return a TIMEOUT error
> > > or 0 for success, so if the stop function above is failed, the stop
> > > function below will never be called twice.
> > >
> > > Anyway, I also admit that this part of the code may not be concise and
> > > clear enough, and I have tried the following changes:
> > >
> > > 1. put the start function into the rx/tx function respectively. As followers:
> > >
> > > @@ -177,10 +177,16 @@ static int ls2x_i2c_start(struct ls2x_i2c_priv
> > > *priv, struct i2c_msg *msgs)
> > >         return ls2x_i2c_send_byte(priv, LS2X_CR_START | LS2X_CR_WRITE);
> > >  }
> > >
> > > -static int ls2x_i2c_rx(struct ls2x_i2c_priv *priv, u8 *buf, u16 len)
> > > +static int ls2x_i2c_rx(struct ls2x_i2c_priv *priv, struct i2c_msg *msg)
> > >  {
> > >         int ret;
> > > -       u8 rxdata;
> > > +       u8 rxdata, *buf = msg->buf;
> > > +       u16 len = msg->len;
> > > +
> > > +       /* Contains steps to send start condition and address */
> > > +       ret = ls2x_i2c_start(priv, msg);
> > > +       if (ret)
> > > +               return ret;
> > >
> > >         while (len--) {
> > >                 ret = ls2x_i2c_xfer_byte(priv,
> > > @@ -195,9 +201,16 @@ static int ls2x_i2c_rx(struct ls2x_i2c_priv
> > > *priv, u8 *buf, u16 len)
> > >         return 0;
> > >  }
> > >
> > > -static int ls2x_i2c_tx(struct ls2x_i2c_priv *priv, u8 *buf, u16 len)
> > > +static int ls2x_i2c_tx(struct ls2x_i2c_priv *priv, struct i2c_msg *msg)
> > >  {
> > >         int ret;
> > > +       u8 *buf = msg->buf;
> > > +       u16 len = msg->len;
> > > +
> > > +       /* Contains steps to send start condition and address */
> > > +       ret = ls2x_i2c_start(priv, msg);
> > > +       if (ret)
> > > +               return ret;
> > >
> > >         while (len--) {
> > >                 writeb(*buf++, priv->base + I2C_LS2X_TXR);
> > >
> > > 2. define the variable 'reinit' in the xfer_one function to mark the
> > > cases where reinit is needed. As follows:
> > >
> > > static int ls2x_i2c_xfer_one(struct ls2x_i2c_priv *priv,
> > >                              struct i2c_msg *msg, bool stop)
> > > {
> > >         int ret, ret2;
> > >         bool reinit = false;
> > >         bool is_read = msg->flags & I2C_M_RD;
> > >
> > >         if (is_read)
> > >                 ret = ls2x_i2c_rx(priv, msg);
> > >         else
> > >                 ret = ls2x_i2c_tx(priv, msg);
> > >
> > >         if (ret == -EAGAIN) /* could not acquire bus. bail out without STOP */
> > >                 return ret;
> > >
> > >         if (ret == -ETIMEDOUT) {
> > >                 /* Fatal error. Needs reinit. */
> > >                 stop = false;
> > >                 reinit = true;
>
> Why do you need to initialize stop here?
> Why not to call reinit here and bailout?
>
> > >         }
> > >
> > >         if (stop) {
> > >                 ret2 = ls2x_i2c_stop(priv);
> > >
> > >                 if (ret2) {
> > >                         /* Failed to issue STOP. Needs reinit. */
> > >                         reinit = true;
> > >                         ret = ret ?: ret2;
>
> All the same, try to be less verbose with unneeded variables.

Ok, the reinit and ret2 variables seem to be a bit redundant, I will
remove them.

 I will divide the whole thing into two parts:
The first part is to handle errors: if ret < 0, return ret directly.
One of the special handling is the fatal error timeout, which requires
reinit.

        if (ret < 0) {
                if (ret == -ETIMEDOUT) /* Fatel error. Needs reinit. */
                        ls2x_i2c_init(priv);
                return ret;
        }

The second part is to handle the final stop command: it should be
noted that if the stop command fails, reinit is also required.

        if (stop) {
                /* Failed to issue STOP. Needs reinit. */
                ret = ls2x_i2c_stop(priv);
                if (ret)
                        ls2x_i2c_init(priv);
        }

The complete code is as follows:

static int ls2x_i2c_xfer_one(struct ls2x_i2c_priv *priv,
                             struct i2c_msg *msg, bool stop)
{
        int ret;
        bool is_read = msg->flags & I2C_M_RD;

        if (is_read)
                ret = ls2x_i2c_rx(priv, msg);
        else
                ret = ls2x_i2c_tx(priv, msg);

        if (ret < 0) {
                if (ret == -ETIMEDOUT) /* Fatel error. Needs reinit. */
                        ls2x_i2c_init(priv);
                return ret;
        }

        if (stop) {
                /* Failed to issue STOP. Needs reinit. */
                ret = ls2x_i2c_stop(priv);
                if (ret)
                        ls2x_i2c_init(priv);
        }

        return ret;
}

Do you think this is better?

Thanks.
Binbin


>
> > >                 }
> > >         }
> > >
> > >         if (reinit)
> > >                 ls2x_i2c_init(priv);
> > >
> > >         return ret;
> > > }
> > >
> > > Do you think this is better?
> >
> > Slightly, but still twisted at the end with the play of error codes. Try to
> > make it even more clear.
> >
> > > > functions and then do something like
> > > >
> > > > _read_one()
> > > > {
> > > >         ret = start();
> > > >         if (ret)
> > > >                 goto _stop; // Do we really need this?
> > > >
> > > >                 ret = rx();
> > > >                 if (ret)
> > > >                         goto _stop; // Do we need this?
> > > >
> > > >                 /* By setting this call the stop */
> > > >                 if (stop)
> > > >                         ret = -ENXIO;
> > > >
> > > >         out_send_stop:
> > > >                 if (ret == ...)
> > > >                         return _stop();
> > > >                 // I don't like above, so this error checking/setting parts
> > > >                 // also can be rethought and refactored accordingly
> > > >
> > > >                 return ret;
> > > > }
> > > >
> > > >
> > > >         if (is_read)
> > > >                 ret = _read_one();
> > > >         else
> > > >                 ret = _write_one();
> > > >
> > > >         if (ret)
> > > >                 _init();
> > > >
> > > >         return ret;
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
