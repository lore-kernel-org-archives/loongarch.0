Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA123434E35
	for <loongarch@lists.linux.dev>; Wed, 26 Aug 2026 14:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787755402; cv=none; b=fUmeVwnKjpbyhAeROH42bAf9Q1PupG99lenzqXIpMO1ZVUy5VcZktZbUxh+HJc+uk/KX/QDCaCcR7ypP1cOVKU5fCUSlkl83cEK4vupbVuJutXhkjq98NAis5x0IKBkkuFq60IXwio5IEnOQIelQlQ18Kv7fSuJ7w2hAb0q1+CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787755402; c=relaxed/simple;
	bh=PA6KcrhquVmCEKg7pgkOcNMDcdSS3oTS9YVfziY3ST8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iuooEydqoitfRfU1Kkgua4Q3Bztq3gNopnb0kkckMF8S6q/790NOYnjJrSuY7Xwoq19d4I1tn2VGls5PBEha4IMuAErTbLiLXOZn9zMSLdYXKFwepYaNZIjT7PLBdIyyPWydfu9UMe0Y4gOdS1bUdxilhTqdmju0YdZVJeMHscM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KSjOFtvN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KSjOFtvN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A16E51F00ACF
	for <loongarch@lists.linux.dev>; Wed, 26 Aug 2026 14:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787755401;
	bh=bNgeNmZxyomQdJfOtLgfM3/AddEDANBB3tTF+LgZj7A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KSjOFtvNFpEL9VWrlynnlEYFL4b7J/LYuICmOipe1AqzQjufOvfYkx7fVsU4JDz1W
	 RSYIe9U3KkDvhMtv+PI6/+PiG2NvOPU1rExVcgSyBr17UVhrVWad/BOCh7Epme2rER
	 qxPJc7AUqM8nACHx7DM7+7HmLQ4QjVPEhyKES0cedtoEftesqHXu0WrdakLZi7Wtnb
	 kbU40wLKme7qShZvKWv8CFYk3PRnrghJEDKcgNnxbuJt6C8RqQCEwQz3wYcT3p2NJ5
	 /855uiX8Co0QnRiHIBA2Tiixr9SYnLOfjRlaS+emiY/Fn5W84G8YyhEGa1u+F5HTwD
	 K+LETS6p1yqxw==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c197eaaab00so169200366b.0
        for <loongarch@lists.linux.dev>; Wed, 26 Aug 2026 07:43:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrQc/QlWI0zJQVEsbgBRiv9basg0KB4grB6BGCNcVENUOsJsd1+K+3+o1ty1O797HMkbX/VppQkq9o=@lists.linux.dev
X-Gm-Message-State: AFuF++mgRYJ7hEPgJzbnkUNMVGHLdh39Mp9l3aeTlvkST7uAVTRVmrUA
	K+AdE3W/a1cgYeUg9hz//hF5QX7OPJl2gPAeZTPrceWBg4QzstUqStLwarGxXPZDv76wKxLgVg/
	dlocBAexUB9/PbpxtacgaV6y2Lm2lgPM=
X-Received: by 2002:a17:906:f5a2:b0:c20:88a6:8210 with SMTP id
 a640c23a62f3a-c250bc072a2mr890743166b.9.1787755400243; Wed, 26 Aug 2026
 07:43:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260818123921.3600606-1-chenhuacai@loongson.cn>
 <20260818123921.3600606-2-chenhuacai@loongson.cn> <0b8371b8-408c-48a3-a41f-2e2f1079d315@oss.qualcomm.com>
In-Reply-To: <0b8371b8-408c-48a3-a41f-2e2f1079d315@oss.qualcomm.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 26 Aug 2026 22:43:17 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6c5Ys8uF41UDC9b6u_856D1QW-iDRwP+XzfXr93R83Qg@mail.gmail.com>
X-Gm-Features: AcwNN1VqNPqAA0e5DEYRJDeXTIaP-SyNSqBFLwktU3BLY28qyYibW28AcZk32e8
Message-ID: <CAAhV-H6c5Ys8uF41UDC9b6u_856D1QW-iDRwP+XzfXr93R83Qg@mail.gmail.com>
Subject: Re: [PATCH 1/5] cpufreq: loongson3: Make this drvier depend on MACH_LOONGSON64
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: Huacai Chen <chenhuacai@loongson.cn>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, loongarch@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Zhongqiu,

On Thu, Aug 20, 2026 at 5:23=E2=80=AFPM Zhongqiu Han
<zhongqiu.han@oss.qualcomm.com> wrote:
>
> Hello Huacai,
> Just share a few inline comments/questions below:
>
> On 8/18/2026 8:39 PM, Huacai Chen wrote:
> > 32BIT Loongson machines don't have SMC and FreqCtrl registers, so make
> > this drvier depend on MACH_LOONGSON64.
>
> Typo --> driver? Likewise the subject.
Yes, thank you very much.

>
> >
> > Cc: stable@vger.kernel.org
>
> Nit, it is better to add fixes tag?  For example:
>
> ccf51454145b ("cpufreq: Add Loongson-3 CPUFreq driver support")
OK, I will add it.

>
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >   drivers/cpufreq/Kconfig | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
> > index db83f3365698..edc1299098d4 100644
> > --- a/drivers/cpufreq/Kconfig
> > +++ b/drivers/cpufreq/Kconfig
> > @@ -288,6 +288,7 @@ endif
> >   if LOONGARCH
> >   config LOONGSON3_CPUFREQ
> >       tristate "Loongson3 CPUFreq Driver"
> > +     depends on MACH_LOONGSON64
>
> Small nit:
>
> Please feel free to correct me.
>
> There are two MACH_LOONGSON64 symbols in the tree:
>    arch/loongarch/Kconfig: config MACH_LOONGSON64
>                                   def_bool 64BIT
>
>    arch/mips/Kconfig:      config MACH_LOONGSON64
>                                   bool "Loongson 64-bit family of
>                                   machines"
>                                   select ...
>
> The one that actually applies here is the LoongArch one, i.e. this is
> really just "depends on 64BIT".  Since drivers/cpufreq/Kconfig is a
> shared file that also contains an "if MIPS" block, please at least
> is it better to mention it in the changelog which MACH_LOONGSON64 is
> using, because the LoongArch one has no prompt and is therefore
> invisible in menuconfig. Or just write "depends on 64BIT"?
Hmmm, in theory MIPS-based Loongson3 can also use this driver, because
it also has SMC and FreqCtrl registers. But we haven't tested MIPS.

Anyway, I will improve the commit message, but keep the code as is.


>
>
> >       help
> >         This option adds a CPUFreq driver for Loongson processors which
> >         support software configurable cpu frequency.
>
>
> --
> Thx and BRs,
> Zhongqiu Han
