Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AEA1F3FE8
	for <loongarch@lists.linux.dev>; Tue,  3 Jun 2025 12:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748955301; cv=none; b=trG8alZyH3CWdDF3JT7cdYy36o6XD6Id+/uf4C5NrFj51G3a+kbT/e+R13pdw68g1YxyQcTGDAq6q3FuE1BnQNlrpPx+qLBufvS9QwfwVVQHgsQG8x7U5c+9XH0vLIxg/1A4NRGVSmsMHfXn91vfGw378VdN4qxPqPlM6R1Ilxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748955301; c=relaxed/simple;
	bh=/dAIwu0T7tzFgg3iCU6rIlWG6qfNpoFwGXKYEKntOA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WSK8fKrAsmC/cE/29zp45GbCrcP07r8hIxv/65rbX7OVstGMUGPQrR5mw1QRcR6PvU+BB/tNU10nDgC6psCWSVo+JdTSn69JyqnQmf4i/Z0syuAtMHWETXJmPXYSN2BLuaRmS6r6lqrLI02puSf+2gaKtnLvJsoDbzZiqtKq/0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hQ8Ept6q; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hQ8Ept6q"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad88105874aso879499466b.1
        for <loongarch@lists.linux.dev>; Tue, 03 Jun 2025 05:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748955298; x=1749560098; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+UZHJ2oORlm9mx4aNJvJN/pklH00QSvht/GBCe488k=;
        b=hQ8Ept6qf9ynr3sf3r/hr2XMd5Fs2CIbtO/MWO23HH5eLBg8Xg+r2HoqKvWnxJGPh1
         KdyWYHwTt7y384mr6LW1jKqCUn5hFgk3hf8s6tn/cgfcW7Y1hKfdFwG4EG80zz2tKHww
         uyS9YHqF2oDsH3cMP6xXsEpLhqgAdiWn17/6PQPmJaUSd4mW8aFh30jd4EPH+RFDUSkZ
         G7+dYR2Ob93NEFxAXzwHdZ6YtKxG79R456yOBNQu/cJpUsTJXI6kc6LwkKkIjPL0WwMp
         bXWtW3d6gEbqJMMnfXtAyl62WBk/QBVX9uGkPCFk12sVl+N95EjN2kjNF5YDTpGF39Ft
         GyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748955298; x=1749560098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K+UZHJ2oORlm9mx4aNJvJN/pklH00QSvht/GBCe488k=;
        b=UVeJHfGJEIB0to6GeKF/aWYzXqKyxHh4ZcpTUUe5cw9Zg3HY4XhmXiF2iQNeB92JsN
         Skd3asAl4BwFZKOpCuAkv61Snpi+Qb/sq4dYk/s5enyhtz264HFK4f9yA7iMgDeRgvqd
         ltfz718CAB/pzBgSCtkXUyhkU7iVVdx/eo+xjfkhsT9kLfPJjVjvJltNvQWWgPbQ/l/d
         WdL+sAQALCvajWoXwjP1aAKbMCefqZUWozV8ovJjdKnc1E1ZOQ/3lp23WoyUA6ijdTYv
         HsHQ1MxhBhu9H4YyGYIe9PkZE9s+z0/NMLxhOgHlHvYPX8a0ui97+kwJBYhZssIA8Pbs
         C8hw==
X-Forwarded-Encrypted: i=1; AJvYcCWHS/kElS7VTrNOoywSjHcA87QxyrHpJjvimkefumhEPz2vEE/svN+fnRPkq5LqCB3nIY69GqyjBJ8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+ul7fbSA9F+FwrSBxuoy2IH3yjqsyDkl4lmYi+vbSLxbYATRV
	MwvdpkByd2jxNDIPyKQzxvhLmJgKwHSf1CsxzKeOtLdeQyB+xi73kHaNAHLYXbUTF2Pf1+eYpiN
	6cXjpIaluD4otQI4OVh08oiWx8ADWqaAHyw==
X-Gm-Gg: ASbGncvrU2wrbpur3iR9cEAiq5Nnv0YZSYbCj/UdML5kLhXUq6Fkk5nYsb07oveH7zI
	FdS8UyXp/IWjvsOXVBhVZ1kmWagFxIItTaP+FkBOqfoze55x4JUv9Fe74eSnv9JuAa8gRJb+x5J
	pZ3KOEIq7PGk03mVQ1hNLJ0RIukuByZZWiHNAk5eWEUZs=
X-Google-Smtp-Source: AGHT+IGDlW8MDdTNB0VgQWuhPiBRj/aK0GGHFCiZpthrYERZp7ysLrGJPfPS797EiAjNE1OLiGDDU5eJieuTQScgWVA=
X-Received: by 2002:a17:907:7b8c:b0:ad8:8529:4fa5 with SMTP id
 a640c23a62f3a-adb32580593mr2018270166b.46.1748955297934; Tue, 03 Jun 2025
 05:54:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1746581751.git.zhoubinbin@loongson.cn> <704447268706b1b9f25bbe9d15459163d0ac3404.1746581751.git.zhoubinbin@loongson.cn>
 <CAPDyKFo4n=K5-SeKFpCm-0u4Bbk-E0XqUrx+KSK1yuZa35a7ug@mail.gmail.com>
In-Reply-To: <CAPDyKFo4n=K5-SeKFpCm-0u4Bbk-E0XqUrx+KSK1yuZa35a7ug@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 3 Jun 2025 20:54:44 +0800
X-Gm-Features: AX0GCFti6lVzu3WMi3d-hrNdeeTMc5uSmRkY_kyrecCt1CVJXaWP6obNQRLY6Cg
Message-ID: <CAMpQs4JCaUzJXgcQwiWOoJ0YAj=ORnyaK0dC3-GamV-cbyhNnA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] mmc: loongson2: Add Loongson-2K2000 SD/SDIO/eMMC
 controller driver
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ulf:

Sorry for the late reply.

On Mon, May 19, 2025 at 7:17=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
>
> On Wed, 7 May 2025 at 09:28, Binbin Zhou <zhoubinbin@loongson.cn> wrote:
> >
> > This patch describes the two MMC controllers of the Loongson-2K2000 SoC=
,
> > one providing an eMMC interface and the other exporting an SD/SDIO
> > interface.
> >
> > Compared to the Loongson-2K1000's MMC controllers, their internals are
> > similar, except that we use an internally exclusive DMA engine instead =
of
> > an externally shared APBDMA engine.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
>
> [...]
>
> > +
> > +static void ls2k2000_mmc_fix_cmd_interrupt(struct loongson2_mmc_host *=
host,
> > +                                          struct mmc_command *cmd)
> > +{
> > +       int val;
> > +
> > +       if (cmd->opcode !=3D MMC_WRITE_BLOCK && cmd->opcode !=3D MMC_WR=
ITE_MULTIPLE_BLOCK)
> > +               return;
> > +
> > +       regmap_read_poll_timeout(host->regmap, LOONGSON2_MMC_REG_FSTS, =
val,
> > +                                (val & LOONGSON2_MMC_FSTS_TXFULL), 0, =
500);
>
> Can you please elaborate on what goes on here?

This is a controller hardware issue. We need to wait until the Tx FIFO
full flag is set before sending the write command. Otherwise, a data
timeout will occur.
>
> Note that, the mmc core uses a couple of different options to manage
> busy detection monitoring on DAT0, for those commands that need it.
>
> *) MMC_CAP_WAIT_WHILE_BUSY - if the host HW and the driver for it
> supports IRQ based busy-detection.
> *) host_ops->card_busy() callback if the HW can poll the DAT0 manually
> for busy-detection.
> *) Polling by using CMD13.
>
> [...]
>
> Kind regards
> Uffe

--
Thanks.
Binbin
