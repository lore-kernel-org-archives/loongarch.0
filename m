Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7E9257D
	for <loongarch@lists.linux.dev>; Fri,  3 Feb 2023 11:41:05 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id gr7so14563563ejb.5
        for <loongarch@lists.linux.dev>; Fri, 03 Feb 2023 03:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4OpfCD/nYdWbkzAMhGA6hgTs89Fl0cSbPYWaIPLMsm4=;
        b=dsN7o1iwFoCKPfA0laC1qZhAUvPRDHEks1m0+39QRirq+/7iaIrjHsSDizvgGnDZ9L
         kbCZnoMYpyOaSJGNbJLGeiiAptWvorFWQUbF3b2Kq2TqsM6rQouF3B9ILeMosmhBFif2
         +pf06Ho+F9NJuIOgoGOPQRgqYB8fE/7dAcEsiyEFIBVSkyFayRTZzXgIZ0HcBWpdR+h7
         fln9eEZluS8ig4tkIPIQa8RHfH5MPlSlyczyptcuZtt3+J7H+WH26T/j2VQHP7cowkV6
         D9QonUGaIgmqS3+xyQ6AS+in9UPsoEoNIGF3COyfB9kngdWLNisSXRPSXMlrUGf4Z1ZU
         vX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4OpfCD/nYdWbkzAMhGA6hgTs89Fl0cSbPYWaIPLMsm4=;
        b=4j9HaXPdmNGROAKAiaUJrORpjEE1XYihKIAxzxs1Z3zz67t4r1akgMgSbOReEUGyzR
         fsmn7QzoAPGK283O9fKeWxzzds9A7CFT8Ygf1VOxXoOGlAN4a4Ss5InOmrIMOPWXDJ/h
         FQEgwyXwYukIV8VJZr7VZ0IpZU3hBbGJW7B+R+wBlT2xElGQBv/Se+vB5QPn8bWsxRcr
         FzlUbrYAdWn2ZFu/iUK1JGbP0kItXaTGLMMqSCP5vAw8rWAP7ANvU5cYMHY5rCCrU5/z
         ClHPiO2vaSURWjJBqa8R+H+86afmxSctrCUMm5dqWKeDj+bcWDioP8WNE1TTxwqraX3N
         5dig==
X-Gm-Message-State: AO0yUKXPPvo0eBFxHLH6dNGKTIYPfuCJAw6PGsCPXM1FziAPNPKDryIA
	qQGctM3H5EtQyke+452BKu3VWWTk5bW3cU8SNR0=
X-Google-Smtp-Source: AK7set+y2wUtK/2KjhH2aoRvSw8s86PnaVFsAwkyCF0LLubxZmD5HOVAsUVA2eqx+ktrLDtbAowSynJem3PgpDUkTcY=
X-Received: by 2002:a17:907:2391:b0:87f:5802:fd72 with SMTP id
 vf17-20020a170907239100b0087f5802fd72mr2899883ejb.237.1675424463623; Fri, 03
 Feb 2023 03:41:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1675167975.git.zhoubinbin@loongson.cn> <c6d7ee649e73536c62f665d11b0504029bd5613a.1675167975.git.zhoubinbin@loongson.cn>
 <Y9wqcWHBO9y/xKfO@ninjato>
In-Reply-To: <Y9wqcWHBO9y/xKfO@ninjato>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 3 Feb 2023 19:40:51 +0800
Message-ID: <CAMpQs4++P2yBG-+FH_DhNvWgd9ynhWSuYmaod=Z0j8eQJ3ResA@mail.gmail.com>
Subject: Re: [PATCH V11 2/3] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C controller
To: Wolfram Sang <wsa@kernel.org>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Andy Shevchenko <andy@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	linux-i2c@vger.kernel.org, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>, 
	WANG Xuerui <kernel@xen0n.name>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jianmin Lv <lvjianmin@loongson.cn>, 
	Peibao Liu <liupeibao@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 3, 2023 at 5:26 AM Wolfram Sang <wsa@kernel.org> wrote:
>
> On Tue, Jan 31, 2023 at 08:37:31PM +0800, Binbin Zhou wrote:
> > This I2C module is integrated into the Loongson-2K SoCs and Loongson
> > LS7A bridge chip.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > Reviewed-by: Andy Shevchenko <andy@kernel.org>
>
> Applied to for-next, thank you and all the reviewers!
>
> If you like to maintain the driver, please send an addition to the
> MAINTAINERS file in a seperate patch. That would be great!
>

Of course, I'd like to do that, and the patch is coming.

Thanks.
Binbin
