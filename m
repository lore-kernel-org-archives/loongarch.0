Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1C020B7FD;
	Tue, 18 Mar 2025 11:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742299077; cv=none; b=fvYcyfjIGeZNLdU8+taUI3k4E5kjl8B8U5frPB1g9ItsjN7yrcjea/kLp4k3TZxQ9fDBIHhoo1ETWOq9QhKwFX1mCPx8m/1pkYqwZId+rWzmj4kndns83LjLnQtT/b9yOJ+EnD8asIdLpxqxNWMtgjFVRdsQQ3fnYnsYkXIjGWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742299077; c=relaxed/simple;
	bh=CIhTjH9kKlO1VYGiipc2V9drjBD3Ayt0OkD0U7KRb6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=glKBe4PT/F9TlKgVCpBMsUU1qGpCU5vlF42LRPWXW6uyzchHIjHdpkheeHrAket73nTRvDVDqRLsbo9wDd6N8N/vB11e3Q09Bx3ABm+AvMvJI2R7o2UUAoAeq77/dMtGy20TSrtlWas6S46ixoZATgbFlhtivOAMwXoKsjDdG8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VNZz+D/d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VNZz+D/d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75850C4CEF7;
	Tue, 18 Mar 2025 11:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742299076;
	bh=CIhTjH9kKlO1VYGiipc2V9drjBD3Ayt0OkD0U7KRb6w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VNZz+D/dtbyshE97W4HnLDn48vAHhWJ1qM3mL/ZcYLXzJCavmJHa91JYiiOlMNJbz
	 3UQHEcUGagflvTa1naQQ3WhxL7VDkHEqM2S7CkzCA9R2QNMrKsOF/87TV8TeAU7pag
	 JnyeHsFK4NM+n6Sd6iwRDBgTTtsst7XHqqi+SMHGvuW0tYLqcabFNOqlgCauzVkD73
	 FEV87vVnNi6+5cugxgHyXPjIWm09qmE4hdd7e5vWrscoz4DVCqYqP4MsFlrfEg/D+e
	 hisoP8e3IL/aZBRIfu7TRQITKlDjGtX7HEA5nLU4mGdskuoLTKP3Pn1CaVYbWjJBBQ
	 A9XO+vMkI9ejg==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac25d2b2354so942608466b.1;
        Tue, 18 Mar 2025 04:57:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW9sIxGU8Ue/Xb1SKCMnfFTKJCI1nsoNxYU9tfHldaJ2lSmC+3rH+fjC26KKdrkrkYGtXma32PBtXI=@lists.linux.dev, AJvYcCWh+wegSZEbXAu1O4tyyJGjgZ7qIV7x6r0QmsTbqZzXL0ibIuGS0vKCRSMXoUEHYqi6dWtU@lists.linux.dev
X-Gm-Message-State: AOJu0Yzl4TjPYWBE/5L5N6YWP6P4zvTcPc/actlpc1Ge4tN+ujjGmqAO
	8MerhiauVCQdMfjSm10655ukWFVCO9AX3V6EOr4crubu36Ny9BLBVFcXuWmxpz4aa9Owzvgz9NU
	9yWel2EjYm+COWjylVDCXFig3syQ=
X-Google-Smtp-Source: AGHT+IHWKrMLWQmDlK3EXFGkIz3JuWrB7n/PbIZxnJSxvCf68cavwFPKlU+WgeLv6v2/CTfArLyeiik7sHtiA+Oo+58=
X-Received: by 2002:a17:907:1009:b0:ac3:3f10:e8e3 with SMTP id
 a640c23a62f3a-ac33f10ed5cmr1299294766b.1.1742299074804; Tue, 18 Mar 2025
 04:57:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250115-fix-riscv-rt_group_sched-v4-0-607606fe73a5@coelacanthus.name>
 <20250115-fix-riscv-rt_group_sched-v4-4-607606fe73a5@coelacanthus.name> <t2dustbykx2qd24wazjeiw5hch5nwr6z2ewmaf4srg6r2grwrf@rdw47chzkef2>
In-Reply-To: <t2dustbykx2qd24wazjeiw5hch5nwr6z2ewmaf4srg6r2grwrf@rdw47chzkef2>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 18 Mar 2025 19:57:44 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4fTGs-7EXE0EcR=P6GqHF2fokRE-kEte+cDmhjy=FYsA@mail.gmail.com>
X-Gm-Features: AQ5f1Jo4W5NNqo2SfcBdxKCe2OFxQs4im7DaCODl6wEw6MnCM3-sp2pnyba2ZAw
Message-ID: <CAAhV-H4fTGs-7EXE0EcR=P6GqHF2fokRE-kEte+cDmhjy=FYsA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm: defconfig: drop RT_GROUP_SCHED=y from bcm2835/tegra/omap2plus
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Celeste Liu <uwu@coelacanthus.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Anup Patel <anup@brainfault.org>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, WANG Xuerui <kernel@xen0n.name>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Russell King <linux@armlinux.org.uk>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Tony Lindgren <tony@atomide.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-tegra@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>, 
	Thierry Reding <treding@nvidia.com>, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 7, 2025 at 3:19=E2=80=AFAM Thierry Reding <thierry.reding@gmail=
.com> wrote:
>
> On Wed, Jan 15, 2025 at 04:41:23AM +0800, Celeste Liu wrote:
> > Commit 673ce00c5d6c ("ARM: omap2plus_defconfig: Add support for distros
> > with systemd") said it's because of recommendation from systemd. But
> > systemd changed their recommendation later.[1]
> >
> > For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierar=
chy it
> > needs an RT budget assigned, otherwise the processes in it will not be =
able to
> > get RT at all. The problem with RT group scheduling is that it requires=
 the
> > budget assigned but there's no way we could assign a default budget, si=
nce the
> > values to assign are both upper and lower time limits, are absolute, an=
d need to
> > be sum up to < 1 for each individal cgroup. That means we cannot really=
 come up
> > with values that would work by default in the general case.[2]
> >
> > For cgroup v2, it's almost unusable as well. If it turned on, the cpu c=
ontroller
> > can only be enabled when all RT processes are in the root cgroup. But i=
t will
> > lose the benefits of cgroup v2 if all RT process were placed in the sam=
e cgroup.
> >
> > Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doe=
sn't
> > support it.
> >
> > [1]: https://github.com/systemd/systemd/commit/f4e74be1856b3ac058acbf1b=
e321c31d5299f69f
> > [2]: https://bugzilla.redhat.com/show_bug.cgi?id=3D1229700
> >
> > Tested-by: Stefan Wahren <wahrenst@gmx.net>
> > Acked-by: Kevin Hilman <khilman@baylibre.com>
> > Acked-by: Thierry Reding <treding@nvidia.com>
> > Signed-off-by: Celeste Liu <uwu@coelacanthus.name>
> > ---
> >  arch/arm/configs/bcm2835_defconfig   | 1 -
> >  arch/arm/configs/omap2plus_defconfig | 1 -
> >  arch/arm/configs/tegra_defconfig     | 1 -
> >  3 files changed, 3 deletions(-)
>
> Hi Arnd,
>
> is this something that you could pick up? I think so far only the RISC-V
> patch was picked up, but nobody seems to feel responsible for the ARM
> patch here.
I will take the LoongArch patch, but may be squashed to another one
about config file update.

Huacai

>
> Thierry
