Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEBE317169
	for <loongarch@lists.linux.dev>; Mon, 15 Jun 2026 03:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781495143; cv=pass; b=LXeyqjSn6ZBU8y9u7GrODmE/HK/1wSMX5JBo1O7x9UC17DYRZFS6Fnr8QG/+ts/m8P5RB3yuzj8hacnVJcnGmqknOXOy/dJGqxFqDTey8sy28t8fdNC527UkCK0AtumBhZkwO4rSV/NXpFEEry9gV03f5BygI/pIjxbCPoJhG60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781495143; c=relaxed/simple;
	bh=d5a3LPOnYYTA8cGNB2cCIBaXlzkJq3L4AMUVgwKsjqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YE3Lz6EPl7OBJ61Z8cRFnbql7LUDbL152ZjcoNLc2tpz//Zlveb/kSPOlTCKLcEnX7/E3GeyOPfWpQNL7PONqcFbCTP3Zw1oL1J4SbzzYRQJ0sV+42Wj0P1HQG00o0Je2R1fI5bpVwSUcav0FFUTciCj1qE2rfOckXGl9fY4bkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jm3SlVvt; arc=pass smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jm3SlVvt"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c86484d35d1so890243a12.3
        for <loongarch@lists.linux.dev>; Sun, 14 Jun 2026 20:45:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781495141; cv=none;
        d=google.com; s=arc-20240605;
        b=WMxb+WCxHI1Ipu66F7/ufPVUebavm1QNYVUpF0dzAfyiWYvFZXuzH4kHxnsCWyCd2W
         x2spgZ/LayHNIXaVOOXjeFCjJYhrun7WAvwndD3+exahiO2f+x1TYrEuseJ7NApPhulT
         EJHM0aYVEnPvcSbm9CvAnsSoLC1QVh6Mj0AjXTLCvu1vuzQPGcEqoUyiZ8aR8TDk7xHp
         d3sZKmKIgtmakAkN2CV9Ci/QvweacBp/bU35/M7dKf7TmCeh3LwryhWnXFsd+UGmIR3N
         C+qPdhzkUHGlvAMBSmeuIE7O9skDLypMBxz5GJHSa+754Nu3mJbRl5M4LG+wuizD9mJC
         I0TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d5a3LPOnYYTA8cGNB2cCIBaXlzkJq3L4AMUVgwKsjqY=;
        fh=6NW77dsvEy+5OGUhwT0rjm3HoW4njCKv6VkKn4waw/k=;
        b=V0/E6VKvAKaB6Mhagya1eTwuNwXGC6BCWFss1JztfJU3dneXqI/4E9qVEtx7shLfLd
         HAQrCn8en54aF9cr8IESlywGqcRyAx+lAd5hO3zPRHkZrP8eSSkQGJZsGf0wvwGFItBq
         emEzMTf204jliR622FXDG5wQ6A5DxaHE7DQ/DGKi5k2/AsFtphgF5GBTP+XZuPz0/Tka
         bCCCdTEt9+ed3mIuyD+Hxsprkazq9e2vA+DoWBC9qQ2GQKiJDbg0vZyPvRkpnP80+ab2
         Y38vNRJmI9vcGM+gbu7PH0eQ/k8no22bh0pBpnP1L6pPvF8A+Gial4PuvGBFJJl/vPPw
         ZAiA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781495141; x=1782099941; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5a3LPOnYYTA8cGNB2cCIBaXlzkJq3L4AMUVgwKsjqY=;
        b=jm3SlVvt4Ae74bl/dZRRvJWjOY2Z9KXmnA0YTjDYwVXpJGr6MM0soI2P/XZluNUgSa
         C6IL0HZGnImU93PB/N6i5ndIpGPJjvHByYh2NvOSkCPlw0sYtQenpWMimxbLcVTUbsco
         a20LtsaexfQ6GUyJYrkVOQoVJ2oYGnRWX48w6dob7ZsXTy22AjF+VCNdXoLNf+c3PfcO
         EL2G7ZtItlnk1KsGfubM33ar1f5rfgiOapRH/M0FCnRYqqSCOy77Q65h1ATyw3g9tcjV
         /Ob687UMcciv083gsk1DToWmQ+j2az9xD4Jhm9F5aATOoft8a/gW37VEDTFQX9LhWv+T
         AMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781495141; x=1782099941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d5a3LPOnYYTA8cGNB2cCIBaXlzkJq3L4AMUVgwKsjqY=;
        b=o7NrOc4wxdBDFQnp5ZO7Q5UCTImjt6j0iPjQwuSRXj/oR8XQVZLT3aCK+Ghq+g0HOy
         dtJAOreFdsSUoxZBCqKLs40+sTc2uLVEaYhx9d4HpNiKyrcU8ayqy86nu9VyY550erGi
         I2RXHh5T9gYIrxxjP+xuvkkiZ68nNtDal/iykDnYMG6vRXIKi2fq0DFJLtk79+6J+TzT
         W/77on7Ada/IC6ZeqKpAcOLrnBtxcJU1Ysqj+55ZnIPTrv3nbTb0x0Rwa4bIMPr2Sphg
         1DjBP4q7nByFJIu/nNgIVdYAG8CsswEr5ljrTu1elIPAXQWV2qaZyJtA4y+W4lkSHrOq
         bseQ==
X-Forwarded-Encrypted: i=1; AFNElJ93OmHy5ieVQHhK043wJhg8NHsKo28d3pLaeR7/FiNW0RA0mTsWJ3lAX7vXrv1Hr2SkzMhgpHPbNXA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyF0s3bF+OL310ygqw0tvembwHnKMNZiCZhqiq+uxACsRWMKSqp
	BC0+PJcoT2qbqmsj6bp57w1jQ3RG47FYdyZyD1GfZodHLq+MlHgcJRrEPcpP7WTjxZxBnD32+LF
	Yqh2j4Vqc3e3JhcjJwIM9dMOn86xObDg=
X-Gm-Gg: Acq92OHY/pNLMNw5VM3HTJW4aR2ITtbG/g8bpKRU+67CQnzDnbJksLJd/OIz/+nPehy
	wgMfHNDfC8kDuaTFcNI4gWLUA94P8ibsKwcP8+awxFFvqSEgxCQX0WOa/xnDCS6zz5VIBE3aFOA
	EeNxQdRgD9qjdT8iLIJ3Pww5qEh/F7JFjanCaOofEC+7CKDqVwEvQGBuW1O3JNFTb3zQf0/LyGl
	TxLn3P8tx4V02G+XS+Gsgf9gDK2+C+GDatDjIpYWih4V4WV2itTySe/15W4XaV9sdApzX4nlSnT
	uGUlCAmoe77OJ7CuZI/EwWLSLylfV7ZcUZ2yIjr9yWUO5pRTHR68YQcG5h7fjnbBSr2JhhvyzAI
	9aQo56lPIXemtMZWlVq7zH8tu
X-Received: by 2002:a05:6a21:e90:b0:3b3:bf7f:efeb with SMTP id
 adf61e73a8af0-3b79642ca5bmr9972447637.45.1781495140527; Sun, 14 Jun 2026
 20:45:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612011616.27771-1-yangtiezhu@loongson.cn>
 <CAAhV-H4daHGFoAiXrwcNXj=T1kZm5jRRwd_sCiv7ksjR2ynHgw@mail.gmail.com>
 <e23e6781-d39d-d7fa-10ec-8d09349103ed@loongson.cn> <CAAhV-H6jJpEnNTUF0CF60fDB5ShNT+C59NEH=YodJtepFQgrKQ@mail.gmail.com>
 <833e2fca-6a41-786c-356d-6480ca168e44@loongson.cn> <CAAhV-H5LORpNeTycjmHFobOZEA5w=spSkxJuOajuizz-941zQg@mail.gmail.com>
In-Reply-To: <CAAhV-H5LORpNeTycjmHFobOZEA5w=spSkxJuOajuizz-941zQg@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 14 Jun 2026 20:45:27 -0700
X-Gm-Features: AVVi8CcYECDOKLuQY2giVgMR7JGvSRDaM6DUgHhLWQSnV3DyRu5vz97XLuuibZc
Message-ID: <CAADnVQLAgYFQ=BRi+hKwt5pp7fffqsvD0rXzn6Nk9jJQ=6uUZA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Move thread_info into task_struct for LoongArch
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Hengqi Chen <hengqi.chen@gmail.com>, 
	loongarch@lists.linux.dev, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 14, 2026 at 8:31=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> On Mon, Jun 15, 2026 at 11:16=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson=
.cn> wrote:
> >
> > On 2026/6/15 =E4=B8=8A=E5=8D=8810:23, Huacai Chen wrote:
> > > On Mon, Jun 15, 2026 at 9:41=E2=80=AFAM Tiezhu Yang <yangtiezhu@loong=
son.cn> wrote:
> > >>
> > >> On 2026/6/14 =E4=B8=8A=E5=8D=8810:51, Huacai Chen wrote:
> > >>> Hi, Tiezhu,
> > >>>
> > >>> I have queued this series for 7.2, does the below series depend on =
this one?
> > >>>
> > >>> https://lore.kernel.org/loongarch/20260521125636.26744-1-yangtiezhu=
@loongson.cn/T/#t
> > >>
> > >> This is independent on CONFIG_THREAD_INFO_IN_TASK.
> > >>
> > >>> https://lore.kernel.org/loongarch/20260428080051.20938-1-yangtiezhu=
@loongson.cn/T/#t
> > >>
> > >> This is dependent on CONFIG_THREAD_INFO_IN_TASK.
> > >>
> > >> But anyway, I plan to send new version for the above two series of
> > >> selftests once this "Move thread_info into task_struct for LoongArch=
"
> > >> series is merged into the mainline, maybe after 7.2-rc1.
> > >>
> > >> Because the code under selftests need to be updated, for example,
> > >> it can use bpf_get_current_task_btf()->thread_info.preempt_count
> > >> for get_preempt_count(), and it should use ld.wu rather than ld.w
> > >> for bpf_get_smp_processor_id().
> > > You can update new versions now, then they can be merged together.
> >
> > Thanks for your suggestion.
> >
> > However, considering that these selftest patches need to be
> > routed through the BPF tree (rather than the LoongArch tree),
> > updating them right now during the active merge window might
> > be inappropriate and risky.
> >
> > Given that these selftests strictly depend on the "move
> > thread_info into task_struct" core changes, sending them to
> > the BPF list now could cause cross-tree dependency issues and
> > potential build breakages if the core series undergoes any late
> > adjustments before hitting mainline.
> >
> > Moreover, because these are selftest adaptations rather than
> > urgent bug fixes, they aren't high-priority for this immediate
> > window. I will rebase and submit the new version to the BPF tree
> > right after 7.2-rc1, once the LoongArch base infrastructure is
> > securely merged into the mainline.
> In history most arch-specific selftests are merged via arch trees,
> including perf, bpf, ftrace, kvm and so on.

This is not true at all.
All bpf selftests are going through bpf-next tree.
For example, x86 and arm64 bpf JIT changes always go
through bpf-next.
loongarch is causing problems this way by taking bpf JIT changes
into the loongarch tree.
