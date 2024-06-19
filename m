Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93596224DD
	for <loongarch@lists.linux.dev>; Wed, 19 Jun 2024 02:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718763879; cv=none; b=bCHP0rdWqbhguSNNfUCtuCOwDEYDD3y5itbiZylUjKnJmKciyA4f86E+d/JvJEO8Km4w1W2/xxcx5XVnjMrbvofNzaufybZf5BwWyt6kcNa2PApVZDbEFHLC7saIcD0zNY5yFLMtY/Ir7tVU9wZL/Z3jks4+qJoz98xMgM0oufE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718763879; c=relaxed/simple;
	bh=YdTiG/CZB3kW5hJZRirxPSwhHLjUr7Zwx1Rs51gKz1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L3ytsgxEsy9Leu0INskjqlWeE+9YYGvgvPlyoSWC3eBZ7XEzb8pISHbjTnROFmzoGgc3Ea+FDpntQgzZRO2oxCq4DplNCY3iZ8dvSk8mYl+gUkt1izUH5XMZQWEX/+zoQqI2YR9kTSYheKlHw2FK53ZDe8dM9b6cgVhq7VamIHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OvluqBkJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OvluqBkJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17B87C3277B
	for <loongarch@lists.linux.dev>; Wed, 19 Jun 2024 02:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718763879;
	bh=YdTiG/CZB3kW5hJZRirxPSwhHLjUr7Zwx1Rs51gKz1Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OvluqBkJzPPPIIgHv9DmTCULgSEsCFZT9e/9wAJkmufU1GmWwfkHPkwQLGl43GwKV
	 C3f4gs+NOOoJGVKBXbcZXqC1HzpCD3KgotUGAvKTQ9umefwIxKlWksRiV4dDV4mlPY
	 SRlhqWB/XOrzZoqeOoeFJxTDuv1ID+QP3cuV2Tg0dpD/1/YNKOPIfmAos0yE7BPXJ5
	 18RyX9IWhRn8BZHlodnqVgcOy3soSjA4ZfYk90hfFJWaiAG9zdXxtekvFWy+qe/IIE
	 61HJR6kXnwFcEigJQIjp/rlUsHwKR8SEcmXyre65taJwys5gIxSSaxRfbMmnbFffSG
	 UrN3xGe8GuMNg==
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-361785bfa71so916428f8f.2
        for <loongarch@lists.linux.dev>; Tue, 18 Jun 2024 19:24:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8WAGk5is/39YfBCWXqx0/gkGerSeoE213LEbUeHOVtcQhuhVw/D5+fMYs7F0xQKXuuL1CKfN4b8ZNmcg+F8y9l7e+PR0eVeVf
X-Gm-Message-State: AOJu0Yx23ULNr/+ppy6p+qqmH1bF1JEa6i33SzwagMNJY5ZyphmzuIQK
	wQwG5jk423mWX/rMLcCc2aATNODEDjZL2EhBHyjVjGFuBFyON9fPQhdLJyIk9yHyF3lrZVMtU3n
	stWBmt1IEyUYwvHVDmIjAxudtLBE=
X-Google-Smtp-Source: AGHT+IEQ6lBqSF/SAuTEXT3/C0b8JrIn+1+eVBZa2U4YKfxPYRohzHDTALEnDx9kkLU3Jijf3mBE/Na4m9dHAT/8Vqo=
X-Received: by 2002:a50:c35a:0:b0:57c:4db6:c0fc with SMTP id
 4fb4d7f45d1cf-57d07e7acdbmr508589a12.10.1718763857174; Tue, 18 Jun 2024
 19:24:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1718268003.git.haibo1.xu@intel.com> <f1f96377b8ecd6e3183f28abf5c9ac21cb9855ea.1718268003.git.haibo1.xu@intel.com>
 <CAJve8o=8thBhU3NyTaS6sE9rQ1VR_Qf4O8FkAxpmp1q8P-6VaQ@mail.gmail.com>
 <20240618151820.GA2354@willie-the-truck> <CAJve8o=-bZhQS289jwxG=Aq2BOXk5OzdgPKT=nFE9yw_HYYnQQ@mail.gmail.com>
In-Reply-To: <CAJve8o=-bZhQS289jwxG=Aq2BOXk5OzdgPKT=nFE9yw_HYYnQQ@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 19 Jun 2024 10:24:05 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6qLrQMVEtGgy7VM_cOh+2HytQEZ-9aZc4Gist-rhNZ0Q@mail.gmail.com>
Message-ID: <CAAhV-H6qLrQMVEtGgy7VM_cOh+2HytQEZ-9aZc4Gist-rhNZ0Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] ACPI: NUMA: change the ACPI_NUMA to a hidden option
To: Haibo Xu <xiaobo55x@gmail.com>
Cc: Will Deacon <will@kernel.org>, Haibo Xu <haibo1.xu@intel.com>, sunilvl@ventanamicro.com, 
	arnd@arndb.de, ajones@ventanamicro.com, 
	Catalin Marinas <catalin.marinas@arm.com>, WANG Xuerui <kernel@xen0n.name>, 
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

On Wed, Jun 19, 2024 at 9:18=E2=80=AFAM Haibo Xu <xiaobo55x@gmail.com> wrot=
e:
>
> On Tue, Jun 18, 2024 at 11:18=E2=80=AFPM Will Deacon <will@kernel.org> wr=
ote:
> >
> > On Mon, Jun 17, 2024 at 09:34:18PM +0800, Haibo Xu wrote:
> > > @Catalin Marinas @Huacai Chen
> > >
> > > Could you please have a look at this patch for the ACPI_NUMA config o=
n
> > > ARM64 and LOONGARCH respectively.
> > >
> > > Thanks!
> > >
> > > On Thu, Jun 13, 2024 at 4:37=E2=80=AFPM Haibo Xu <haibo1.xu@intel.com=
> wrote:
> > > >
> > > > x86/arm64/loongarch would select ACPI_NUMA by default and riscv
> > > > would do the same thing, so change it to a hidden option and the
> > > > select statements except for the X86_64_ACPI_NUMA can also go away.
> > > >
> > > > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > > > Suggested-by: Sunil V L <sunilvl@ventanamicro.com>
> > > > Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> > > > Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
> > > > ---
> > > >  arch/arm64/Kconfig        | 1 -
> > > >  arch/loongarch/Kconfig    | 1 -
> > > >  drivers/acpi/numa/Kconfig | 5 +----
> > > >  3 files changed, 1 insertion(+), 6 deletions(-)
> >
> > This looks fine from an arm64 perspective:
> >
> > Acked-by: Will Deacon <will@kernel.org>
Looks fine for LoongArch:

Acked-by: Huacai Chen <chenhuacai@loongson.cn>
> >
>
> Thank you, Will!
>
> > Will
