Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C0413B58A
	for <loongarch@lists.linux.dev>; Sat, 10 Jan 2026 03:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768016937; cv=none; b=WJP6g6MOcZPLp4qN83uBDv/GnNWQvDOk4F+fL7epDwGICfpdVUBpj0iGjFejmA93FjUbG94BnOOUlUE3AlYXRyk+7hr+3dkM73oB1+42lPV4reBgawnpOgNyenpC0On+K36pNx+RlAHA1acXILOHf+4tXWxW1VBRplCm0x1m/2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768016937; c=relaxed/simple;
	bh=msVCFYsRX3718DaV+H7KAdRr1tb9DHcsgJXtjORN+H8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VUEAZa+2/qDizBwM6wwlp8P4ZoVp8O+kjUbyvcWioyxf03BCJLzOrY6orvWqmL802Qc91sd91Z01jMBdLVnOXlLIPyfPsM0TjI7YG3YbU9DCSEIeAIMG6VdyX4OL9lA3Tyas+CAZ5e7Jvd/Fe6qb0r8u1r4L131MOv3J5IPV8Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UWhTIStG; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWhTIStG"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b8010b8f078so789888966b.0
        for <loongarch@lists.linux.dev>; Fri, 09 Jan 2026 19:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768016934; x=1768621734; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIfYcCb3BvnBqrH/U5yUJtncWa28/q/Milt/Ra51c9I=;
        b=UWhTIStGIEadUuSXS9UPuWOhlfsxx+E8OUVFBwZZSQko5iTI4D9cflbh97fOlIgumQ
         KX5l+2Ic1x2ZN19tgyYkZNLwLAiPqopBSEgvKMM3dD9/m1bTxVb60Rnyuvu90OpjSVa0
         VR0wRjPkbzy+FAKly7+PwMrO4xR9RRVOU40TldBGtSPfFXHgyFjHanKw8QTToe2roldo
         0ozW66OzbZ6WlCuy118NtSjro2WlQ9fGh1wsw1KEPf3SDX9mmUvw0yGtUbSzBJVcCFkl
         Rt5nO01YEhd/mFz1xRZYmL2ZGGEUrtGX4mzz9cLUgMDH7OBxqcssfHLlf3L98vhE/DwW
         nYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768016934; x=1768621734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yIfYcCb3BvnBqrH/U5yUJtncWa28/q/Milt/Ra51c9I=;
        b=tEUjcC/UQdU+7rv7VMWhX8Y2WFP0Et/Fr+Oe1tvYh11emet2nlOqY5A3vZmU0DKqD1
         VC9s4EKJZ2k25vksAFd9CESeZMVDoQcZbjKpXwILz2RG1e22MseSwVg8SooP4DMaQMbK
         wQSpgYUxEjIEX8vq+pogbCr7yqobNhSO/WA23p510mAZVOXanWZjLZkuaPz+onrwyzW9
         8Gzn+kV9QGlbDCshLqeexvWbu5/QAPgTN8rFZpx1PRj77d4X3qFXrVZ19Ayu+f5aRv4X
         6W/b0o57djI3zT21sWuuEEph++69KCfvoUACOnXKj/HKsPBUGjcHxzMpeeM4dCgHVd3H
         AO3A==
X-Forwarded-Encrypted: i=1; AJvYcCUcy+5481B0qiqVDNyPsBsrIPjxwHT4tMOWNZzor30EAWx9Rvrtx0yS+GOpw8Jmzhi4kpkfoxd/PS0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/x4ilU+UBC1XhmXtboUaO/PGSK2lcabsI5W/Lj3GW5DbGG/8j
	LMzoJ5hZ+IwjhmwK9W+r3KLMJy3v8VkSBZf0iTRuYJhhUcDHDsk1Vfdx4/oxj+Akyvs27R+g+2R
	cKqLfAZcmTmkdIXROMa3F9VAXt+thdKix485DTsQwodTE
X-Gm-Gg: AY/fxX7DEDaC/3U4R5kBkyXp3IUUasVSWPU26nCFO8PD24M1wT6l4+jo4naKlnT8ZvL
	LmkstVXPhssbULNSsgp6LW+xuofxCw25Z3OZVeptVJqmCFUu7UbUj8BOk5F455GpZmk4lnlN58w
	WjpjJbge6/bw3ssbP1t8E1ln0+b0wnzaz1XUkLK4hP5h5Sq2ZLucG/P/vaW5suaz4gKOMSsKU2Z
	a1Os+/94L1wfk7ZuZv0gj/F23HLaWbMrF1lMwrFzgrIFQvcbbXJ9hM+mljUeHmwKYx2+YODicDW
	NxwOcyQSwO/AFJsDpZ9SxK1lqeOpziCbyLQDkI720WqH+2z1g+Gsqoc4vxcv0lAx97HGKSFdZMA
	TlxO7ej+BjJjG2l/PVo2m1/rZOgm7xxt70aVgXfGGiQ==
X-Google-Smtp-Source: AGHT+IEqR73p8m0MYcYWTkdYMg7wbaZFpPtMVUTMhIJ9/fd/eluH4DdIpOH/noRelfyAbA0aBIRdj1UoKivIHet22PY=
X-Received: by 2002:a17:906:f5a5:b0:b72:eaba:aac2 with SMTP id
 a640c23a62f3a-b8444f3f59cmr1123501066b.26.1768016934207; Fri, 09 Jan 2026
 19:48:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251223080437.3367240-1-chenhuacai@loongson.cn>
 <20251223080437.3367240-2-chenhuacai@loongson.cn> <87bjj3rnra.ffs@tglx>
In-Reply-To: <87bjj3rnra.ffs@tglx>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Sat, 10 Jan 2026 11:48:46 +0800
X-Gm-Features: AZwV_QhXvjbKkmk4NVlyQu-CMBRbRp-HxYJt6A2VjBsOlwMCUt9RUG0lWU6MoVc
Message-ID: <CAAhV-H7a5tmY2D7s-dpY8NkFCRx9rTX2mgCjgF0D_EdJHY5x6w@mail.gmail.com>
Subject: Re: [PATCH 1/7] irqchip/loongarch-avec: Adjust irqchip driver for 32BIT/64BIT
To: Thomas Gleixner <tglx@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 8:09=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> wr=
ote:
>
> On Tue, Dec 23 2025 at 16:04, Huacai Chen wrote:
>
> > csr_read64() is only available on 64BIT LoongArch platform, so use
> > recently added adaptive csr_read() instead, so as to make the driver
> > work on both 32BIT and 64BIT platform.
> >
> > BTW, make avecintc_enable() be a no-op since it is only needed by 64BIT
> > platform.
> >
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>
> I assume Jiaxun is the author, which means that this lacks a
>
>   From: Jiaxun
>
> line in the mail body before the change log starts. Please try again.
We are co-developer, so I think

Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

is appropriate.

>
> >  static inline void avecintc_enable(void)
> >  {
> > +#ifdef CONFIG_MACH_LOONGSON64
> >       u64 value;
> >
> >       value =3D iocsr_read64(LOONGARCH_IOCSR_MISC_FUNC);
> >       value |=3D IOCSR_MISC_FUNC_AVEC_EN;
> >       iocsr_write64(value, LOONGARCH_IOCSR_MISC_FUNC);
> > +#endif
>
> Can't this be:
>
>       if (IS_ENABLED(CONFIG_MACH_LOONGSON64))
>
> which is preferred over ifdeffery?
OK, I will do it in the next version.

Huacai

>
> Thanks,
>
>         tglx
>
