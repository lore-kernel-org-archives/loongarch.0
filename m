Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E2E293443
	for <loongarch@lists.linux.dev>; Tue, 10 Jun 2025 12:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749560015; cv=none; b=nUcPxXO0RPz/Yiy0yngc9wRxsOZ6//tu2owSpvmEEh94B8bcJgFOXx+3lpb9yfIW77pigeTO+6JjpROMIW0pxAXzaFX0ndawQSe7LbaD1tXciAbVdNyuqqlOTTN8BKpc3QQxyQ1ugCla9MxRTQAQqwasx5+tHT9FWY6605OZiNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749560015; c=relaxed/simple;
	bh=BdEOtlwKT5cm8r2CwV8DPp+MGOvYNyQWEEliBnZf68w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mBQtdnfCN00lvQxYLq9WgKFbpDqSawIvv52Cvj2CXOUpDuo+BOmsOkiGhq8aJiT4rJpzZmvIaQo+Fo2GdE+dKfyMMPq/cND5SQng1g9qjpItPN6dVp3xcchQ19XmJMhiFUOyoxH5R080xS31BH7/+IlioO+e0lo6Wh7Ud+w1qa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jYy5B0NZ; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jYy5B0NZ"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-adb5cb6d8f1so864182466b.3
        for <loongarch@lists.linux.dev>; Tue, 10 Jun 2025 05:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749560011; x=1750164811; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ua43JbNUP+RRPO3HRaTeqoeNTy0CSQSVsdia/VGFSEg=;
        b=jYy5B0NZchIkzEsHEsQxuyuWaupyEgeyKkI2JpqUlatDoWZsIKM6x0C1X4zv5ta9mx
         CB9ULpq6rcuunBG0+iW+rKV42MsxTGUYaW5tiSe77L2YVU42QGXTsZK0r5+J/GrqmaL7
         8sRtyZcqqL+Y4vyi15djsQ5WBuRhTFKTbs+MZEfO9G6dJHRp1g0ugYXrG6CDjXlgIVek
         /B8ZXCgrEhFA8NXd0c2uLsJ2ewBmMeTEkQPd5P0FIF5VdesM63n+tXoFduUO5i2l8eZT
         PelWsToM1x18IhhmCMl63kOudZsotfuYhQIpgE9HNOIxtE04s9R0taI6CxQw0jwuGmH1
         bDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560011; x=1750164811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ua43JbNUP+RRPO3HRaTeqoeNTy0CSQSVsdia/VGFSEg=;
        b=VOVwN1z0fBJxviRcJMHEARuW9tLHFVesDwIHpVfwm66PrbDi7pHPIbBzKim6i9lAM/
         R1PSZAW/VMCETdKqSuNADuqSBkYBo18k4bFznbAi7NO2W00eD2hzrG2ZmbS1mmUYHhAU
         +Gr1QKt8OFA9+sitk7L6fZ9rG3dmQGyQGsB7XBRNslKAoIHbrc1TjE9dK3TvI3IRBG0e
         EYcN9TPkpVYYQXRn+v0vFkIA5hxFxIcR3oYQWNb+hNe8KWhb+2gJz19AMk3C6GbVPTIw
         ohBqyVksV2Zc5zaEi7NLc8H4v9VPuqphBFG+2YJPCk9/4XBtt4f8nER9ldRTFQiziobQ
         +fMg==
X-Forwarded-Encrypted: i=1; AJvYcCW3TEScPCMyplztbM4O5Egr/Bk8aEMWJlquzMaFA4gyhI8mV+KZR/LSPJGZA4ZmD029S6ftDD7pEAA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxt5qa1JclhbR3yfyGh7g8G7rJKw1YyeLhof73xyxny8tzS8w/t
	GpPqPNb/YKQGK+e8dDBntwuRujPbzEUskOjj/e7tLQxNgFTXKQcub3dFg5u0KPbGtN1YZkbsEp3
	itk8Dy4aJNT2Rr/p1lPjwrjjh7TWjuKpl2L9tYnBklw==
X-Gm-Gg: ASbGncuue/8ME6/kgYefd+ZEKLRVmlb290PDVZJvRC9qirTts3Av5f1A1CI5oQyb0zz
	RusK3oqoG1gxz/Mo89TZaKGrNwOnQFwUx78qsBnU7+/Uffy8t42dRrcEg9S+04b64nIhTYTJ9Hw
	Rd2tnLTKUUH6k6qTftJUnxC54XpAFtZbfOvqwbEJzXP7zJ
X-Google-Smtp-Source: AGHT+IE0dnXtTd0cJKE4NbTH+mEK1zcSfNIzItd4LPIjOHRSwOojAZ1aIgIzoBnogv+j1Y6Xx9Qy218nbJLUy1UaMQg=
X-Received: by 2002:a17:907:94c8:b0:ad8:91e4:a91c with SMTP id
 a640c23a62f3a-ade1aab9825mr1680318466b.29.1749560011469; Tue, 10 Jun 2025
 05:53:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1746581751.git.zhoubinbin@loongson.cn> <704447268706b1b9f25bbe9d15459163d0ac3404.1746581751.git.zhoubinbin@loongson.cn>
 <CAPDyKFo4n=K5-SeKFpCm-0u4Bbk-E0XqUrx+KSK1yuZa35a7ug@mail.gmail.com> <CAMpQs4JCaUzJXgcQwiWOoJ0YAj=ORnyaK0dC3-GamV-cbyhNnA@mail.gmail.com>
In-Reply-To: <CAMpQs4JCaUzJXgcQwiWOoJ0YAj=ORnyaK0dC3-GamV-cbyhNnA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 10 Jun 2025 14:52:52 +0200
X-Gm-Features: AX0GCFv5tUexuVjVKPNZfCscSU_1kpR3xlCvzeNqP1bE90dtiqOaTc7DD1DnFvo
Message-ID: <CAPDyKFo5BjZsst=vXhU8Rv2HN-Ewy8vwnyFkZdo1-XCXX0_wsA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] mmc: loongson2: Add Loongson-2K2000 SD/SDIO/eMMC
 controller driver
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Jun 2025 at 14:54, Binbin Zhou <zhoubb.aaron@gmail.com> wrote:
>
> Hi Ulf:
>
> Sorry for the late reply.
>
> On Mon, May 19, 2025 at 7:17=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.o=
rg> wrote:
> >
> > On Wed, 7 May 2025 at 09:28, Binbin Zhou <zhoubinbin@loongson.cn> wrote=
:
> > >
> > > This patch describes the two MMC controllers of the Loongson-2K2000 S=
oC,
> > > one providing an eMMC interface and the other exporting an SD/SDIO
> > > interface.
> > >
> > > Compared to the Loongson-2K1000's MMC controllers, their internals ar=
e
> > > similar, except that we use an internally exclusive DMA engine instea=
d of
> > > an externally shared APBDMA engine.
> > >
> > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> >
> > [...]
> >
> > > +
> > > +static void ls2k2000_mmc_fix_cmd_interrupt(struct loongson2_mmc_host=
 *host,
> > > +                                          struct mmc_command *cmd)
> > > +{
> > > +       int val;
> > > +
> > > +       if (cmd->opcode !=3D MMC_WRITE_BLOCK && cmd->opcode !=3D MMC_=
WRITE_MULTIPLE_BLOCK)
> > > +               return;
> > > +
> > > +       regmap_read_poll_timeout(host->regmap, LOONGSON2_MMC_REG_FSTS=
, val,
> > > +                                (val & LOONGSON2_MMC_FSTS_TXFULL), 0=
, 500);
> >
> > Can you please elaborate on what goes on here?
>
> This is a controller hardware issue. We need to wait until the Tx FIFO
> full flag is set before sending the write command. Otherwise, a data
> timeout will occur.

Okay, thanks for clarifying. Please add a comment in the code about
this as I think it useful to know.

Moreover, I think we should have the value of the timeout specified in a de=
fine.

[...]

Kind regards
Uffe
