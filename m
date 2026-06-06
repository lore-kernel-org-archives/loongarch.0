Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067302571C0
	for <loongarch@lists.linux.dev>; Sat,  6 Jun 2026 14:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780754653; cv=none; b=Au7rZpcfdAG1xcWpXKka0M2j04DtPEvgBBCHFJycb45fRrjnXLn63rdgtxvo3T6cFXdYGj5CL0lVMjbjZM8Cztx59EmIaAvYR3rWoB5ebekAzuPStOraV0IUWto9UNskMCaeVjBbgdNULab4IUPGgz/MuRXCsCyp4tThSVzG8qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780754653; c=relaxed/simple;
	bh=C8dlFQ5YgK3Nw5CB1pS4tpTlT09ZFCRoiX18Dhbz7MA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r8iwpZtbe4swfhSTDjWgOXYmC1XEPtWgxW5D6sTHMZBgMEB2sm6aixu1uoihAe3uE36Bc2Q2zLxekbR3D8ITk7UqWBr7X9uxfA4S065j5T8CY8dTgAjw4cgZOBqNq3DkDDIj67UWhQ0gGdWu4YvIrIkhPt6h92KA3vrjW50jVlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOrte4/u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOrte4/u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3F11F00899
	for <loongarch@lists.linux.dev>; Sat,  6 Jun 2026 14:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780754652;
	bh=ihY2rMWabYDAS/keW+2j5/bI5YSsfAFybf+7PasNwMs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KOrte4/ueSwYkyKfJ8JP653P+p4eXENmBJzqbDdq9OeJI5Ejh1G8wklhuJgQhMOoM
	 92ZfmEnJ+CearV32XuYah+Ko4K713OJiJ+7HuQBLvLohv0r5obIZMd6M3CkLTFrZOJ
	 L1P12kW+54CNFAUaCYLapXyP82ltaVv974kewd/jSKaWM7GLauzYmUPB2qxhdDmGwI
	 3y0xwfLwDUyQysPVlYjUsImDv/hq/+eFVAwBSzjAsQX7B3ZwC+gwgILYllWTVg97/I
	 p/Mfj7c7zcXLKfPfqT09Upwas/wQ8WjdZEPbLdfXRhsAPzIKBVJWcpmRS6Kb6cZeFI
	 9Dpx8uG8Nqc8w==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-68c76fb8009so3576585a12.0
        for <loongarch@lists.linux.dev>; Sat, 06 Jun 2026 07:04:12 -0700 (PDT)
X-Gm-Message-State: AOJu0YxLtt0uueUoesQLM87g7jSDf7OEoc2bCFq8m8Q9AicZwCx8ncCG
	NgKRwDqx4yNlrOr8sqZaoKVatnUO+CxF33jWh96/IDc78G1p7C6LzEMxLqvmZ+b85cDxVDMJxdP
	R45LfzANpiV5cOCyqz353VPemNvolwzk=
X-Received: by 2002:a17:907:72c9:b0:bdb:b76c:4dd0 with SMTP id
 a640c23a62f3a-bf3733075b0mr420678966b.40.1780754651038; Sat, 06 Jun 2026
 07:04:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260606132126.562034-1-haoran.jiang@linux.dev>
In-Reply-To: <20260606132126.562034-1-haoran.jiang@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 6 Jun 2026 22:04:01 +0800
X-Gmail-Original-Message-ID: <CAAhV-H69RhiGRHO_eBzkU-aWdV92r6LnnbV1pptph85qboArgQ@mail.gmail.com>
X-Gm-Features: AVVi8CdwVoN4k8Vs1UXtw_PsHzW11Tv1LyECB2eDzGGceO8RISaICGoPtrZqiJA
Message-ID: <CAAhV-H69RhiGRHO_eBzkU-aWdV92r6LnnbV1pptph85qboArgQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Enable STRICT_MODULE_RWX
To: haoran.jiang@linux.dev
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, kernel@xen0n.name, 
	akpm@linux-foundation.org, jbohac@suse.cz, kees@kernel.org, 
	yangtiezhu@loongson.cn, Haoran Jiang <jianghaoran@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Haoran,

On Sat, Jun 6, 2026 at 9:21=E2=80=AFPM <haoran.jiang@linux.dev> wrote:
>
> From: Haoran Jiang <jianghaoran@kylinos.cn>
>
> Enable STRICT_MODULE_RWX on LoongArch and
> Move fixmap page tables to BSS segment.
As discussed before, we don't need to change fixmap, we can just use
set_memory() API, similar as done in larch_insn_text_copy().

Huacai

>
> Haoran Jiang (2):
>   LoongArch: Move fixmap page tables to BSS segment
>   LoongArch: Enable STRICT_MODULE_RWX for stricter modules memory
>     permissions
>
>  arch/loongarch/Kconfig              |  2 +
>  arch/loongarch/include/asm/fixmap.h |  2 +
>  arch/loongarch/kernel/inst.c        | 29 +++++++++++-
>  arch/loongarch/kernel/setup.c       |  1 +
>  arch/loongarch/mm/init.c            | 71 ++++++++++++++++++++++++++---
>  5 files changed, 98 insertions(+), 7 deletions(-)
>
> --
> 2.25.1
>
>
