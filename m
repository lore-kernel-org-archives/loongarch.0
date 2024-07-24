Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEB9157E6C
	for <loongarch@lists.linux.dev>; Wed, 24 Jul 2024 14:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721832981; cv=none; b=guw8oJ3TQ+p2DL3OmNMFZj5yzyAP4YBWmaFCWPF01eVgzqlik8a7QRIEKZe9BDFV6/xA3bGRf0S4hs5xZWlvI+RgHewZbrNhc2BWWKVtbVnIRqhI3AW8Xm+j2HBvDYZqaj0MBlTYTUV5V8HSKtNuhtgBr9KY5t2UGBLqzDSYphs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721832981; c=relaxed/simple;
	bh=wEc4sfYdM/LDlf6d8P9ptAilQ8A+tzuEnx1XZqff1v4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W7p7SDyafegHEYlyeJVC4TmKW1y98cBmcn6WxMKsGEMgTigeni2RYBRkyxI47MVC4b7Bpmb5cAYrhdIdpyfKcePGjkcwAB12/b7HyAA0XeDoNMegz76RkOm6aJ0cGwbXIb3FWrXoE6s5TeuOLx0kqlYEawrqS0uJNaoa6vAyRQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MijcAp+m; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MijcAp+m"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f025b94e07so21991361fa.0
        for <loongarch@lists.linux.dev>; Wed, 24 Jul 2024 07:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721832978; x=1722437778; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+VhvI5u25K1G3SguH2FXDNPUbfkufH9rbAjCZBWkOc=;
        b=MijcAp+mXLwOPvzFCmU7GJLgCvuujLUW+W1qS0am0D4dhAMj3Ak9wjmsrXPv5ktWdf
         iWBbHWqBaWecgKX3N6+Ij9esfshNzsZvwfqRbwoqMeP1X7Hc4/lhSDcrmhrGwHOkM3LK
         P5eLCwom8jmeoQMTdbrUWRrs9MRDXr8plNbU2w4NZ8kaFOoghy7LG+No16tIu8wQo++D
         yBC3DnCPJo1iJJJFnPzSzWZiBQIh4XttcD2CxuOdwjeBEeVXu7ptnn47/qFjXD4Rb6YM
         ZKFzDdG4Tx/211Sy7MhzMXBxGacSZ9/ffKTT5UdUk+T9M/Gvp4GazcZ5Y4CaSxS+OcVZ
         ZfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721832978; x=1722437778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+VhvI5u25K1G3SguH2FXDNPUbfkufH9rbAjCZBWkOc=;
        b=wUmjuYwNJLXhBiWR/fRTMyCc79dIV0nxpG2+E7fGx5y4aATK5OVH4E2lzTIcG4irhK
         Yx8TOnCeg5Bcm8I8WymNM/7IXjDG8bosVWP6Ly5KKpvn/qs5rJ+r0iYrWqDQm47M6djg
         /wx7wkZ7p172uUdXVEne9URXsIggpbyjySIhB8Key1FGm4wq15AghEdyv5o/0T3vO/kF
         hpxRDYFTp4sQBQRJbHwW4Cl+cy+m7BeZB2m8FEJEhszVgEZR7q1YrkwZEvm5gIFbZQ3t
         PRJWAt1U1iZcbyycFyPFXD0S6yboj9fHWHXeRVCIB8eUvqQrVa6nmdGYvcQwUTV0iq+h
         h9YQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdxhDK03xT1hJx34HkB8qepxcJDiTju8tnGzsiqSIOoE2y4FKenkNlzr9k9l2o3klqXhc3TIWkeke1zBlyKp1nnEb/AK7QAgtJ
X-Gm-Message-State: AOJu0Yxy4CWGkOVkV/C5dUpesR9rn1QgESxbKyQhS4bIh1exsckfp1k3
	Rmuznsq+9ZX8g+12K359nX49PhYqGDzPAxvwmGngvRXOynve+pEqcLbjjqm9DrtVoBf22wBjDFR
	vO6RGUbovuwheOsjON6A2WlItCws=
X-Google-Smtp-Source: AGHT+IEyt9/jKgY9GG2CTk2DQKwL+zQsHX8gmCjTh3r6yrd9E+GdYPop3MLBHAvwRY0udPYlhm2AykNPFdpZ5YxlgWA=
X-Received: by 2002:a05:6512:1114:b0:52e:91ff:4709 with SMTP id
 2adb3069b0e04-52efb63f078mr9627053e87.21.1721832976976; Wed, 24 Jul 2024
 07:56:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1718268003.git.haibo1.xu@intel.com> <mhng-e0773c11-559a-4f64-a1ad-4a234993ccfc@palmer-ri-x1c9>
In-Reply-To: <mhng-e0773c11-559a-4f64-a1ad-4a234993ccfc@palmer-ri-x1c9>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 24 Jul 2024 22:56:05 +0800
Message-ID: <CAJve8omqqpLLPz7QEuC1s+jai9YeisTKgeTMZfRnAN+=WdhhbA@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Add ACPI NUMA support for RISC-V
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: haibo1.xu@intel.com, Sunil V L <sunilvl@ventanamicro.com>, 
	Arnd Bergmann <arnd@arndb.de>, ajones@ventanamicro.com, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, chenhuacai@kernel.org, 
	kernel@xen0n.name, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	rafael@kernel.org, lenb@kernel.org, Greg KH <gregkh@linuxfoundation.org>, 
	Conor Dooley <conor.dooley@microchip.com>, akpm@linux-foundation.org, 
	Charlie Jenkins <charlie@rivosinc.com>, bhe@redhat.com, Evan Green <evan@rivosinc.com>, 
	cleger@rivosinc.com, zong.li@sifive.com, samitolvanen@google.com, 
	alexghiti@rivosinc.com, samuel.holland@sifive.com, chenjiahao16@huawei.com, 
	rmk+kernel@armlinux.org.uk, jszhang@kernel.org, james.morse@arm.com, 
	andy.chiu@sifive.com, Marc Zyngier <maz@kernel.org>, tglx@linutronix.de, 
	tony.luck@intel.com, Ard Biesheuvel <ardb@kernel.org>, dan.j.williams@intel.com, 
	alison.schofield@intel.com, Jonathan.Cameron@huawei.com, rrichter@amd.com, 
	ytcoode@gmail.com, dave.jiang@intel.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2024 at 10:50=E2=80=AFPM Palmer Dabbelt <palmer@dabbelt.com=
> wrote:
>
> On Thu, 13 Jun 2024 01:54:32 PDT (-0700), haibo1.xu@intel.com wrote:
> > This patch series enable RISC-V ACPI NUMA support which was based on
> > the recently approved ACPI ECR[1].
> >
> > Patch 1/4 add RISC-V specific acpi_numa.c file to parse NUMA informatio=
n
> > from SRAT and SLIT ACPI tables.
> > Patch 2/4 add the common SRAT RINTC affinity structure handler.
> > Patch 3/4 change the ACPI_NUMA to a hidden option since it would be sel=
ected
> > by default on all supported platform.
> > Patch 4/4 replace pr_info with pr_debug in arch_acpi_numa_init() to avo=
id
> > potential boot noise on ACPI platforms that are not NUMA.
> >
> > Based-on: https://github.com/linux-riscv/linux-riscv/tree/for-next
>
> No big deal, but that's not actually my repo.  Looks like it's just
> mirroring something, I use the kernel.org git stuff these days.  I
> dropped it from the cover letter for the merge, it's not super useful
> anyway because it's a branch so nobody will know what it means later.
>
> Aside from that things look good, I've got this queued up for the
> tester.
>

Thanks!

> >
> > [1] https://drive.google.com/file/d/1YTdDx2IPm5IeZjAW932EYU-tUtgS08tX/v=
iew?usp=3Dsharing
> >
> > Testing:
> > Since the ACPI AIA/PLIC support patch set is still under upstream revie=
w,
> > hence it is tested using the poll based HVC SBI console and RAM disk.
> > 1) Build latest Qemu with the following patch backported
> >    https://github.com/vlsunil/qemu/commit/42bd4eeefd5d4410a68f02d54fee4=
06d8a1269b0
> >
> > 2) Build latest EDK-II
> >    https://github.com/tianocore/edk2/blob/master/OvmfPkg/RiscVVirt/READ=
ME.md
> >
> > 3) Build Linux with the following configs enabled
> >    CONFIG_RISCV_SBI_V01=3Dy
> >    CONFIG_SERIAL_EARLYCON_RISCV_SBI=3Dy
> >    CONFIG_NONPORTABLE=3Dy
> >    CONFIG_HVC_RISCV_SBI=3Dy
> >    CONFIG_NUMA=3Dy
> >    CONFIG_ACPI_NUMA=3Dy
> >
> > 4) Build buildroot rootfs.cpio
> >
> > 5) Launch the Qemu machine
> >    qemu-system-riscv64 -nographic \
> >    -machine virt,pflash0=3Dpflash0,pflash1=3Dpflash1 -smp 4 -m 8G \
> >    -blockdev node-name=3Dpflash0,driver=3Dfile,read-only=3Don,filename=
=3DRISCV_VIRT_CODE.fd \
> >    -blockdev node-name=3Dpflash1,driver=3Dfile,filename=3DRISCV_VIRT_VA=
RS.fd \
> >    -object memory-backend-ram,size=3D4G,id=3Dm0 \
> >    -object memory-backend-ram,size=3D4G,id=3Dm1 \
> >    -numa node,memdev=3Dm0,cpus=3D0-1,nodeid=3D0 \
> >    -numa node,memdev=3Dm1,cpus=3D2-3,nodeid=3D1 \
> >    -numa dist,src=3D0,dst=3D1,val=3D30 \
> >    -kernel linux/arch/riscv/boot/Image \
> >    -initrd buildroot/output/images/rootfs.cpio \
> >    -append "root=3D/dev/ram ro console=3Dhvc0 earlycon=3Dsbi"
> >
> > [    0.000000] ACPI: SRAT: Node 0 PXM 0 [mem 0x80000000-0x17fffffff]
> > [    0.000000] ACPI: SRAT: Node 1 PXM 1 [mem 0x180000000-0x27fffffff]
> > [    0.000000] NUMA: NODE_DATA [mem 0x17fe3bc40-0x17fe3cfff]
> > [    0.000000] NUMA: NODE_DATA [mem 0x27fff4c40-0x27fff5fff]
> > ...
> > [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> HARTID 0x0 -> Node 0
> > [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> HARTID 0x1 -> Node 0
> > [    0.000000] ACPI: NUMA: SRAT: PXM 1 -> HARTID 0x2 -> Node 1
> > [    0.000000] ACPI: NUMA: SRAT: PXM 1 -> HARTID 0x3 -> Node 1
> >
> > ---
> > Changes since v3
> >   - Rebase to linux-riscv/for-next(Linux 6.10-rc1)
> >   - Remove original patch 1/6 since it had been merged through
> >     ACPICA pull(commit fe1c408d50604f)
> >   - Remove original patch 4/6 since the related changes was
> >     introduced in commit 3a785e19f43267
> >
> > Haibo Xu (4):
> >   ACPI: RISCV: Add NUMA support based on SRAT and SLIT
> >   ACPI: NUMA: Add handler for SRAT RINTC affinity structure
> >   ACPI: NUMA: change the ACPI_NUMA to a hidden option
> >   ACPI: NUMA: replace pr_info with pr_debug in arch_acpi_numa_init
> >
> >  arch/arm64/Kconfig            |   1 -
> >  arch/loongarch/Kconfig        |   1 -
> >  arch/riscv/include/asm/acpi.h |  15 +++-
> >  arch/riscv/kernel/Makefile    |   1 +
> >  arch/riscv/kernel/acpi.c      |   5 --
> >  arch/riscv/kernel/acpi_numa.c | 131 ++++++++++++++++++++++++++++++++++
> >  arch/riscv/kernel/setup.c     |   4 +-
> >  arch/riscv/kernel/smpboot.c   |   2 -
> >  drivers/acpi/numa/Kconfig     |   5 +-
> >  drivers/acpi/numa/srat.c      |  32 ++++++++-
> >  drivers/base/arch_numa.c      |   2 +-
> >  include/linux/acpi.h          |   6 ++
> >  12 files changed, 187 insertions(+), 18 deletions(-)
> >  create mode 100644 arch/riscv/kernel/acpi_numa.c
