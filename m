Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4FA187849
	for <loongarch@lists.linux.dev>; Fri, 13 Sep 2024 08:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726217317; cv=none; b=kDv5CvDM/conk08D0X59EcKEG3MESovxziGfrmgxnn+1eUM8mzShgZHOnkK64WgwFt9FfCxsYAjEdRf092sfY6+j5PD30X3OywWXWSDMe63Hn2jOaLrG3Qa72H9s/+xbOkJ5rHZdfLKMzuHPaPKYLhiLj4Vz8pl6xgQdZxzieRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726217317; c=relaxed/simple;
	bh=RyDvqS2FL5Hm0TH9N1rF42ZS5UKm2nTFiqjSkozNOUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=au2rIkw/CC+ncFxhhvqK18LfHrvC4lnnRw1MpqlkBNPrBn48KAC5i/3rQHf9NlTht+MZ+ZsJ7L9PqsJq45d21O+iPDPeU8TJif7W1aJU4s4h+yBRwvHTg2TwsFsy1BhmOIxtY4wIOAuLDVBPNopYjMH4Ia5hDJzwCJGds0D+TyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pzYBXrOP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pzYBXrOP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63C43C4CEC6
	for <loongarch@lists.linux.dev>; Fri, 13 Sep 2024 08:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726217317;
	bh=RyDvqS2FL5Hm0TH9N1rF42ZS5UKm2nTFiqjSkozNOUM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pzYBXrOPE3tm8OeMXF/owUcFqavpGKMiVHzPx2KzNDY+yxJuSRCGq8xE1NHyyPGqE
	 gMXCYzEQriv+HbGivtJts+NXBWHFNkDJRkBS6B8qrm2oPXWWsNclnuoSjheshE/dhf
	 1vS+Kp/xhTNQNSHp8OaPMyRuwggIW8Dyung/rwcwZmopctdcQMKWuvqb0mpiWnj352
	 DG8XyztitSjIRH6FT8ZegJb49mpqEC05As+naogkq+Mo2kFKOuCPmd7FcxzN16Z78e
	 p18lupWLV3dHofKysowO/WUAJ4Sl/tcLFT7tSV6hrtfDaTtKzugqHRIdlM2LA9OZh5
	 wRP7x5ZNbadqA==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5becfd14353so765888a12.1
        for <loongarch@lists.linux.dev>; Fri, 13 Sep 2024 01:48:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUrijewH37jWL89NkVJhJSucHhC5HadVoUSHwk2/cqCCbYwPcZY47OAK1zQURURqy1RociIyTj3TnQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/qOrQ6TVTZ/b9kRPHpNkewtF5/XtGNQq7UFuRyRBUtueP+vkj
	NQOMsaRmAebctr9a8ZNq4vntggu2yAsv5UmF0sW2eCkv2uVo18uRKg9rSgRA89s9OdqmX566J9b
	D1L++QqUygnL+20gRalapjG69fXo=
X-Google-Smtp-Source: AGHT+IGxaU84H2rJpTKm+AdI3/GYF1ZX56p+WMUPH/a1hpMzs1gVjtnJn7uMkTUBM9lkKw3rEE/fFLQKHJ4EoG1Gffw=
X-Received: by 2002:a05:6402:234f:b0:5c4:136c:ee53 with SMTP id
 4fb4d7f45d1cf-5c41d5bc591mr2038704a12.0.1726217315937; Fri, 13 Sep 2024
 01:48:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240912-iocsr-v2-0-e88f75b37da4@flygoat.com> <20240912-iocsr-v2-2-e88f75b37da4@flygoat.com>
 <4f631f4a-eeb8-4b57-8424-4f5e970f0b69@app.fastmail.com>
In-Reply-To: <4f631f4a-eeb8-4b57-8424-4f5e970f0b69@app.fastmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 13 Sep 2024 16:48:23 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5JQSg3PTWBJ862-xjX87q5+fx72Dq0Wk+bsJxiC88wEQ@mail.gmail.com>
Message-ID: <CAAhV-H5JQSg3PTWBJ862-xjX87q5+fx72Dq0Wk+bsJxiC88wEQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] LoongArch: cpu-probe: Move IOCSR probing out of cpu_probe_common
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Xuerui Wang <kernel@xen0n.name>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jiaxun,

On Fri, Sep 13, 2024 at 4:59=E2=80=AFAM Jiaxun Yang <jiaxun.yang@flygoat.co=
m> wrote:
>
>
>
> =E5=9C=A82024=E5=B9=B49=E6=9C=8812=E6=97=A5=E4=B9=9D=E6=9C=88 =E4=B8=8B=
=E5=8D=889:55=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
> [...]
> > +
> > +     if (c->options & LOONGARCH_CPU_IOCSR)
> > +             return;
> Oops, typo here, there should be a not :-(
>
> Huacai, if the series is ok for you please fix this when applying
> the patch. I only tested against NEMU so didn't catch this :-(
Since the first patch can also be improved, you can improve this one
by yourself. And from my point of view the two patches can be combined
to one.

Huacai

>
> Thanks
> - Jiaxun
>
> > +
> > +     *vendor =3D iocsr_read64(LOONGARCH_IOCSR_VENDOR);
> > +     *cpuname =3D iocsr_read64(LOONGARCH_IOCSR_CPUNAME);
> > +
> > +     if (!__cpu_full_name[cpu])
> > +             __cpu_full_name[cpu] =3D cpu_full_name;
> > +
> > +     config =3D iocsr_read32(LOONGARCH_IOCSR_FEATURES);
> > +     if (config & IOCSRF_CSRIPI)
> > +             c->options |=3D LOONGARCH_CPU_CSRIPI;
> > +     if (config & IOCSRF_EXTIOI)
> > +             c->options |=3D LOONGARCH_CPU_EXTIOI;
> > +     if (config & IOCSRF_FREQSCALE)
> > +             c->options |=3D LOONGARCH_CPU_SCALEFREQ;
> > +     if (config & IOCSRF_FLATMODE)
> > +             c->options |=3D LOONGARCH_CPU_FLATMODE;
> > +     if (config & IOCSRF_EIODECODE)
> > +             c->options |=3D LOONGARCH_CPU_EIODECODE;
> > +     if (config & IOCSRF_AVEC)
> > +             c->options |=3D LOONGARCH_CPU_AVECINT;
> > +     if (config & IOCSRF_VM)
> > +             c->options |=3D LOONGARCH_CPU_HYPERVISOR;
> >  }
> >
> >  #ifdef CONFIG_64BIT
> >
> > --
> > 2.46.0
>
> --
> - Jiaxun
