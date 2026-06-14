Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A7163B9
	for <loongarch@lists.linux.dev>; Sun, 14 Jun 2026 02:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781405471; cv=none; b=DVJtu5k3mdsEz7AQK6zEb/j9TWIX9j7FW+xuXW1sJC3LCmzQIwhKbJrHCEKqcwoFJ/9ZWRK3Waa7r7SPQXbo3HNfhe19CteUzdd+eyNTbo09mfK5C55WWMrBaB9/JEMq0I1PvGcDkYzRJaEQRRESArkdMFt/RB1nbCnlAr4CukA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781405471; c=relaxed/simple;
	bh=gg7dpLrmLc7oiiuhaL1cHZuaxegy00uI7onhcqKxofo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LXDReiZ5URPgnTxPHA+NBAkV17JMWPZjtBfmt9GlbIV5L021Tc8ai1ZstHKGyZMzEZICOJBvyLGUVlE2lMPgD4PYjsOvctC0/SNPeImNXZ3acZkDSYQDGaVqusMW725Uv4kf26ijkVpLnCcNd7im84ahEaJtCv65iTReM5CodS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ifpPTiwc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ifpPTiwc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72F021F00A3D
	for <loongarch@lists.linux.dev>; Sun, 14 Jun 2026 02:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781405470;
	bh=zsOFJiQWZo2PUzZwgIwveMuD9BU2S6/VAbRPL9C2H2I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ifpPTiwcBd4dDy/jXvQTJsoz1cjK0pIFhHSaI0qvf9ETP7wkhKwXsGBLzkbn5+Suy
	 mzRiCRe3W9DdiZSFFTtn9WMcItHAhYRVxp5/W5Wfu04nv+bH46lQutQrQ5YZVb8N4E
	 JjwP7jdLI9U1XsILyZClJ4+LIpCiX9+TLj4WPW8ZElMm5sA3I2WklrR/YQ++4/BAXR
	 jP5seQexvwSj06qo/VICfQINoz5toTrW2J0QDSuRbYlAaQAUEbj6/nE+b38dhoMJxP
	 JaIiYVLG9mxpmFlucGhVhYrkz8GkTRPrgQHCZCc8Fe+SAF+B9rNFN3Je7XArri3jdj
	 9UpaABXgmW2tA==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-692491fec0bso3618480a12.2
        for <loongarch@lists.linux.dev>; Sat, 13 Jun 2026 19:51:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8bugXjDLnHgLnch9I66lLvPM1OmPUcEG/eChn52wNZAuU/Wu9ABWZPAifwx0rJ5fvsYyTkYRwrZXI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzyPC4U0gYx6nycTkdowSHXcKAgaQYz2gG27Il55cei6/JlmFVu
	TVN/aJZDK27mqwa9Y2Qq5NdnzAXFwnzgB8oliM8Xusr7oBQOdUwxpb19xzunR5vQXIxuwqmLWls
	82PcvUpNP2HDx+Bb/95Hnom4xXaAmXYg=
X-Received: by 2002:a05:6402:ea9:b0:691:3fb2:2172 with SMTP id
 4fb4d7f45d1cf-693788fa1d3mr3530698a12.3.1781405468983; Sat, 13 Jun 2026
 19:51:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612011616.27771-1-yangtiezhu@loongson.cn>
In-Reply-To: <20260612011616.27771-1-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 14 Jun 2026 10:51:32 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4daHGFoAiXrwcNXj=T1kZm5jRRwd_sCiv7ksjR2ynHgw@mail.gmail.com>
X-Gm-Features: AVVi8CegOAzFfmmxV07n83RvAu6ldqrUGS5b4IQcKcHgluUfVlLTDQW772jxAwA
Message-ID: <CAAhV-H4daHGFoAiXrwcNXj=T1kZm5jRRwd_sCiv7ksjR2ynHgw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Move thread_info into task_struct for LoongArch
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Hengqi Chen <hengqi.chen@gmail.com>, loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tiezhu,

I have queued this series for 7.2, does the below series depend on this one=
?

https://lore.kernel.org/loongarch/20260521125636.26744-1-yangtiezhu@loongso=
n.cn/T/#t
https://lore.kernel.org/loongarch/20260428080051.20938-1-yangtiezhu@loongso=
n.cn/T/#t

Huacai

On Fri, Jun 12, 2026 at 9:16=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> Based on 7.1-rc7, tested with stress-ng, successfully passed
> the 10-hours stress testing suite, and UnixBench benchmarking
> shows a steady performance lift across all core counts.
>
> Thanks Huacai, Wang Rui, sashiko-bot and bot+bpf-ci for your
> review comments and valuable suggestions.
>
> Tiezhu Yang (3):
>   LoongArch: Implement CONFIG_THREAD_INFO_IN_TASK
>   LoongArch: BPF: Inline bpf_get_current_task{_btf}() helpers
>   LoongArch: BPF: Inline bpf_get_smp_processor_id() helper
>
>  .../core/thread-info-in-task/arch-support.txt |  2 +-
>  arch/loongarch/Kconfig                        |  1 +
>  arch/loongarch/include/asm/current.h          | 31 +++++++++++++++++++
>  arch/loongarch/include/asm/smp.h              |  3 +-
>  arch/loongarch/include/asm/stackframe.h       |  9 ++++--
>  arch/loongarch/include/asm/switch_to.h        |  6 ++--
>  arch/loongarch/include/asm/thread_info.h      | 10 ------
>  arch/loongarch/kernel/asm-offsets.c           |  6 ++--
>  arch/loongarch/kernel/entry.S                 |  7 +++--
>  arch/loongarch/kernel/head.S                  | 18 ++++++-----
>  arch/loongarch/kernel/process.c               |  2 ++
>  arch/loongarch/kernel/relocate.c              |  2 +-
>  arch/loongarch/kernel/setup.c                 |  1 +
>  arch/loongarch/kernel/smp.c                   |  6 ++--
>  arch/loongarch/kernel/switch.S                | 14 +++++----
>  arch/loongarch/kernel/traps.c                 |  8 +++++
>  arch/loongarch/net/bpf_jit.c                  | 26 ++++++++++++++++
>  17 files changed, 114 insertions(+), 38 deletions(-)
>  create mode 100644 arch/loongarch/include/asm/current.h
>
> --
> 2.42.0
>
>
