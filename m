Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37E26112
	for <loongarch@lists.linux.dev>; Wed, 19 Jun 2024 01:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718759890; cv=none; b=lolIdBm8fwgw6kn/EnWJlPLwvR7pg5PFSQUF9rMYHQEGGsIdTVCxEswf04uAWbti1Su4l0PN6HwVn8SLgne0uyw0QuRu+cfDhrJZAWuqXWSzwEjizlmy3F6qKprHhp0HYJnGxgir8Cr1dwZOFQPE0oRQzi1jade0rZ99H/5CPpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718759890; c=relaxed/simple;
	bh=OM+FRXFB6DpgW4Mn/lTWBgeE0bTKzqdd4rxakX3c1ho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BfEii238pGtnEBzz2cp6Ik+vJoLnuGPt8dgUVvB3qChOmakWMhKbxrblFPJ2qZGTEYLKObGE+Oyz7SOBZt4v53SJ3XgkH1g47WW+/XHixEIvWdy6EyCHIeJNAb8QZ5kPga1Qk6da/8nDVjZ8iInRM+03CVk0EY6e/eU+TFTEtSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1wLUEeh; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1wLUEeh"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ec002caf3eso100941931fa.1
        for <loongarch@lists.linux.dev>; Tue, 18 Jun 2024 18:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718759887; x=1719364687; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ey5yiVQA8LBP/6zYkNpIcrvI4fFdl2/Q3IQajczTvLM=;
        b=S1wLUEehzirVZL9YIuNXuzHUeDcGCOs70djkeFX82+2tSKw2TqVDNlram14/T5A4/R
         3PlyBNdvn17fHQsyCZw0BybcRJMsM5nxj2OSgee1eZyZpn7D2djelb8+bGoceimv7asS
         +TtDbUfkYrSSwkn5WVEo5g1ONAPxztiRLlHbEh1ULWvg9z9mjQGFymMGSEjsMFU1i9SK
         0tYUfsLDiT6RA/aTmfdE+ah+LzPCYeU5wcT+ujJ3TploKWoHVZ8dpON2sjSKjlHh/vN+
         LBA3X+0MImpTAvejSU1jGfmWeIOaP5XqNB6WqQrDGbSrWN8C+TDIs87EREanb7PexvsH
         eGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718759887; x=1719364687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ey5yiVQA8LBP/6zYkNpIcrvI4fFdl2/Q3IQajczTvLM=;
        b=vgYylT22sbs1yvgBFjeiUHSfP9A+vfVLA/S3i4dHAaoNDPyqlYl9RUKuzsvKzGSXwZ
         nxpnZNoXa6NxFHMbzEBwgJAYw4Wv29EG+3r08neiVPv5vYhj6IaSSGimbffEUvbkEN/B
         aSz6cqSDSa3u0CTcdSKe1HeruWyULpAdG0MjK6knt1DHbUXlRSqQA0bgcPDRLmpjGjGN
         Zbk3Whzu7vCOeWrw3pN6z4fScckJOTWHi/I7dAGMDY0af7bLYXfxgPfIkdrpoBK9FvLl
         g2OjQWddx60KU9iJrh6yYO6En1t+2y8hXUjNhxd5W3WfMwnFPtUHqowxcJvFklN2MhhO
         ks1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/1sjraiTGOzdjkZsJ4STX6biVoqtMZoJMH4jaj5XPqc8N7XekgQNIjNtLHFo4yjxLjD2YtpAGWlY/jWUN4F139bDtldIcL1Jf
X-Gm-Message-State: AOJu0Yz1zLGXqDuvhLHqmoC40gQ/hFNSo6Pp0gaPedSxI62mKqhJhZh0
	RM8HMWwrfBnZljTt1P4bHtc2qN17+lgZL3UrpvaiUu6o51eLDK5I0PWvLzBtReMR4TpdiJa+7Pf
	FrL2U9B5eBNMW9jNHn6xc8tEprYY=
X-Google-Smtp-Source: AGHT+IFiTPEbVFgx6S7H+uJNwNOLjAFLVL5/Vnh5jjNpcZV25rpymoEhI57ECx4iXoR1vGPAbIVLdQm2Xan1iCOIji0=
X-Received: by 2002:a2e:9f02:0:b0:2ea:ec52:f594 with SMTP id
 38308e7fff4ca-2ec3ced1896mr8494161fa.29.1718759886352; Tue, 18 Jun 2024
 18:18:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1718268003.git.haibo1.xu@intel.com> <f1f96377b8ecd6e3183f28abf5c9ac21cb9855ea.1718268003.git.haibo1.xu@intel.com>
 <CAJve8o=8thBhU3NyTaS6sE9rQ1VR_Qf4O8FkAxpmp1q8P-6VaQ@mail.gmail.com> <20240618151820.GA2354@willie-the-truck>
In-Reply-To: <20240618151820.GA2354@willie-the-truck>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 19 Jun 2024 09:17:54 +0800
Message-ID: <CAJve8o=-bZhQS289jwxG=Aq2BOXk5OzdgPKT=nFE9yw_HYYnQQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] ACPI: NUMA: change the ACPI_NUMA to a hidden option
To: Will Deacon <will@kernel.org>
Cc: Haibo Xu <haibo1.xu@intel.com>, sunilvl@ventanamicro.com, arnd@arndb.de, 
	ajones@ventanamicro.com, Catalin Marinas <catalin.marinas@arm.com>, 
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

On Tue, Jun 18, 2024 at 11:18=E2=80=AFPM Will Deacon <will@kernel.org> wrot=
e:
>
> On Mon, Jun 17, 2024 at 09:34:18PM +0800, Haibo Xu wrote:
> > @Catalin Marinas @Huacai Chen
> >
> > Could you please have a look at this patch for the ACPI_NUMA config on
> > ARM64 and LOONGARCH respectively.
> >
> > Thanks!
> >
> > On Thu, Jun 13, 2024 at 4:37=E2=80=AFPM Haibo Xu <haibo1.xu@intel.com> =
wrote:
> > >
> > > x86/arm64/loongarch would select ACPI_NUMA by default and riscv
> > > would do the same thing, so change it to a hidden option and the
> > > select statements except for the X86_64_ACPI_NUMA can also go away.
> > >
> > > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > > Suggested-by: Sunil V L <sunilvl@ventanamicro.com>
> > > Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> > > Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
> > > ---
> > >  arch/arm64/Kconfig        | 1 -
> > >  arch/loongarch/Kconfig    | 1 -
> > >  drivers/acpi/numa/Kconfig | 5 +----
> > >  3 files changed, 1 insertion(+), 6 deletions(-)
>
> This looks fine from an arm64 perspective:
>
> Acked-by: Will Deacon <will@kernel.org>
>

Thank you, Will!

> Will
