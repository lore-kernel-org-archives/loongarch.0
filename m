Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E37E36A351
	for <loongarch@lists.linux.dev>; Fri, 29 May 2026 04:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780028715; cv=none; b=S5TnaqVM7FE+ecNvbq2jw8gzTaM+1h9kxjFIznL3Qm4Hl2/dlVa2wOJsUvphfIPF29zmAyvux3OjSlNgGt4Z+tE8fSEljw0DZkKO1Z3sE/VCs/81yMKZaHriQ9C57+tBaeJYz9J38NgpEmLoRXK/vGAHoXYugcYyd6eKLfh5WB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780028715; c=relaxed/simple;
	bh=Lo4TIFSmYiHqiN4dotWbLHZrguJVn8UR7mEMLgo6BcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V9cz0EIf9zpdXTZnnJmkH8xNaH5mvuQ8iYYoL7vkGPIR7m2wxMEpQJwqavMkxZQDybor45XbJ9a1jTGhPSJXnuzTpBjRtzLl3XScWiNDlJveTvvp1hNAWp05G1mp1xgjh868ShtVDpq9kHLrl39FK1/ILCG3q5m04VIQmbGDfJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dT6nK7kh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dT6nK7kh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD371F0089A
	for <loongarch@lists.linux.dev>; Fri, 29 May 2026 04:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780028713;
	bh=a5SFXwu8A+aI0zODVipwYoc+wNAT2EWiyKCme7a7sBI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dT6nK7khxXfZhm08JViGxN2Y0aYimocT9bSIkw3A432i3JCbhvrHNnQYhN82pp1rO
	 +z0BLUiIftsoPYgR3aX4TmWOqo89NlpootQf/uYqvyZgtxgX5fvqsFyPxcXzA7rLf2
	 Z4GBY07VaZYQobC4GLhOp71fLwAYhRhhF6amUHUuxzlXVzNpB/1gSVgXvLyvb3/aTA
	 0HTlZgFVGusIIrXf1asYmOClwL9eP18ri9A2YBIhVImmj4++wbNMt9Oz2ROH9SFbmu
	 LmhjM8IxZO2kW3ZgX2a/s9dD8Q8l10Van2L7aBvw45Xdr6uWNUNhljcqqkD1HWSonr
	 o2LcR3pftaCQA==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bcc9fdc959cso2301120366b.2
        for <loongarch@lists.linux.dev>; Thu, 28 May 2026 21:25:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9jpklmlOKuFWaQ2E4lcEMmxZlTU0HZLM4fIijAdQeS4Eh18eIaRBDRrrELH5fqPTTnffAKssosYfE=@lists.linux.dev
X-Gm-Message-State: AOJu0YywA63cQ1j93uDCShjEk5x9ADdNan1bh3Mj+K8Qm9t845YDkhZu
	HzCAzio2M+eM8qoSkLgfvMMfRfVH6MFUYC5y0E4Zztz/GA8YhZrWLbiL8lTDFreI52nCQSBefPM
	/VFLjBSCbBDLXkFdaWKuATYAZPKtpFlU=
X-Received: by 2002:a17:907:7392:b0:bd4:d0f2:67b4 with SMTP id
 a640c23a62f3a-be9cd65af15mr29984766b.34.1780028712560; Thu, 28 May 2026
 21:25:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260528135828.196953-1-dongtai.guo@linux.dev>
In-Reply-To: <20260528135828.196953-1-dongtai.guo@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 29 May 2026 12:25:00 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5R9bHP+sGcLBQVa3Jw41+UWHehDecB7de8+2fjV+866Q@mail.gmail.com>
X-Gm-Features: AVHnY4KU-rviRePhyLD0kuiwawDA-6CfRKNFmxpkmS5e-0yWm7timfwUmJXfBtU
Message-ID: <CAAhV-H5R9bHP+sGcLBQVa3Jw41+UWHehDecB7de8+2fjV+866Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] LoongArch: kexec: avoid overwriting QEMU's machine
 FDT at 0x100000
To: George Guo <dongtai.guo@linux.dev>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	George Guo <guodongtai@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, George,

On Thu, May 28, 2026 at 9:58=E2=80=AFPM George Guo <dongtai.guo@linux.dev> =
wrote:
>
> From: George Guo <guodongtai@kylinos.cn>
>
> QEMU places its machine FDT at physical address 0x100000 when booting
> with '-kernel'.  KEXEC_CONTROL_CODE was defined at the same address, so
> machine_kexec_prepare() overwrites the FDT with the relocation trampoline
> before jumping to the new kernel.
>
> The kexec'd kernel's fdt_setup() reads the FDT pointer from the EFI
> config table (FDTPTR =3D 0x100000) and finds trampoline code instead of a
> valid FDT, so earlycon auto-detection fails and the second kernel boots
> silently with no console output.
>
> Move KEXEC_CONTROL_CODE to 0x180000, which is still within the first 2MB
> reserved by memblock_init() and does not conflict with the QEMU FDT.
Modify QEMU seems better.

For kernel, the kexec code is introduced by
4a03b2ac06a5bcae29371866d9d11f5bfd4c9188 ("LoongArch: Add kexec
support") at Oct, 12, 2022.

For QEMU, current FDT is introduced by
6042385149a0fb3f4a51d264fc3dc42775819c79 ("hw/loongarch: Init efi_fdt
table") at April, 26, 2024.
And earlier history is 46b21de238c643ea098f2dcffe493abd135f7d89
("hw/loongarch: Fix loongarch fdt addr confict") which move FDT from
2MB (0x200000) to 1MB(0x100000).
And the earliest QEMU FDT  address is 0x1c400000....

QEMU FDT has changed many times while kexec keep the same always, and
the current FDT address is later than kernel (which means QEMU
conflict with kexec, not kexec conflict with QEMU). So I suggest to
move QEMU FDT to 0x180000.


Huacai

>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> ---
>  arch/loongarch/kernel/machine_kexec.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/arch/loongarch/kernel/machine_kexec.c b/arch/loongarch/kerne=
l/machine_kexec.c
> index d7fafda1d541..44df7dbd3de5 100644
> --- a/arch/loongarch/kernel/machine_kexec.c
> +++ b/arch/loongarch/kernel/machine_kexec.c
> @@ -21,8 +21,13 @@
>  #include <asm/cacheflush.h>
>  #include <asm/page.h>
>
> -/* 0x100000 ~ 0x200000 is safe */
> -#define KEXEC_CONTROL_CODE     TO_CACHE(0x100000UL)
> +/*
> + * Both addresses are within the first 2MB which is always reserved by
> + * memblock_init().  Avoid 0x100000 because QEMU places its machine FDT
> + * there when using '-kernel'; overwriting it silences earlycon in the
> + * kexec'd kernel.
> + */
> +#define KEXEC_CONTROL_CODE     TO_CACHE(0x180000UL)
>  #define KEXEC_CMDLINE_ADDR     TO_CACHE(0x108000UL)
>
>  static unsigned long reboot_code_buffer;
> --
> 2.25.1
>
