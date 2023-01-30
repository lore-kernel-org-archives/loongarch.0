Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AAC17D9
	for <loongarch@lists.linux.dev>; Mon, 30 Jan 2023 08:52:54 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id me3so29576733ejb.7
        for <loongarch@lists.linux.dev>; Mon, 30 Jan 2023 00:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bqd+AYKseBUG/ZqMySUNAymE7dOTpHE8cVutn9FOQcE=;
        b=cu9Mqtjbt1fqJJ2R65+6eNjiwu8UAjmEKv12h3IQsTALgr9sFHkbuTY61d+ydEWsrd
         hQowFxgPdsJZHwZ43D2IkadgurzXJ8qUWKnQkD5TSctBoFsistF1KaiGbVJNvxC/CM3+
         YZwJiLeQNCrDXkGoTzTBk2t0e6NZus24d+7K2JW0V2L/u/Jw5xLYdRERiiVql2h6otxD
         MKGec9y2LW/wVIjjonBD8f9VhIxjyxUnbrru++LWdF/MtRllwaqWSbVU9GJk2+FWv2m0
         0bvcum9osmW7omzPCSQY495IEUg64er5dbOG+YfaZYm1eW+4CiTKQIHtuLZfw3qRqw4d
         68bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bqd+AYKseBUG/ZqMySUNAymE7dOTpHE8cVutn9FOQcE=;
        b=tQD68Rx5+8on1f0S1Q8bOGBs1iLBSTybqiKeauNIr2uUgCQOSfTAJwUKK0QkOC5cX0
         IYHDi2pAgK2Ybgwvt7pdNnETR6smohSYZP24zggcH3x24gBSirQpIEspmIXgSZmft0mp
         Kl97EAWdwbji8cvsxjpIO6R3t7komna+P1kHE6Yh9lvNXWazijnn7vbwk2y2nVBw6b3r
         kqg1hKxSwihTv2SGtCW27f1Z8zB7dsl5m5ynutbNci9Fb07LTlN9Q0q4Ii2zRrcTwjNz
         6pnI5gEq4SjFYLBWv6DPte0HMHEs+zdHhBbKwEF8eXBgRV+rqe3+4a9D8gl+df8ao0jN
         EpdA==
X-Gm-Message-State: AFqh2koPCMDsLF/HRuSQtzleHVVosTtqW9hqGfUNl/vpyH4sE6SPjkUh
	NrR7NAERhPZVcZbU3PYnWuuWWbVpDJnw9awl3xk=
X-Google-Smtp-Source: AMrXdXvSbcF8crULhPh3gJHBuaC8TbzosJW7VineeWbq4gYqPcrYYG/JXGIYYsksdp9AIrq555FlmE0IKMEcb5dh+2A=
X-Received: by 2002:a17:906:6a8e:b0:86e:3764:4f80 with SMTP id
 p14-20020a1709066a8e00b0086e37644f80mr6254866ejr.239.1675068772856; Mon, 30
 Jan 2023 00:52:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1673340642.git.zhoubinbin@loongson.cn> <77046b03eb0e75b25934406afce597997624a2b8.1673340642.git.zhoubinbin@loongson.cn>
 <Y8paBAVsBJIqLZnH@ninjato>
In-Reply-To: <Y8paBAVsBJIqLZnH@ninjato>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 30 Jan 2023 16:52:40 +0800
Message-ID: <CAMpQs4LVc2nMR_ZxcqX_vOuyyyhip=fgEfYPqctJGy7YS89=Zg@mail.gmail.com>
Subject: Re: [PATCH V10 3/4] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C controller
To: Wolfram Sang <wsa@kernel.org>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Andy Shevchenko <andy@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	linux-i2c@vger.kernel.org, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>, 
	WANG Xuerui <kernel@xen0n.name>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jianmin Lv <lvjianmin@loongson.cn>, 
	Peibao Liu <liupeibao@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram:

Sorry for the late reply.

On Fri, Jan 20, 2023 at 5:08 PM Wolfram Sang <wsa@kernel.org> wrote:
>
> Hi,
>
> the driver looks mostly good. Thank you for your hard work, and also
> thanks to Andy for his great review efforts again!
>
> > +static unsigned int ls2x_i2c_func(struct i2c_adapter *adap)
> > +{
> > +     return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> > +}
>
> Have you tried messages with zero-length or the SMBUS_QUICK transfer
> which is basically the same? i2cdectect uses it by default, so if that
> works, then we are good.

Yes, I have tried this, and i2cdetect shows the following:

[root@xxx ~]# ./i2c-tools-4.3/tools/i2cdetect -q -y 2
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- 18 -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: 30 -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: 50 51 52 53 54 55 56 UU UU UU UU UU UU UU UU --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- --
[root@xxx ~]# ./i2c-tools-4.3/tools/i2cdetect -q -y 3
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- --

Do you mean this?

>
> > +/* The DC subsystem depends on it, we should initialize it earlier. */
> > +static int __init ls2x_i2c_init_driver(void)
> > +{
> > +     return platform_driver_register(&ls2x_i2c_driver);
> > +}
> > +subsys_initcall(ls2x_i2c_init_driver);
>
> Can't this be handled with deferred probing?

Emm, I've been trying to register using the generic method before and
deferred probing should be a better option.
Also, I'll use module_platform_driver(ls2x_i2c_driver); instead in the
next version.

Thanks.
Binbin

>
> Happy hacking,
>
>    Wolfram
>
