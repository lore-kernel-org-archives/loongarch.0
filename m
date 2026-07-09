Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216FF3E9C3C
	for <loongarch@lists.linux.dev>; Thu,  9 Jul 2026 09:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783588273; cv=none; b=A64+1fSsUjpG633qfRa6rhcaG7hMZqciB2rp6EG35rjrj8V4k85q6aM9tEE4/4O6opnm03/iJYDRH9rb+cLsd13smob7en1CyqaI4WinQz7SFlMXFY5aPa1sUqagAQ5gCaf7mfQE0DKNLSVqkQljlINGnul9nGOqI+EJNuBN5as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783588273; c=relaxed/simple;
	bh=NP4eMQU9PT/zd94PDV053+cPPvM2aP+fxOpL2b9URFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MNdq9reTqn+uiz+HmWtgfy34Vd0VW/qFdNnBNd1CkjxCiij0lkMABQa+M+HKaxsjdt2BKMZUKJtvZoHldCkoYIo3p8KAKmu0YlDYktqD7iD/p1/1QyupvID2+DZoJTKgB+sQQIL7syyi5WPlgXBU2AzttAMD3x+5JLoQZvl0cC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UwJM8/C6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UwJM8/C6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB22D1F00A3E
	for <loongarch@lists.linux.dev>; Thu,  9 Jul 2026 09:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783588271;
	bh=gR+QAL/WiiMkgGZMsvP1Z/jsw3bpbKqGcBCjnBdyIlc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UwJM8/C6hjL9FBuP7Mj04Euk4+hq4oUTE9BMMQ5Vrq494lvDcRkRnhpAsdKiBKtRW
	 hpPl5qByPHb3iGFnn7haNR7bT51QrRJggMvbPOBLWF4CBPLndJ11Iwo0CES+31bJ4c
	 szj3YBJ3MLDMxuP+859dgFbjPIE2BBbSxuaZ49sLyZvPCQODbjHg67mbX+wPwwgngm
	 0XizsbG2TlimD1jL9Cs/lIhrAoJuc0ooZQPgMl+6REqPnZTNJ6JnEc4SXRKNqjQL1p
	 f5NSbD1JZYqgX+AKMEu0m9Zb+Utzu/JL0gg+BtOIcaZr3PnhFT++3GRY3G9nk2RCSm
	 fMLrWYN0qtL6A==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-68bd9fce347so3139457a12.2
        for <loongarch@lists.linux.dev>; Thu, 09 Jul 2026 02:11:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoVEixupbb1KJNy5DkPW+ICl2Dv6mU3StXfB2Gt0czmIhVGKI7r72QQWrdEflhfzWVWJaUqhvintWE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyqsMuHry51Irb6z7kX1kcmsgB8YsDCUB779SO7IfZSikuEKyIL
	Up8dL/xMFNOkTjTHix1kLV08jbqb5i0j6uk9ByMw3u7HjJiXvA/8TI5xWMSnQFDLPLSv7ZwdsJP
	sJ+FkbsBigvrDDi0joWm9RdULAL0VHbk=
X-Received: by 2002:a05:6402:5d0:b0:698:3365:f950 with SMTP id
 4fb4d7f45d1cf-69ab449d9b1mr2517052a12.21.1783588270450; Thu, 09 Jul 2026
 02:11:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260701155957.534779-1-dongtai.guo@linux.dev>
In-Reply-To: <20260701155957.534779-1-dongtai.guo@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 9 Jul 2026 17:11:34 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7S9_hPDFoCtzgfY9TeH_koN9NfKq9mo8y9BmLA5-7how@mail.gmail.com>
X-Gm-Features: AUfX_mw-J_OdSnOhcx8hpiENv7LyWcgVB1B-LCMMPWcvWcr0SNfHbuBObPnbLUw
Message-ID: <CAAhV-H7S9_hPDFoCtzgfY9TeH_koN9NfKq9mo8y9BmLA5-7how@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] LoongArch: kexec: avoid clobbering the QEMU FDT
To: George Guo <dongtai.guo@linux.dev>
Cc: maobibo@loongson.cn, loongarch@lists.linux.dev, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org, George Guo <guodongtai@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, George,

On Thu, Jul 2, 2026 at 12:00=E2=80=AFAM George Guo <dongtai.guo@linux.dev> =
wrote:
>
> This series fixes two ways the LoongArch kexec path can clobber the
> firmware-provided FDT that QEMU places at physical 0x100000, which made t=
he
> second kernel boot silently (earlycon auto-detection reads a corrupted FD=
T).
>
> Patch 1 moves the relocation trampoline off the hardcoded 0x100000 onto t=
he
> kexec core's control_code_page (as arm64/riscv do), so machine_kexec_prep=
are()
> no longer overwrites the FDT.
>
> Patch 2 removes the remaining fixed command-line address (KEXEC_CMDLINE_A=
DDR,
> 0x108000).  QEMU's machine FDT declares fdt_totalsize =3D 1MB and thus cl=
aims the
> whole [0x100000, 0x200000) upper half of the reserved 2MB, so 0x108000 li=
ves
> inside the FDT and only survives because the FDT's real content is small
> (~3.6KB) and 0x108000 falls in the trailing slack.  The command line is p=
assed
> to the second kernel in register a1, not at a fixed address, so it is loa=
ded
> into its own kexec segment instead, removing the overlap regardless of FD=
T
> size.
>
> This addresses the two questions raised on the v3 trampoline patch [1]:
>  - "how to avoid the cmdline overlapping FDT" -> patch 2.
>  - "how to avoid the control page being corrupted by the new kernel" -> t=
he
>    trampoline is executed only by the current kernel and is dead once the=
 new
>    kernel starts, so being overwritten afterwards is harmless; the kexec =
core
Who told you the trampoline is dead code? All non-boot CPUs are
running in the trampoline, you can use maxcpus=3D1 to go to the new
kernel, and do something, and then hotplug the non-boot CPUs at any
time.

The trampoline should live all the time for safety, ARM and RISC-V
both have the trouble, especially when memory is small.

And I don't want to hear "If others can do something but LoongArch
can't, then LoongArch has a drawback; if others can't do something but
LoongArch can, then it is useless".

BTW,  you have never replied to my comments, all you have done is
submit new versions again and again. Who told you to do things like
this? You want to take your ill code again and again, or your employer
counts the number of your E-mails in the mailist as the amount of your
work?



Huacai

>    also keeps the control page outside every relocation destination, so i=
t
>    cannot be corrupted during relocation.  The command line is different =
(it is
>    read by the new kernel), which is why only the trampoline uses the cor=
e page.
>
> Tested with tools/testing/selftests/kho/vmtest.sh on LoongArch (QEMU,
> kexec_file_load): the second kernel boots with the full command line and
> earlycon, and KHO restore succeeds.
>
> This series depends on [2] ("LoongArch: kexec: Fix address space mismatch=
 in
> command line lookup"), whose char head[] change patch 2 builds on.
>
> [1] https://lore.kernel.org/all/20260604114106.391502-1-dongtai.guo@linux=
.dev/
> [2] https://lore.kernel.org/all/20260701023747.56221-1-dongtai.guo@linux.=
dev/
>
> Changes in v4:
>  - Add patch 2: load the command line in its own kexec segment, dropping =
the
>    fixed KEXEC_CMDLINE_ADDR that overlaps the QEMU FDT (addresses the com=
mand
>    line concern from the v3 review).
>  - Patch 1 (relocation trampoline): drop the KEXEC_CMDLINE_ADDR comment a=
dded
>    in v3 that claimed 0x108000 does not overlap the FDT (it does; patch 2
>    removes the fixed address entirely).  No functional change otherwise.
>
> v3: https://lore.kernel.org/all/20260604114106.391502-1-dongtai.guo@linux=
.dev/
> v2: https://lore.kernel.org/all/20260601033820.38805-1-dongtai.guo@linux.=
dev/
> v1: https://lore.kernel.org/all/20260528135828.196953-1-dongtai.guo@linux=
.dev/
>
> George Guo (2):
>   LoongArch: kexec: use core control page for relocation trampoline to
>     avoid QEMU FDT conflict
>   LoongArch: kexec: load the command line in its own segment
>
>  arch/loongarch/include/asm/kexec.h         |  1 +
>  arch/loongarch/kernel/machine_kexec.c      | 38 ++++++++++------------
>  arch/loongarch/kernel/machine_kexec_file.c | 33 +++++++++++++++++--
>  3 files changed, 49 insertions(+), 23 deletions(-)
>
> --
> 2.25.1
>
