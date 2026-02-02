Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319DC2F6582
	for <loongarch@lists.linux.dev>; Mon,  2 Feb 2026 06:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770014384; cv=pass; b=E9s+1T/YLIuF7qbu5IC6UflMFJN971bDZe7blT8wdR3HjmZtczcgEGp1NvXdVXIF5ZqtDnHA7jRPFodnC8G1owLmbaI5+6KZZjbAD8jOvZ/tYCjDQyR4KZhiSXz0dx23Jcacoi1OeCgJrsGjtF6TJtHKvz1+ULRosRULNoJpgBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770014384; c=relaxed/simple;
	bh=kkuvM7CJppS0pU/h0KzKixJfh04HhSPTu3S4mwLZ9mM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M9lXv63E7cBr/GLZVHPwg9THeBCTbMeRDXU4UISUjNaOtSJbh0mf/5OtRC5xvZDVxZxVDPA33uV0dTuM3xlRNrlJxcEj4JOhuwkzzjZJFEJ+rhXnYTk5vqpL0FaZ+9Lf+xZ+4eh3HHm9RQ1ui5gT6lRyqRp7U3eJaKXEduyNg3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SzKWouCG; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SzKWouCG"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b8e526081ceso108499966b.1
        for <loongarch@lists.linux.dev>; Sun, 01 Feb 2026 22:39:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770014381; cv=none;
        d=google.com; s=arc-20240605;
        b=giWvBRC7H9sKVcw1DGOqG8gudRwHHnYK02Xb/VQLksCWJq3gQRE9JmMv1MskMwFAxT
         rDwCxBz839Zb7a7cM73ahJ/FuVGu+6Ipg3kbXb7EKExhP067SVByrdGryB500/nGbUP0
         X//DYtUucfJL6mymlDmWAkdVB456rUQ4CibnpR1VX/10j9DzTrQfMz8Cvb3idKBWDcTB
         t552J0K6zGlpb2uVYzi0tRTVXkWF7cArjprKZhzs9C5HEnKx4s23O4FiSE0R3v1omCCm
         XuDAZAegvTLPWKe32rozRtu1hw82Kl3kwuujU6QKTQ1OBL0yOC1Zod9jztBwOrcq7Rux
         SQqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dE6334Db/8q+LVE4TPM0RlZCcc1UGZ7Evu81B8EwWuA=;
        fh=fULUS/Fltp1nWDiJK43IXiKgwBxH1XFSBjYEC7ElsoE=;
        b=TWQ9m31wWjUXRQ6sIJFIbo7UZ8Bf2N4/yoV2EEP5m/DZ0yHdJynulFMjT4IsigpcyV
         yxZ68pSiqamkNHkOZg9BmNzJaU26wxOlQbDUGctiffdI3eZl5stCHTfZj4+GEhZGsy6H
         TTyRnyPrsMuTAE57DwNm2KFtJnkeDsUL1y+BlND31uzWWKmy5c7XiNBsCFgjYUsnvb77
         8uKTPrp4Hnj5IYBVRwcGey9wWe5dxV/XHVb6I6puQPG0d1TpGDobWkKauSVxC+FiVOYR
         +JNFuZlcPTB4gp50wz4E6DtIKlqLXFs0Ktch1lRzHPwQo67Q+E5WxwClHLCLNO/67mp7
         A51w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770014381; x=1770619181; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dE6334Db/8q+LVE4TPM0RlZCcc1UGZ7Evu81B8EwWuA=;
        b=SzKWouCG2ZPP8rrbFxVY5RrMMmg1U5xQZNfaABSakxdVhsR8pX9R4FyFtwSlZCzJ0V
         W8UuYyOrjqy2Y5adTdEBOp5drWWyO8lI+o9uOoU3+0Qq4iX14JhP5mPM3VymI7WIxGIV
         Sq2eYEwQz2nh2N76suBa1PwQvszzebhw5YcC+dHGEjR+Bh0kLlsoKkcV6RRfjmThVVNh
         GbasI8z0S7eCs89tyTp3T4xzDlCC1Cj6ImXiHzn/f/nuEat6rrMGnm0vw+492YyexFlz
         JXzlBjBOWT/c4bQb/Q/ySme3BPJqDlY86WhJwAklHkh26/8KUsg7cRj3YQWz82kEXodU
         GA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770014381; x=1770619181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dE6334Db/8q+LVE4TPM0RlZCcc1UGZ7Evu81B8EwWuA=;
        b=LrUhumrqnKZbZyOGgE6OGkFOFxFDVIc7qPB1zmTsHnd/eBOnm49KHG0hQQ2E2FSGn6
         zi+y1/1NAwBsYls49SRvfPAiS35eFdV6HZApOC3cHEzVh4dzD0nhkBc06d/2oRvx05p6
         yDF28cLnaKoSfTLNlcK13Rcv9kEohQ1k6fyaVPw9RipRVY40/uXW0vcYnCiM0DYjVq2i
         KEeVkMc8qE+DpASHBaMsjeKxUTFRGv9aLuh/eFzsdbhNp1gGbgRGLKVdZpG3kgsi4w6v
         uNn6XAZ0NBjax07sNAq7jauxYn2+LNM/eOcpj5Wx7gmRdedV9MIwhgqv0v9EIJXZEdS9
         ZCbw==
X-Forwarded-Encrypted: i=1; AJvYcCWExFzcfROHBgMoC1b4FkKLHveRHzs41RA6Bp+n4pzzu3GJ13UZJwmpMIYb9hYym4kFuvyOkwD5muU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzMI4wnQd+Ys54sxP97c2sn5a7y7BSF2TkvOZN1bCJB4GV/cmhB
	hUgfXquFuochXqGu3aUwMHN7pEjv+w3mLHQY1ei2HuR6FQQ/o8Jm+A9CmAVPpHGvCbuH9Myj0Fm
	/T3OYrDrpk9Pggx52wOo3NP42ulS2rNo=
X-Gm-Gg: AZuq6aKYpTOxtnV4Waocx4te/DdCKYFOx5twM7FWcpCWOFuJBnXBe+EgbymaBMvq5aa
	8rR3EvatxItWgPAg1xpdY4dFzZtl3K94psmyWnvAsaJUdbMxvLeaQYwtxH8hAXxAI/V56Qtyypg
	7l2a8z9EMFZwINQTNLEkYT1O+DExH4OfuJf+e1/Ozi7y/8/cbbRMY3+5l5kaHhxYVVSi/YwmgLL
	/rhdg8QkhuZ9n4joYE7jiOz6hkthGR1VNLHeim3Fo0VRzNBd5Xz9jdtVJBGTjkLs1dppx8=
X-Received: by 2002:a17:906:2547:b0:b8e:380:5669 with SMTP id
 a640c23a62f3a-b8e03805c91mr453056266b.32.1770014381217; Sun, 01 Feb 2026
 22:39:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1769476820.git.zhoubinbin@loongson.cn> <402121da829497fc97f1461c8aaa3a44252c3f06.1769476820.git.zhoubinbin@loongson.cn>
 <aXh000kBfaqd1G9H@smile.fi.intel.com> <CAMpQs4JTqWr6AqRwEO9bcno-_MjjE8GKm_kUvrpy7m_tLMtuSQ@mail.gmail.com>
 <aXtw9h8WUs5H9MgC@smile.fi.intel.com>
In-Reply-To: <aXtw9h8WUs5H9MgC@smile.fi.intel.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 2 Feb 2026 14:39:28 +0800
X-Gm-Features: AZwV_QhXj9tszc0HGFFue9c8RTPxI3-iEb6Mu4cCGgevEV_nbiL8J0mGuBe64dI
Message-ID: <CAMpQs4+Rk7-ERUetW_V4ojGxLtpzoX+hGgr7wV+0iQ8Uhdri4A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] i2c: ls2x-v2: Add driver for Loongson-2K0300 I2C controller
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-i2c@vger.kernel.org, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy:

Thanks for your patient reply.

On Thu, Jan 29, 2026 at 10:38=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Thu, Jan 29, 2026 at 04:07:06PM +0800, Binbin Zhou wrote:
> > On Tue, Jan 27, 2026 at 4:18=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > On Tue, Jan 27, 2026 at 10:47:57AM +0800, Binbin Zhou wrote:
>
> ...
>
> > > > +/*
> > >
> > > It's not marked as kernel-doc, but looks very much like that. Why?
> > > Same Q for *all* cases like this.
> >
> > I didn't intend to mark it in kernel-doc; I just wanted to comment on
> > the variable.
> > Is removing the `@` symbol sufficient?
>
> But why? If you want it being properly documented, make sure it follows
> the regular format.

I sincerely apologize for not having read `kernel-doc.rst` earlier.
`kernel-doc` comments use `/**` as its opening marker. I will take
this time to learn the documentation.

>
> > > > + * struct loongson2_i2c_msg - client specific data
> > > > + * @addr: 8-bit slave addr, including r/w bit
> > > > + * @count: number of bytes to be transferred
> > > > + * @buf: data buffer
> > > > + * @stop: last I2C msg to be sent, i.e. STOP to be generated
> > > > + * @result: result of the transfer
> > > > + */
> > > > +struct loongson2_i2c_msg {
> > > > +     u8 addr;
> > > > +     u32 count;
> > > > +     u8 *buf;
> > > > +     bool stop;
> > > > +     int result;
> > >
> > > Run `pahole` and amend *all* data types accordingly.
> >
> >  Moving 'stop' from after 'buf' to after 'addr'.
> > >
> > > > +};
>
> ...
>
> > After run `pahole`, the structs are reorganized as follow:
> >
> > pahole --show_reorg_steps --reorganize --sort -C loongson2_i2c_priv
> > i2c-ls2x-v2.o
> > struct loongson2_i2c_priv {
> >         struct i2c_adapter         adapter
> > __attribute__((__aligned__(8))); /*     0  1064 */
> >         /* --- cacheline 16 boundary (1024 bytes) was 40 bytes ago ---
> > */
> >         struct clk *               clk;                  /*  1064
> > 8 */
> >         struct completion          complete;             /*  1072
> > 32 */
> >         /* --- cacheline 17 boundary (1088 bytes) was 16 bytes ago ---
> > */
> >         struct regmap *            regmap;               /*  1104
>
> It's better to keep pointers like clk and regmap next to each other.
> They are semantically coupled as "resources".
>
> > 8 */
> >         int                        speed;                /*  1112
> > 4 */
> >         int                        parent_rate;          /*  1116
> > 4 */
> >         struct loongson2_i2c_msg   msg;                  /*  1120
> > 24 */
> >
> >         /* XXX last struct has 4 bytes of padding */
> >
> >         /* size: 1144, cachelines: 18, members: 7 */
> >         /* paddings: 1, sum paddings: 4 */
> >         /* forced alignments: 1 */
> >         /* last cacheline: 56 bytes */
> > } __attribute__((__aligned__(8)));
>
> ...
>
> > pahole --show_reorg_steps --reorganize --sort -C loongson2_i2c_msg
> > i2c-ls2x-v2.o
> > struct loongson2_i2c_msg {
> >         u8                         addr;                 /*     0
> > 1 */
> >         bool                       stop;                 /*     1
> > 1 */
> >
> >         /* XXX 2 bytes hole, try to pack */
>
> >         u32                        count;                /*     4
> > 4 */
> >         u8 *                       buf;                  /*     8
> > 8 */
>
> Also think about it (don't blindly follow the `pahole` automatic mode).
> This is much better if you move the pointer to be the first, followed
> by a count, result, and others.
>
> >         int                        result;               /*    16
> > 4 */
> >
> >         /* size: 24, cachelines: 1, members: 5 */
> >         /* sum members: 18, holes: 1, sum holes: 2 */
> >         /* padding: 4 */
> >         /* last cacheline: 24 bytes */
> > };
>
> TL;DR: don't use `pahole` blindly. Use the common sense.
>

Sorry, I slacked off.
How about the organized data structure as follows:

struct loongson2_i2c_msg {
        u8      *buf;
        u32     count;
        int     result;
        u8      addr;
        bool    stop;
};

struct loongson2_i2c_priv {
        struct i2c_adapter              adapter;
        struct completion               complete;
        struct clk                      *clk;
        struct regmap                   *regmap;
        int                             speed;
        int                             parent_rate;
        struct loongson2_i2c_msg        msg;
};

> ...
>
> > > > +static int loongson2_i2c_wait_free_bus(struct loongson2_i2c_priv *=
priv)
> > > > +{
> > > > +     u32 status;
> > > > +     int ret;
> > > > +
> > > > +     ret =3D regmap_read_poll_timeout(priv->regmap, LOONGSON2_I2C_=
SR2, status,
> > > > +                                    !(status & LOONGSON2_I2C_SR2_B=
USY),
> > > > +                                    LOONGSON2_I2C_FREE_SLEEP_US,
> > > > +                                    LOONGSON2_I2C_FREE_TIMEOUT_US)=
;
> > > > +     if (ret) {
> > > > +             dev_dbg(priv->dev, "I2C bus free failed.\n");
> > >
> > > > +             ret =3D -EBUSY;
> > >
> > > Why?! What's wrong with the error code returned in ret?
> >
> > I want to indicate the bus busy state if it times out.
>
> This is not an answer. So, why do you remap error code. What's wrong with
> the callee's one?

I examined the existing callee and found no special checks for
`-EBUSY`. Using the return value of `regmap_read_poll_timeout()`
directly is the more appropriate choice.

Additionally, `loongson2_i2c_wait_free_bus()` is only called by
`loongson2_i2c_xfer()`. Its separate definition does not appear
essential. Calling `regmap_read_poll_timeout()` directly within
`loongson2_i2c_xfer()` seems more concise.

As follows:

static int loongson2_i2c_xfer(struct i2c_adapter *i2c_adap, struct
i2c_msg msgs[], int num)
{
............

        /* Wait I2C bus free */
        ret =3D regmap_read_poll_timeout(priv->regmap, LOONGSON2_I2C_SR2, s=
tatus,
                                       !(status & LOONGSON2_I2C_SR2_BUSY),
                                       LOONGSON2_I2C_FREE_SLEEP_US,
                                       LOONGSON2_I2C_FREE_TIMEOUT_US);
        if (ret) {
                dev_dbg(dev, "I2C bus free failed.\n");
                return ret;
        }

        /* Start generation */
        regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1,
LOONGSON2_I2C_CR1_START,
                           LOONGSON2_I2C_CR1_START);

.......

        return num;
}

>
> > > > +     }
> > > > +
> > > > +     return ret;
> > > > +}
>
> ...
>
> > > Ah, it seems it's a helper. Please, return the error code from it as =
int and
> > > not irqreturn_t, this will make things clearer.
> >
> > How about just define it as void:
> >
> > static void loongson2_i2c_isr_error(u32 status, void *data)
> > {
> > .........
> >         if (status & LOONGSON2_I2C_SR1_ARLO) {
> >          ........
> >                 msg->result =3D -EAGAIN;
> >                 goto out;
> >         }
> >         if (status & LOONGSON2_I2C_SR1_AF) {
> >            .......
> >                 msg->result =3D -EIO;
> >                 goto out;
> >         }
> >         if (status & LOONGSON2_I2C_SR1_BERR) {
> >          .........
> >                 msg->result =3D -EIO;
> >                 goto out;
> >         }
> >
> > out:
> >         loongson2_i2c_disable_irq(priv);
> >         complete(&priv->complete);
> > }
> >
> > and in loongson2_i2c_isr_event(), I reference it as:
> >
> >         if (status & LOONGSON2_I2C_SR1_ITERREN_MASK) {
> >                 loongson2_i2c_isr_error(status, data);
> >                 return IRQ_NONE;
> >         }
>
> > Its return value is meaningless for loongson2_i2c_isr_event().
>
> Works for me.
>
> ...
>
> > > > +     u32 possible_status =3D LOONGSON2_I2C_SR1_ITEVTEN_MASK;
> > >
> > > Split assignment...
>
> > > ...to be here, which improves readability (no need to go somewhere up=
 in
> > > the code to see what this is about.
> >
> > ok, I will put  `possible_status =3D LOONGSON2_I2C_SR1_ITEVTEN_MASK;` h=
ere.
> >
> > > > +     /* Update possible_status if buffer interrupt is enabled */
> > > > +     if (ien & LOONGSON2_I2C_CR2_ITBUFEN)
> > > > +             possible_status |=3D LOONGSON2_I2C_SR1_ITBUFEN_MASK;
>
> I expect something like this:
>
>                 /* Update possible_status if buffer interrupt is enabled =
*/
>                 possible_status =3D LOONGSON2_I2C_SR1_ITEVTEN_MASK;
>                 if (ien & LOONGSON2_I2C_CR2_ITBUFEN)
>                         possible_status |=3D LOONGSON2_I2C_SR1_ITBUFEN_MA=
SK;

ok...
>
> ...
>
> > > > +     strscpy(adap->name, pdev->name, sizeof(adap->name));
> > >
> > > 2-arguments version is even better.
> >
> > Sorry, I'm not quite sure what you mean by `2-arguments version.`
>
> Use 2 arguments instead of 3. I.o.w. just drop the third argument.

Ah, I see, the third argument is optional.

>
> --
> With Best Regards,
> Andy Shevchenko
>
>

--
Thanks.
Binbin
