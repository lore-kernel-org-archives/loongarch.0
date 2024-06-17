Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CAF19A2A5
	for <loongarch@lists.linux.dev>; Mon, 17 Jun 2024 13:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718631275; cv=none; b=tPvVpOTQAHuG+K+bEnUVQctqVUtWv02gSKSy8rtgzv9aDSXK0k8jQdymegz9j7eX1zTYAl2Y79g5RzzrMWudZm4XWrv0RMglfDhuEbl7QAgP6noTIrYTnZd731nVWxJNNymeayIWIXo+Q3XnnvJjTISNzHfMl0t0osm0wzx3dJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718631275; c=relaxed/simple;
	bh=B1S93Pq7+AlrwtbOQxIsMo+PTww/86FdurCQFQ0V7WI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NGdqu0uJTOlbMIVCiVahKBBPKcoB3zm3kMuW44k8tOiokDstz8mjjznPnflTEgnm6+DIljeuBa0MTsChBPtA+Q78jBm2B7MpYmr/6DC0pmAN97P7tqqWMpxyhC9lWUeVFTra4KQlbNUKgVgjoHsnUexlV2d3Bw63Bqa/Nw0tL2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LvmY7TyH; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LvmY7TyH"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52c8342af5eso4632774e87.3
        for <loongarch@lists.linux.dev>; Mon, 17 Jun 2024 06:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718631271; x=1719236071; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xlh1MuJTyolH8Bza5fsBuYqZhmwiMHDDS1wFAKMhcW4=;
        b=LvmY7TyHZafN9Y56MQ8WW5Tq5j47Z8tr1cpHEGFDwP9+R14DFgML7WpC8PmTSkRSDl
         a/vcDtfKKggrP2YfopDsWFUauoSNMn1Pq79MDav+O5GwRXJIkr6C7vAhB7oesmnlaA6h
         pQ/4Zc6L7Npv+PT6w+CguC7lig6L35nPsipvnibfe+ByIXx7ks4YshTWCzj6/uefaxk/
         AFZqz6iyyBST5vLewnfWDeiDpjspnThX9613mBxZOrCduKCuf7Ot8PbYIvqjaSWCzfxH
         1ozzrssfsbgi6e1+3tjIyUM7upEzKwIXvd3uJFTt+ryB17R+sSBJZudo1wZDtolMZoZc
         vO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718631271; x=1719236071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xlh1MuJTyolH8Bza5fsBuYqZhmwiMHDDS1wFAKMhcW4=;
        b=jTdmcUOwZCq3RMSJFWCDBmAD7Oho8qMdo5wieYDAxcGLZvAvKn/asjaLDBnNioxkMa
         4Kd7zxqXGGMOZvio8hzvKfv9iF92f6fVJhYbYF0gD5gEVOBaBjv1ac77HudRhFebDNgG
         Rnp/qXtDfZkzlQ7466k6oaryPq5cvfT/r4un1I12KB/lHtBaA+BkSDvwMcKFbHTAn+ZI
         ESn5Rz1HvLTmT0UwlAQGbYWCko6Tkw5MlKzgszdCl1iJIAFhwcs72xkkrrbvDwGVL1dA
         oofgJfMd8DcsuIVZVJ5L86jvQ9nAJSRpNnQYaKoirGF8aeiyBdilegYOyaBEB6bD+lZk
         kW5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWPsEzlH+9N73NorqIohhZZTy4zU0r37zQN2dfwXy07QNmQTGQJ3aitdGMpZd5VSXo3jRIeb1vjRYeL5cD3zOkqfA3EHUd1lg8L
X-Gm-Message-State: AOJu0Yx1qpp81j57Gk0V20HR4KhJCp94q+bj6YVM2bcjLblm2uR3noc+
	pVgQfAaY4y3DFEQ6OGTRFfdg6SFW2SNOu9kFzrwfc6Yb1e7/N0FAaGpiedoeE9us2MM2kzX3TMA
	4zNsf8iMApFeSyHF4uc+9MyOPE1M=
X-Google-Smtp-Source: AGHT+IGxoq/R66V25JVO/HBkhcEl96wxiJMXgGXl/k0tPpvsH4sU61K9F58Kdy+baOZ9nLjumpg95HzDP25Dn6D6uvU=
X-Received: by 2002:ac2:5551:0:b0:52c:893c:6c2c with SMTP id
 2adb3069b0e04-52ca6e6e205mr5569411e87.40.1718631270478; Mon, 17 Jun 2024
 06:34:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1718268003.git.haibo1.xu@intel.com> <f1f96377b8ecd6e3183f28abf5c9ac21cb9855ea.1718268003.git.haibo1.xu@intel.com>
In-Reply-To: <f1f96377b8ecd6e3183f28abf5c9ac21cb9855ea.1718268003.git.haibo1.xu@intel.com>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Mon, 17 Jun 2024 21:34:18 +0800
Message-ID: <CAJve8o=8thBhU3NyTaS6sE9rQ1VR_Qf4O8FkAxpmp1q8P-6VaQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] ACPI: NUMA: change the ACPI_NUMA to a hidden option
To: Haibo Xu <haibo1.xu@intel.com>
Cc: sunilvl@ventanamicro.com, arnd@arndb.de, ajones@ventanamicro.com, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Evan Green <evan@rivosinc.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Zong Li <zong.li@sifive.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Chen Jiahao <chenjiahao16@huawei.com>, James Morse <james.morse@arm.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Zhao Ke <ke.zhao@shingroup.cn>, 
	Andy Chiu <andy.chiu@sifive.com>, Marc Zyngier <maz@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Tony Luck <tony.luck@intel.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Dan Williams <dan.j.williams@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Robert Richter <rrichter@amd.com>, Yuntao Wang <ytcoode@gmail.com>, Dave Jiang <dave.jiang@intel.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

@Catalin Marinas @Huacai Chen

Could you please have a look at this patch for the ACPI_NUMA config on
ARM64 and LOONGARCH respectively.

Thanks!

On Thu, Jun 13, 2024 at 4:37=E2=80=AFPM Haibo Xu <haibo1.xu@intel.com> wrot=
e:
>
> x86/arm64/loongarch would select ACPI_NUMA by default and riscv
> would do the same thing, so change it to a hidden option and the
> select statements except for the X86_64_ACPI_NUMA can also go away.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Suggested-by: Sunil V L <sunilvl@ventanamicro.com>
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  arch/arm64/Kconfig        | 1 -
>  arch/loongarch/Kconfig    | 1 -
>  drivers/acpi/numa/Kconfig | 5 +----
>  3 files changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 5d91259ee7b5..5079ad4e21a5 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1484,7 +1484,6 @@ config HOTPLUG_CPU
>  config NUMA
>         bool "NUMA Memory Allocation and Scheduler Support"
>         select GENERIC_ARCH_NUMA
> -       select ACPI_NUMA if ACPI
>         select OF_NUMA
>         select HAVE_SETUP_PER_CPU_AREA
>         select NEED_PER_CPU_EMBED_FIRST_CHUNK
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index e38139c576ee..8d9e06e4ad84 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -470,7 +470,6 @@ config NR_CPUS
>  config NUMA
>         bool "NUMA Support"
>         select SMP
> -       select ACPI_NUMA if ACPI
>         help
>           Say Y to compile the kernel with NUMA (Non-Uniform Memory Acces=
s)
>           support.  This option improves performance on systems with more
> diff --git a/drivers/acpi/numa/Kconfig b/drivers/acpi/numa/Kconfig
> index 849c2bd820b9..f33194d1e43f 100644
> --- a/drivers/acpi/numa/Kconfig
> +++ b/drivers/acpi/numa/Kconfig
> @@ -1,9 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  config ACPI_NUMA
> -       bool "NUMA support"
> -       depends on NUMA
> -       depends on (X86 || ARM64 || LOONGARCH)
> -       default y if ARM64
> +       def_bool NUMA && !X86
>
>  config ACPI_HMAT
>         bool "ACPI Heterogeneous Memory Attribute Table Support"
> --
> 2.34.1
>
