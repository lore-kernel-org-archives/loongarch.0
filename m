Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A68D36127
	for <loongarch@lists.linux.dev>; Mon,  1 Jul 2024 05:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719813144; cv=none; b=YreY3ppi5dQ2G52nWtSVWJmVSYH6gE99Nd6M2Pz/J3uy801XKiEbhggpU/qUW4q7ZE+IgcUZ5F/RbuHEpt4gWn1DPNieGCRfdoHGrjNXD59l2vAdcZJnYJDg/FMkEr6aqD2mX9VlAb7K3BuP67mV4el49dkprVX9f0FZKIpPzu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719813144; c=relaxed/simple;
	bh=vZGko0eoNLnj84zRoOPdlydINGSPQ6fYtJo/KDahuY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CtodYbvv8J1IvYScItmT/kXVhlPt866k1KRNak48GKqzdigLxoAqRXE8oceQtnplqojFyanLXZIu5UTGKiRiyBquvWABmD3KREBt3Ks0Z8QJq4DBok/ftREFRApAl46R885NJot3dpmO7UCSCPYTl6MUpAQd+i9JPvBTzK++rgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Cv6McS5R; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Cv6McS5R"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6f8edde24b3so1743905a34.2
        for <loongarch@lists.linux.dev>; Sun, 30 Jun 2024 22:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1719813141; x=1720417941; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aKMU8DKIWEClgPDBnmDjtT7Ao2B1dNYMjzwF2iFrrjI=;
        b=Cv6McS5R7zKIigLwFy27unWjJy6Mok8GozunXHFQyoLJL7bLWUFbMU/+MOIuWggYsS
         BuRaTcVhyiWzhgIig2ieFIcJ2ZtUwBXFzlpZuDuG8tV9zWtL8eFJidGXZzp/OZTsZJFb
         CzwgOD8f4vuufgVhy3DIvQs6P42lDmmwmwMpDLuCv9go30COT3HdGyoJgA0AwR6YIW0R
         s0vMUdugrmEWCz2eDEvT/fM8bCW1rNG2/0OkSqUGXZaBWgio1pL7fj1LpPlvR8fHi3Lv
         I0GrIkzoionzPQfLQDBQfblLdPU4+FSPqjFASSPvzh4gXSIUYXqWe6iiYOf8M1Ncg9O8
         I4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719813141; x=1720417941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKMU8DKIWEClgPDBnmDjtT7Ao2B1dNYMjzwF2iFrrjI=;
        b=TyChpxIqO0o2ucbmWLog5WIoHI6u7qennv2TTzjRMV+84yPM5eo33IzH/5+2WHmaYd
         mf1/ddO9XUQxk/LN3H1oSaZfldhl1qNtYzkHq1C9zOwLP7AdV5uXjROqnnTNp/Ano6Kf
         kEzjVz4DP/Y87LcJLCLsNvAWvbnjwlk2fRXDkcQivOBxPbOc2ph6KT2RHj8m4tiOJRCo
         fRK7tgsYWYbB5tEUper3cKhfnRADG1oKNFPD9slomRs1bQA9zrYXLgAoWY/ztKhYtcQN
         bklgSal7IQw/bYBRFrrLyHr7NXsn/NHin1x/Sh3OWX6FN5IYoHrGUf0/mNZWrMnhreNn
         BWUg==
X-Forwarded-Encrypted: i=1; AJvYcCWZbGKJ74BvIOUbLFTJd9KBN4wIqQajhFwzlRmTcVOukTP7MH473pYqIQnejgGFx52p9p2D9GSwe2/Btv8no1tJhw075JeoEDcZ
X-Gm-Message-State: AOJu0YxOtBzuAkioXnGVbRnIYGky5qSsTuqv+fVNYXakKH0WzH1hUdb/
	5dkOghW5cRWiKomkzQzP8/J6avIh4XxICx5QGKTmIeO6d7CFvyRZQx0jhaNajj4=
X-Google-Smtp-Source: AGHT+IGm7YJAgZMyphMx4GQMzsUKLII+YHeZwD23+Ey+akRFhATjAn/ybArgYnMmQp/igw9JEjVJmw==
X-Received: by 2002:a05:6830:903:b0:702:1d8:4d08 with SMTP id 46e09a7af769-702076a4d47mr8000813a34.35.1719813141012;
        Sun, 30 Jun 2024 22:52:21 -0700 (PDT)
Received: from sunil-laptop ([106.51.187.237])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7a9b2d9sm1167621a34.6.2024.06.30.22.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 22:52:20 -0700 (PDT)
Date: Mon, 1 Jul 2024 11:22:03 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: arnd@arndb.de, xiaobo55x@gmail.com, ajones@ventanamicro.com,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Charlie Jenkins <charlie@rivosinc.com>, Baoquan He <bhe@redhat.com>,
	Evan Green <evan@rivosinc.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Chen Jiahao <chenjiahao16@huawei.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Jisheng Zhang <jszhang@kernel.org>,
	James Morse <james.morse@arm.com>, Andy Chiu <andy.chiu@sifive.com>,
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Tony Luck <tony.luck@intel.com>, Ard Biesheuvel <ardb@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Robert Richter <rrichter@amd.com>, Yuntao Wang <ytcoode@gmail.com>,
	Dave Jiang <dave.jiang@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH v4 0/4] Add ACPI NUMA support for RISC-V
Message-ID: <ZoJEA85utEK6u36t@sunil-laptop>
References: <cover.1718268003.git.haibo1.xu@intel.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1718268003.git.haibo1.xu@intel.com>

On Thu, Jun 13, 2024 at 04:54:32PM +0800, Haibo Xu wrote:
> This patch series enable RISC-V ACPI NUMA support which was based on
> the recently approved ACPI ECR[1].
> 
> Patch 1/4 add RISC-V specific acpi_numa.c file to parse NUMA information
> from SRAT and SLIT ACPI tables.
> Patch 2/4 add the common SRAT RINTC affinity structure handler.
> Patch 3/4 change the ACPI_NUMA to a hidden option since it would be selected
> by default on all supported platform.
> Patch 4/4 replace pr_info with pr_debug in arch_acpi_numa_init() to avoid
> potential boot noise on ACPI platforms that are not NUMA.
> 
> Based-on: https://github.com/linux-riscv/linux-riscv/tree/for-next
> 
> [1] https://drive.google.com/file/d/1YTdDx2IPm5IeZjAW932EYU-tUtgS08tX/view?usp=sharing

Hi Palmer,

Can this series be taken for -next?

Thanks,
Sunil
