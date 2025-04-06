Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD04B2F36
	for <loongarch@lists.linux.dev>; Sun,  6 Apr 2025 09:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743932816; cv=none; b=U2tLyCZ4zlirNRJh5PPeL1two6Lkv9oRPiAg5ZcReDZdpf661dBKmI6jGtrTZ20gquMlVV1sGcvwXWWK/RpA1gJ58WIIDHeXxLOjLqVASLQ5s66LFpbtBQ0VAT3CH2sp6YuV3hEIFbePljfAg2OHANfGJ6x0YGYg2pME4yacc1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743932816; c=relaxed/simple;
	bh=MzU98WVndeQLX8uu0mheW8QCkJcKR2vzd4DXiU4pRMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mVneeX0sN/iKuYUwK75KJx5BjhUpJRtl2rg07jVxblwbGHutIz1oSPWVCg/AeR2XZ1J9InBs/PZAs/hX6/DERTd9UTpLWIiFNt6l5Svtxe+M/WD2WjfV22jB/fZ1ab77tiKB0BVpumDdWfgJszHoOA4LssDplzY/LAP+pOPzV2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aSpm8CA5; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSpm8CA5"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2bfcd2a70so444371166b.0
        for <loongarch@lists.linux.dev>; Sun, 06 Apr 2025 02:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743932813; x=1744537613; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQ5KcV6b2T7SBZC70etncna4BQfvzILzKvR1JLokorg=;
        b=aSpm8CA5r4ab1pTQVxR4dQkop0F52+UaSF1+wfIkmzzuawGVM8FQ769TZ9LOAplDYs
         CuW4HZN2JG9Zb387/Efykpo6RQqg5hBQlqW4TzpxZ41pcpLjnE66rTas/tj0LRHidVL4
         6aO8DFXQNm/Qrw9qah+iob/bEz0Fp3CtM8SymfGK38YLwY4SWn7SI4wgoGV27NzUjmF+
         gbs9/uqpEJUkkP15nzE3pK4aaQoHgEJ/ourLpZ/Hg0dVkeL2q8hn4q+O1sg2fVjzpdCx
         GrTuBMqXo5A/wdq1xeb6L4BO85cpJFc6lyqdxjaKqpbzlxuiLL/SWWYbg+7Cv1a+iA6s
         4O6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743932813; x=1744537613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dQ5KcV6b2T7SBZC70etncna4BQfvzILzKvR1JLokorg=;
        b=nwyTT7cVTBkT5vXu2r615+xlg4gn5VEOIZpfpEcTS/kSDO+/o22dPCE+HnpCW7baAm
         SljINa8+HER+f8ubq7+YayVzf1I2MLh3rmL8weU3gy1YAqNduLYNLKpFkQKMZ1qVz1lt
         tWLlLTgcZodAzUgM50Is/jKL3GDUQ4RWNFi4ENJ4+RU8peFI+5Chap24/72BJHSQ3Few
         75sAbE195tX3cIjJ9opIlNefnxDW1kEMBU6H9IM0ln3o6vkBoG05n0w4wd3RptRY4L6M
         YD/LGoc2xYZpRo7jRsOtIoaY32dUBWNqTn1cOjnS9PlOHtNx6oN9Ay/JgN8sbu4/9ujI
         U82Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJK1Q0+AxFrE8wPKp3iLekI7oeCqtfUpzBrtqHaSbL59BlUOaVS11xo0OL5altDvPI4+dQUffNF+I=@lists.linux.dev
X-Gm-Message-State: AOJu0YxgMDWun2BmCmcupU6nfanUCxT0IK5Rb7aF1hp65nNjJw61QuKh
	p56WtIoqw/IevFNu3gjK4uxSuPSX6p30U/A1p6PsmqjcGcN8cdNvZUZgykhVnheekiiDsrDbLhz
	dY3/+s4H2T3jzOxkYL1Hx9nSq0iY=
X-Gm-Gg: ASbGncv3TdvgAhbFe6aUXlujC/ZFS+g8jH1xVmErE5IIHBYpV6XgLF8wdsiUOqtjHBq
	IN1jmqGiJrE+R2WhSQc2mIiJnh2jGR0vzaaBctdXQcz04Ayt0txMWX8/hPO+cNWC5EHBxg7dxZy
	BlBFJhb5/AT8qpztmWJ902rHTFf31h
X-Google-Smtp-Source: AGHT+IE+eHm4l67vCbDvHozk2ou/wNvkCdLxpPfZsBIEdy3dp+Diuf52eSKNj4usIndB9jkEHkYtCvUenVFfy7BkPwY=
X-Received: by 2002:a17:907:988:b0:ac7:31a4:d4e9 with SMTP id
 a640c23a62f3a-ac7d16bc089mr941079866b.4.1743932812879; Sun, 06 Apr 2025
 02:46:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250402092500.514305-1-chenhuacai@loongson.cn> <87jz81uty3.ffs@tglx>
In-Reply-To: <87jz81uty3.ffs@tglx>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Sun, 6 Apr 2025 17:46:45 +0800
X-Gm-Features: ATxdqUEX8mja4RttrRUq-FhWIoVMgkwqM61JDoRBejrnMEqRJw0aI0NuPgefasI
Message-ID: <CAAhV-H5sO0x1EkWks5QZ8ah-stB7JbDk6eFFeeonXD6JT9fHAw@mail.gmail.com>
Subject: Re: [PATCH] irqchip/loongson-liointc: Support to set IRQ_TYPE_EDGE_BOTH
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, stable@vger.kernel.org, 
	Yinbo Zhu <zhuyinbo@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Thomas,

On Thu, Apr 3, 2025 at 11:48=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Wed, Apr 02 2025 at 17:25, Huacai Chen wrote:
> > Some peripheral subsystems request IRQ_TYPE_EDGE_BOTH interrupt type an=
d
> > report request failures on LIOINTC. To avoid such failures we support t=
o
> > set IRQ_TYPE_EDGE_BOTH type on LIOINTC, by setting LIOINTC_REG_INTC_EDG=
E
> > to true and keep LIOINTC_REG_INTC_POL as is.
>
> That's broken because it will either trigger on the rising or the
> falling edge depending on the setting of LIOINTC_REG_INTC_POL.
Yes, this patch does exactly this.

>
> But it won't trigger on both. So no, you cannot claim that this fixes
> anything.
Yes, it won't trigger on both (not perfect), but it allows drivers
that request "both" work (better than fail to request), and there are
other irqchip drivers that do similar things.

For example,

drivers/irqchip/irq-mips-gic.c
        case IRQ_TYPE_EDGE_BOTH:
                pol =3D 0; /* Doesn't matter */
                trig =3D GIC_TRIG_EDGE;
                dual =3D GIC_DUAL_DUAL;
                break;

drivers/irqchip/irq-qcom-mpm.c
        if (type & IRQ_TYPE_EDGE_BOTH)
                type =3D IRQ_TYPE_EDGE_RISING;

 Huacai

>
> Thanks,
>
>         tglx
