Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1893E2D1F64
	for <loongarch@lists.linux.dev>; Tue,  9 Dec 2025 01:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765244280; cv=none; b=nEWiIN9Y4H46KHRk5kxofO0Q/cGzDRzFxF9qwLwdw+zfabTZOkrx8OfWTw8H9uwC7wi5nhYr68twnKvYRDFVVMVF3hLBfhYaxmzHn0mCQhIbFLT3QakZ8RXzFkzldXfr/WdwR9ah6UZLWhVYiL2yIqLhZpsEuxmuwIyJuCBKa18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765244280; c=relaxed/simple;
	bh=wkiv8FFL9e9m+HqhWBOzuCxNw8s5f5X/63ur9xIieHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZhQf69WsMgkwIK+k/xlLO9MPTEMYR6aQo/6FKVXG8k2HFITpT049owzQoth9K6U1qkczB17qGDcusIVb63orz6BAwLeQhzuld2qDmdwpAR1aZZhQxwq/UJ6y55DEQTBgbvBWr+gmj82M7lpeSocSATMBvcren/NIisQf+p/C0zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cz7B1sY7; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cz7B1sY7"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-3ec31d2b7f8so1981739fac.3
        for <loongarch@lists.linux.dev>; Mon, 08 Dec 2025 17:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765244278; x=1765849078; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wkiv8FFL9e9m+HqhWBOzuCxNw8s5f5X/63ur9xIieHw=;
        b=Cz7B1sY7KqdBrd3mANCVBD5VsEW5hMph4w6/uVYAZKtrghCGYN2BUR2wxVK0hc0U79
         hGrFD2suwaOq6OPCP+KSbLD6zhlCP1ySthHD0bRYa32tI7l+cpndDHKg9iyZn349XYBa
         6Y50RYCW/dhTHLPPMJC8EgvqkkX+X7q12QkiJ547fahVsLLAHC+GlXCs4mvqB5RSzxAJ
         KSz/nFvx5XeX6Xtm8nm2Z9dRiifGHa+k8/4EkT5PUHIoESNt2F3A+lHAq8QQ1YsmGgg6
         EGpUw1PAkTRZoqmV49tkoScjACsur0RRbDNSTsLP6W0A6S/nO48B1wlzrAfDa7cuC2jY
         OpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765244278; x=1765849078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wkiv8FFL9e9m+HqhWBOzuCxNw8s5f5X/63ur9xIieHw=;
        b=CtIp3bboELucYT1En7zdwqODy5RyZlBOxCzwJmAdtp7i2LICiZpNVeqJomIp7iadQt
         xrAcqqxpCtLLDQRQepuVClBkjKtcJ4o/FVMfgj0jPqla/Lmk18yT1+CoJFRdsb4bZnn8
         fIlxo5u5C0l+qzRiY4v5lmozAq2qI6OSD9DpKPCeHU3oqROW5rcALtTV5+oC5Edk4sxw
         dqQ4ob0gxkrVOEpJyWdK5Wco4j4nGsxXBlhTd7VmdANXttKcGkseH2BGT5Pc2SOeN8+P
         4W5snfKoMjn8qtW2aHckmLrOw6FqNx6WpkO9QGmN1GHl/uaLDjGpn0U0Da81phIoF3pF
         sjiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVInaie7Z0IGW8b953tBf6EjQtFPBIy50Nj7cZGiDDOADcBB3kyZB9U7FIp7L8Cm85KeiYjFag25S4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1TGs1clRmJ6NxuNczq51a4DgDN+Fby81EbsueVPqe943JxPnV
	hmHNJ0zfb7qz4diM+7kAvidDdtkdODzmsxqtURSvyo6I27oGLZ9bSvHznGqj2luGSmrUSKX+YW4
	vCDSN6wj/vbxKpSiG2J0zR6aKwwbSZCA=
X-Gm-Gg: ASbGncuO9Dw7bJ7e6Q7fc4VUjxFeTmwUEBUPhJLxM6elfrraOOPZRZSQHOJ+L8KVjw2
	pBklZx5rbTeIWzePdLNGR8A+/m1a+wJcGy/rpbF2UFqEWGoQ/7M5PjkZhJhPQILm7mfYg9Kft16
	lw19M8wjkXDos2gKY6pRQU/+A1NnkzaPSiHzBrrJZm27f5Kid3wdC4f1w3W9gx07gWuX3YWUMAe
	79A6wFTotlUgNOGQHs2XxU6il25/NAhgqXQTndRKeGKgkmQ4l7PRNinndA8gVS5b4AHxA==
X-Google-Smtp-Source: AGHT+IGfj1mzD5OqSQUkyCm2+/t6mc7RSiy0gRO1MN8LY9JyRtqSWXGNNbV3V6CjL8NqgNLEdzhUYdBaCso1Z6swOGo=
X-Received: by 2002:a05:6870:a251:b0:3ec:3685:34a1 with SMTP id
 586e51a60fabf-3f543ef30c1mr4788781fac.25.1765244278058; Mon, 08 Dec 2025
 17:37:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251124055642.1591-1-hengqi.chen@gmail.com> <CAAhV-H6rrpgBF+bMpEvsJyq0F7sdWisGSwTbuf=ZBhi4XD-5jw@mail.gmail.com>
 <CAEyhmHSntgSQdAOksd6YUsHh0UXJS7XMmSHAZmRDQ5uEzDU0JQ@mail.gmail.com>
 <CAAhV-H5Vab3bwgT2LdGyNB4ipzhnS+JW7PdcOSmNm4JZ30tWTg@mail.gmail.com>
 <fc62bac6-b212-3aed-1536-aee8a60d2f0a@loongson.cn> <CAEyhmHQO9bDP7L=cwxLUbQCrkFfcDaSeKMgB5R32sqMgvJk7ng@mail.gmail.com>
 <CAEyhmHTUToX3qedYVS7v3LP84f3LiW9NbrH-nzxEqEdWAkhFmw@mail.gmail.com> <CAAhV-H7+ORpvG-73OaprbH2HiHzF-HUepVxGLsJb9rJXzg3gPA@mail.gmail.com>
In-Reply-To: <CAAhV-H7+ORpvG-73OaprbH2HiHzF-HUepVxGLsJb9rJXzg3gPA@mail.gmail.com>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Tue, 9 Dec 2025 09:37:47 +0800
X-Gm-Features: AQt7F2o84RX8J_zF69WXHQABWR6goWmI8As_dnC26g6RDIMDmgsZlWqkB_TtEEI
Message-ID: <CAEyhmHS3Gqomep4GYHMjJqJmd2eFJdcok6_+D4+BQ7WE4Bhnsw@mail.gmail.com>
Subject: Re: [PATCH 0/5] LoongArch: BPF features and fixes
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, vincent.mc.li@gmail.com, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 5, 2025 at 3:16=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org> =
wrote:
>
> On Fri, Dec 5, 2025 at 3:04=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.com=
> wrote:
> >
> > Hi Huacai,
> >
> > Will you pick this series for 6.19 ?
> I tend to not pick it, because it is a little hurried.
>

Fine, but deferring does not improve anything if no one else is involved.
Maybe the fixes part can go in after rc1 ?
Anyway, no big deal. Thanks.

Hengqi

> Huacai
>
> >
> > Thanks.
> >
> > On Fri, Nov 28, 2025 at 9:37=E2=80=AFAM Hengqi Chen <hengqi.chen@gmail.=
com> wrote:
> > >
> > > On Thu, Nov 27, 2025 at 3:30=E2=80=AFPM Tiezhu Yang <yangtiezhu@loong=
son.cn> wrote:
> > > >
> > > > On 2025/11/27 =E4=B8=8B=E5=8D=882:44, Huacai Chen wrote:
> > > > > Hi, Tiezhu,
> > > > >
> > > > > On Mon, Nov 24, 2025 at 3:49=E2=80=AFPM Hengqi Chen <hengqi.chen@=
gmail.com> wrote:
> > > > >>
> > > > >> On Mon, Nov 24, 2025 at 2:31=E2=80=AFPM Huacai Chen <chenhuacai@=
kernel.org> wrote:
> > > > >>>
> > > > >>> Hi, Hengqi,
> > > > >>>
> > > > >>> I think this is the successor of
> > > > >>> https://lore.kernel.org/loongarch/20251006053323.193581-1-hengq=
i.chen@gmail.com/T/#t
> > > > >>>
> > > > >>> Right?
> > > > >>>
> > > > >>
> > > > >> Right, sorry for the long delay.
> > > > > Could you please help to review this series?
> > > >
> > > > I trust Hengqi and I am OK with this series in general with
> > > > a quick look.
> > > >
> > > > For the two functions sign_extend() and emit_abi_ext(), I
> > > > have no strong opinion, I do not want to respin the patch
> > > > since the merge window is coming soon, it does not affect
> > > > the correctness, so we can refine the code later if there
> > > > is a better way.
> > > >
> > > > Acked-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> > > >
> > >
> > > Thanks.
> > >
> > > > Thanks,
> > > > Tiezhu
> > > >
