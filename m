Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08E272602
	for <loongarch@lists.linux.dev>; Fri, 12 Dec 2025 04:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765514829; cv=none; b=gcinqmmDqYfuO/MZuvclFQIlX7IF8Vwz0IUqp1pQDUKjBpgit6ZFzfnThB0/KtLyYymtYkFWZGpyMYYN2iHkrsl1zKINLJF1/jlBzNJRYlbbgXckaj8sZ/3v5vyzAZ3ljhF9W1jo8qoBR1vKLyQEoy82aqB/+HDwwBdHTpmsx5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765514829; c=relaxed/simple;
	bh=UqTzKA1JwfMdC7UnRzQSCi01yPLVfY64zBa4FG5OYus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LTSTxfoH88E0MTRcvVSt+qX2lb55cnKj9yLmligPLoDjss3V72x3m0v3RrUzrYqjvTnCmcc43NZyy9rQ1yplQ7aI+IBHhmTtRwKwWHRdMQt1wjZB8yV/YkrYJqAJEBupQcFhMg2qj0m93M+tlh2tY/xL3CETStTRlYVVxBe/o/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RUspatve; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RUspatve"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F045C19421
	for <loongarch@lists.linux.dev>; Fri, 12 Dec 2025 04:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765514828;
	bh=UqTzKA1JwfMdC7UnRzQSCi01yPLVfY64zBa4FG5OYus=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RUspatveFqpLw8qU+q1XoPpZCVODYxRfFPzTzaYu065BNSaQN4BncKowUOzT+Toc9
	 p3x1KTeG1iyE3OjJoieDqANoAZQcpRKh1xbaqJ+4vbylnNAAILEUUaFRA5KEzAe+Ap
	 NkQG56hhuo6lasD8LXlFj1ALrOcG+hb/5W7hJKcazRFwKBKxI2LhiwFLehpaJaCzSZ
	 kuIazQJoCZmz9/lSE7gP85Nj/5w0k7w8TwlKguWK/UdqEEJFGrZ/jAncsy5m2FgjzN
	 Pj2dFpuNDtA+wGuPaiOrrAhtDqBM4vRVF8+NGvfYSbmV3DxDVwXM/D5YOXVcSksQmb
	 lHNmADpYT7lBA==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b736d883ac4so140834666b.2
        for <loongarch@lists.linux.dev>; Thu, 11 Dec 2025 20:47:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWjSkP5mmVOOrugZeyPwzdt4pLvQ+r1tv+WiHNiCtPBpfMbaYVvpasIWJTewgDUrYYzK14QXLU8miE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxv/s357DTQjHJ0+TAnQry27xqr7PLvEQ/9fOuAtq5SqCFSRXqJ
	nb3gkHW4Lsv1wWxsrda7H8PVFMKxOWglnNNAq37mQmfxnDl6/43WxIWlD0GSVg23tzFZ32zIIZO
	E4mqYcVndd0krz7FYRAODHr9MkJ2LxCA=
X-Google-Smtp-Source: AGHT+IGBKaJfZtBa5dg9eG0FtV5vhk21hbAgL84f56hi/ok+CKbpaDDDXMoiot3LLqjNjxa6PTXiIhkBBLndm1tGzn8=
X-Received: by 2002:a17:907:94c5:b0:b7a:1be3:a582 with SMTP id
 a640c23a62f3a-b7d23abb329mr53641066b.63.1765514827124; Thu, 11 Dec 2025
 20:47:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251212-2-v5-0-704b3af55f7d@linux.dev> <20251212-2-v5-1-704b3af55f7d@linux.dev>
 <d00b641b2b85d5ca8dfd5c52d2a82d456b8a03fe.camel@xry111.site>
In-Reply-To: <d00b641b2b85d5ca8dfd5c52d2a82d456b8a03fe.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 12 Dec 2025 12:47:18 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4kMVmKj0uXmApr=xGxCZR1h_tT1iMDyKAkyuiEcfy28w@mail.gmail.com>
X-Gm-Features: AQt7F2oJV37vE6Cwq_yrWv79NpfxWwI7oMSiBb_1aldZXrpfsRuxdwN-XMV1Ygo
Message-ID: <CAAhV-H4kMVmKj0uXmApr=xGxCZR1h_tT1iMDyKAkyuiEcfy28w@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] LoongArch: Add SCQ support detection
To: Xi Ruoyao <xry111@xry111.site>
Cc: George Guo <dongtai.guo@linux.dev>, WANG Xuerui <kernel@xen0n.name>, hengqi.chen@gmail.com, 
	r@hev.cc, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	George Guo <guodongtai@kylinos.cn>, Yangyang Lian <lianyangyang@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 12, 2025 at 12:12=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wro=
te:
>
> On Fri, 2025-12-12 at 11:55 +0800, George Guo wrote:
>
> > diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/=
cpu-probe.c
> > index a2060a24b39fd78fa255816fa5518e0ee99b8a8e..47815a55b7b48bbffd4954a=
9b8bdf7021d7e234d 100644
> > --- a/arch/loongarch/kernel/cpu-probe.c
> > +++ b/arch/loongarch/kernel/cpu-probe.c
> > @@ -201,6 +201,10 @@ static void cpu_probe_common(struct cpuinfo_loonga=
rch *c)
> >               c->options |=3D LOONGARCH_CPU_PTW;
> >               elf_hwcap |=3D HWCAP_LOONGARCH_PTW;
> >       }
> > +     if (config & CPUCFG2_SCQ)
> > +             c->options |=3D LOONGARCH_CPU_SCQ;
> > +     else
> > +             pr_warn_once("CPU does NOT support SCQ\n");
>
> IMO this should be a pr_info_once.  CPU lacks SCQ is not anything wrong
> thus this shouldn't be a warning.
IMO we don't need any print, and maybe we can be put in hwcap?

Huacai

>
> >       if (config & CPUCFG2_LSPW) {
> >               c->options |=3D LOONGARCH_CPU_LSPW;
> >               elf_hwcap |=3D HWCAP_LOONGARCH_LSPW;
>
> --
> Xi Ruoyao <xry111@xry111.site>
