Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6455764AAD
	for <loongarch@lists.linux.dev>; Tue, 20 Feb 2024 08:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708419387; cv=none; b=NF/YVSteMfZs1Ea/6Q0X8n0mKEozPtEAVkxf16NiHhLgbuPGBXxn3A0gwJ6xqVZ83YJrh56ovHDADoxG4w+CQrOTYAC/o4swTpojH9PJWn6NxM0/lc53taf2Xu3teTpXJ8IlINElJYuvCW5SiPxSfcER9SnKWFikA9zMqTpmHpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708419387; c=relaxed/simple;
	bh=XxS2PiR8TvPD6PooYcEaHBnRrtlm5KfcjvweKguWnMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=giMdH0DcitI0hQWQWwz4AuS68034hTaowyphlDzaajZddd1LnGZobsJBCihX5CVTrf80jQgbNEiDYvoXm8OOYNbaCxd0gAHKMTRH5PtFUOuiyrbiUjTsAANzIzv7ZBinrv/iYx2QVsvisHvbplyyFtkY2/LOPg4J2p0xmtBuK18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com; spf=none smtp.mailfrom=anyfinetworks.com; dkim=pass (2048-bit key) header.d=anyfinetworks-com.20230601.gappssmtp.com header.i=@anyfinetworks-com.20230601.gappssmtp.com header.b=YgvaYNDs; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=anyfinetworks-com.20230601.gappssmtp.com header.i=@anyfinetworks-com.20230601.gappssmtp.com header.b="YgvaYNDs"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-299566373d4so1742785a91.1
        for <loongarch@lists.linux.dev>; Tue, 20 Feb 2024 00:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anyfinetworks-com.20230601.gappssmtp.com; s=20230601; t=1708419384; x=1709024184; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dchRxoxVGKioFcq/L4EKVcfcET3Jr75StrPrjuqQjL0=;
        b=YgvaYNDsh4I8ZNjXjh5lUatuz5qwAi5Y5DiwzHoaq45G9YKj9OgkdyR8f+aZ+v1gds
         /39nypygG5JLaIQUBIPeweR0FOxzLHgEK4OpE+wN3358yyYmEcXE1dZ/NWvKE7Kwlec7
         Vg+//tnwWY/6Rp+p8K4xKequ5ujjeB+zy+CJceM9atS83OkdQRV52mZr4AYYpBG8a0C0
         3Cw/w7Oc252TOh4tWI5H5ucjLHEjigisgbhGdf1c5hi1qfPDd/ExViFJLxFl1YOH37UC
         yaUqYPQDFYOIlp1JWIRcADedu4RDTI6Dm4yX3uEHKtMDKTPRxrWGA8BSwb2R79zF2Ae4
         lQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708419384; x=1709024184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dchRxoxVGKioFcq/L4EKVcfcET3Jr75StrPrjuqQjL0=;
        b=TiApzLP9P35uY5MG/0Gu+FxSL60HJIzi5CvhRFzbpc38wqSo1KWGLep2RQjC4CAnL/
         H/O5GXMxPMcsJTUbHhdwcR0pZz79xswGZ19nhiP9nhmybLg+0hbOwGnzBnUuABhgMoWD
         PopTl1DRpv+ql3VA2LHCha+dOGhPQXmMlC2KajmZOg2drlL45O14cxzlCBywob9DKjK8
         QH9GeF52nm+uaw+TzpXK4UxGN2vBJY9tSJ17Io7nLRU4yhBQN9U8E1loQwPwZ6riHMai
         QEcp1m2Nkt4C7g1MSoOrQuHjoeO9uqgvFeXmbAh+K15Vrb6bMdaXb0hqW3B+SfbTrOpo
         FG/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKkj7eZwdvvTkFBxW4RsBhhbQOS5+xoDQbDIXH9bs8ziEF1PB/GlOm8Q0+5T2nYAH6TjvVirpU4knx4x3pNgu3PXi+F2ecyxDQ
X-Gm-Message-State: AOJu0Yxgyu0+lo+cyWweXjaw3QUpnln3Yp/EtYnTuoJsFSgKjxsaUkmB
	QFxqBvU9htu0wIAU41btZQoGo1MzZ7OSCm4GwWJLOT0vNFWcX5ImM+MzjCF7b4PbEVeopsFq5JW
	z43JPLWHfdjfxm49l1bDrOKsJiORdy8leutGOuA==
X-Google-Smtp-Source: AGHT+IHl7TYiCYsEXMrh4VmDGMZtMQoKh4DXw10jPMT7TOqjy20gTUqscrvJKqfiSDRCNiwo83Vx2RGvwz2GtNa0WA4=
X-Received: by 2002:a17:90a:34cf:b0:299:5b95:cd7d with SMTP id
 m15-20020a17090a34cf00b002995b95cd7dmr4504419pjf.45.1708419384629; Tue, 20
 Feb 2024 00:56:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <135feeafe6fe8d412e90865622e9601403c42be5.1708253445.git.christophe.leroy@csgroup.eu>
 <ec35e06dbe8672a36415ebe2b9273277c2921977.1708253445.git.christophe.leroy@csgroup.eu>
In-Reply-To: <ec35e06dbe8672a36415ebe2b9273277c2921977.1708253445.git.christophe.leroy@csgroup.eu>
From: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Date: Tue, 20 Feb 2024 09:56:13 +0100
Message-ID: <CAM1=_QTF1amgOZUWJ4BA872RW3DE_papO5yi7ak+-WCkBfvC5g@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/2] bpf: Take return from set_memory_rox() into
 account with bpf_jit_binary_lock_ro()
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Puranjay Mohan <puranjay12@gmail.com>, Zi Shen Lim <zlim.lnx@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Hengqi Chen <hengqi.chen@gmail.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Paul Burton <paulburton@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Wang YanQing <udknight@gmail.com>, 
	David Ahern <dsahern@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
	netdev@vger.kernel.org, Kees Cook <keescook@chromium.org>, 
	"linux-hardening @ vger . kernel . org" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 18, 2024 at 11:55=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> set_memory_rox() can fail, leaving memory unprotected.
>
> Check return and bail out when bpf_jit_binary_lock_ro() returns
> and error.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> Previous patch introduces a dependency on this patch because it modifies =
bpf_prog_lock_ro(), but they are independant.
> It is possible to apply this patch as standalone by handling trivial conf=
lict with unmodified bpf_prog_lock_ro().
> ---
>  arch/arm/net/bpf_jit_32.c        | 25 ++++++++++++-------------
>  arch/arm64/net/bpf_jit_comp.c    | 21 +++++++++++++++------
>  arch/loongarch/net/bpf_jit.c     | 21 +++++++++++++++------
>  arch/mips/net/bpf_jit_comp.c     |  3 ++-
>  arch/parisc/net/bpf_jit_core.c   |  8 +++++++-
>  arch/s390/net/bpf_jit_comp.c     |  6 +++++-
>  arch/sparc/net/bpf_jit_comp_64.c |  6 +++++-
>  arch/x86/net/bpf_jit_comp32.c    |  3 +--
>  include/linux/filter.h           |  4 ++--
>  9 files changed, 64 insertions(+), 33 deletions(-)

For the MIPS part:
Reviewed-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>

Thanks,
Johan
