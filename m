Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6C463AE
	for <loongarch@lists.linux.dev>; Wed, 27 Dec 2023 06:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b9UL+bsh"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dbd722b55afso3380559276.2
        for <loongarch@lists.linux.dev>; Tue, 26 Dec 2023 22:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703657112; x=1704261912; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kEKjovWuYxpJqS1fAk7+OKeuiHleqNwWwut073yxsFg=;
        b=b9UL+bsh2/HLUKizs/foZa55OSsIf1ZQJ+9GKgj+YUN5cZTGkNeet+WZFnikp1JoRB
         o0stTxg/a2DGw/xh2+iT+b98vNY2vY2Bp+aiJL3j5lZalbbvrDHJAt4ZIMg6j8zJ9hat
         MUor5M+9OfSfHNbRI2cayqZm6tKLUUtKRnwi/sLBn6EsesYgGROmGiC/drCOBD0VGFp9
         WIj93wID/lDlpUvHyE5spUtH278MQjUboygMcZ876cGIE7AK1FiS6KussLD/UGmN8fhc
         ruPCmhpfYy3L2Sc1aPt33JnsuI7nDPoTBRcf5iye1h1OmznEaElhdvXWlwoNgbZPIZc4
         flLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703657112; x=1704261912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kEKjovWuYxpJqS1fAk7+OKeuiHleqNwWwut073yxsFg=;
        b=w9xOMKuV6hIHK0HKbydKlh/pUUa5iILLc7Hk31zFCm8hC2b5dWf3TrkHmg5kqXzFAM
         uVqoIMTNxi90zpSHbQ5+q8XIPBkGojAQ1IuqQkTo6sqgtBi2bGt7jcndl7hixSdjxrwD
         eDwW37md8pj7Y+nt9/RQaU0ss10daEdp4OEDNNxKZg50pcmb7x5yCH9eROkhtU4AmuxZ
         KfJegaeVKAl/QPAa+CRqAfGXA0anR6w4DsKpZfmZxJTI93l/tKbartRXjAzRgLJIpU8m
         UQ7ow3V2HGxOIBUbrhuIX7/yXCNpAfPDsty1MMhTCbCBPykJ/1Z4OsWaaz1zZCXcmtJm
         xAoA==
X-Gm-Message-State: AOJu0YwcA2RVBT2pz9zI5KLP0FjIgQgQJ4q2s0+EhoH2Z11SshtMWa13
	dicN2beE/LnS6iC+r6FUXoeRkS9AAiwac2vr0hY=
X-Google-Smtp-Source: AGHT+IFGTodi7r7DuXwFGu6dkeX67vCAZ7BuZa9KAVTGY4nyX6+mi8TiSd5HJFeEIPZVQY7fkz3alsEK7qDgczU4nqM=
X-Received: by 2002:a05:6902:e02:b0:dbd:d73f:7cd7 with SMTP id
 df2-20020a0569020e0200b00dbdd73f7cd7mr4398976ybb.70.1703657112484; Tue, 26
 Dec 2023 22:05:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1703229766.git.zhoubinbin@loongson.cn> <20231222-support-relieve-5d8f25292b40@spud>
In-Reply-To: <20231222-support-relieve-5d8f25292b40@spud>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 27 Dec 2023 12:04:59 +0600
Message-ID: <CAMpQs4+Uwu=j56Qa_V211_hC+F4MKE6mvTVtW75M1wuAY3-p1g@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] LoongArch: Add built-in dtb support
To: Conor Dooley <conor@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Hongliang Wang <wanghongliang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor:

Sorry for the late reply.

On Fri, Dec 22, 2023 at 9:39=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> Hey Binbin,
>
> On Fri, Dec 22, 2023 at 04:00:43PM +0800, Binbin Zhou wrote:
> > Hi all:
> >
> > This patchset introduces LoongArch's built-in dtb support.
> >
> > During the upstream progress of those DT-based drivers, DT properties
> > are changed a lot so very different from those in existing bootloaders.
> > It is inevitably that some existing systems do not provide a standard,
> > canonical device tree to the kernel at boot time. So let's provide a
> > device tree table in the kernel, keyed by the dts filename, containing
> > the relevant DTBs.
> >
> > We can use the built-in dts files as references. Each SoC has only one
> > built-in dts file which describes all possible device information of
> > that SoC, so the dts files are good examples during development.
> >
> > And as a reference, our built-in dts file only enables the most basic
> > bootable combinations (so it is generic enough), acts as an alternative
> > in case the dts in the bootloader is unexpected.
> >
> > In the past while, we resolved the DTC_CHK warning for the v4 patchset,
> > and the relevant patchset has either been applied or had the
> > Reviewed-by tag added.
>
> I notice you dropped the topology information from all patches in the
> series, not only the 2k0500 patch that only has one CPU. I didn't see a
> response to my comments the kernel being able to assemble the topology
> based on the second level caches using the generic topology code for the
> systems that have more than one cpu. With the cpu-map information
> dropped, do the multi-cpu systems have their topologies assembled
> correctly by the kernel?

As we saw previously, our DT-based system only supports single cluster
cpu{s}, and multi-cluster cpu is not going to be in our plans.

> You mentioned that there is an instruction that allows you to get
> information about i and d caches etc, so adding them to the DT is not
> required, but does it also cover the next level caches?

Firstly, sorry for my previous mistake about the cache reads.
`cpucfg` is actually a set of registers that describes the features of
the cpu, including the CPU cache [1].
`populate_cache_properties()` reads all levels of cache information
[2], including of course `next cache` if it exists.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/arch/loongarch/include/asm/loongarch.h#n765
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/arch/loongarch/mm/cache.c#n94

> The program that I am familiar with for displaying this information
> is hwloc: https://github.com/open-mpi/hwloc
>

Ah, yes, I tried looking at the `hwloc-ls` output before committing,
and it's below(LS2K1000):

[root@fedora ~]# hwloc-ls
Machine (7730MB total)
  Package L#0
    NUMANode L#0 (P#0 7730MB)
    L2 L#0 (1024KB)
      L1d L#0 (32KB) + L1i L#0 (32KB) + Core L#0 + PU L#0 (P#0)
      L1d L#1 (32KB) + L1i L#1 (32KB) + Core L#1 + PU L#1 (P#1)

It's the same as what we actually have.

Thanks.
Binbin
> Cheers,
> Conor.
>
