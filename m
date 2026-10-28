Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793175802;
	b=GVvNO7HrusxjNYd6TyXtUMkc9WZDVYMWbjBI1+gzw/iG/XHMw3RAWNuLtZDJHTiT6wOS
	 HD4rqrKteXU/h3rIA/E7mH9WQlzm8XJD0+nRAvoBUDGJRDYpRJMhWTkpz4OQBOM1SXlzJ
	 0yQGtDHbPltnu9zZeGNeG4NTth65h+UIkZoYv63M6P10lPGHHIMXvPHMT+9BCXDocXNNI
	 C+aM8f0gYYWqvAuqyzW5dCIxoWHgsGHwStf+gIW7a6rgJ3xGlNoOjuxSFJFMWlQ3xP7BX
	 1TJWMGaJjSxpMj7TCyd7NU92TxahmFCH9Px3HxUIEPcZ3luxCXPcGWtepgZbYAY5Sdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793175802;
	h=Received:DKIM-Signature:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:X-SA-Exim-Mail-From:
	 X-SA-Exim-Scanned;
	bh=oi76zVLqRGBKbEzlYKScXk0Y5BaGKUVtwQusrfnUs5M=;
	b=01Y9Uhdt1QL6POha2NVS+AhLFEHSI23EyOcDv7LQtkFICOtbes6B+jaN48luTdMjPrwD
	 m+DpjOAYA1PxZ5TlR77N7HA41/0elkDSmyFOpmk2IScX/ca+pF28Zaq7ZEJb8AilA/caB
	 OTCXqSqPV4g6HHwsO13JHS59gfTUokkNDVTM6nH0N9pHRcwuD5IAwma3nUGO6vsK5bg16
	 QY9qLsyYpToNeunnUNMXZ3zkm1Sc4SMQKEnazgGdWuYpwbmKlUFNkR7TRqf8yyChh+YjY
	 U1UskjkbkXzXya4kObAOIXFrUYnag8FqZr3LYg/miS+sXF526YEjHOTop4Pfbzzpikg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZL8jr8Y7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775CC606A31A;
	Wed, 28 Oct 2026 08:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZL8jr8Y7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DE3C1F01825;
	Wed, 28 Oct 2026 08:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793175802;
	bh=oi76zVLqRGBKbEzlYKScXk0Y5BaGKUVtwQusrfnUs5M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ZL8jr8Y7iXVGk1a6orLHdtmPCjF718grxXoQZnVPL4GvQRdRl05DjNjcgF+CdvYr1
	 rOFtqbscS6ehiqR8YjtxvacCNlv1Fd7ZP2K5DM6BJO2lVbt0/ICRjzOy+7A3clbSQT
	 3m8CtOkBOAECobb43W+OWcTgS4cyGB44pdS/SV1nsLqpmBCtdd4VWmrBbhMOAtKxPi
	 gczbZb+ZGR+GQqnY11QrHZFtSknxqD4wGYSVgwjticezk5plamMGCfxacwqeo11NVf
	 2ArufGw3NQMjAsVtIIB8HRMgM8ngJEbOmWjR3PSOxOD+m84PX4b/0rrHy1K3UeURcK
	 31f2KlN3Sypcw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xLywJ-000000081ye-2Bov;
	Wed, 28 Oct 2026 08:23:19 +0000
Date: Wed, 28 Oct 2026 08:23:18 +0000
Message-ID: <86qzhaxmh5.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Jiale Yao <yaojiale02@163.com>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Anup Patel <anup@brainfault.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Andrew Jones <andrew.jones@linux.dev>,
	Jonathan Cameron <jic23@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Tomasz Nowicki <tomasz.nowicki@linaro.org>,
	Grant Likely <grant.likely@linaro.org>,
	Jason Cooper <jason@lakedaemon.net>,
	Robert Richter <rrichter@cavium.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Liupu Wang <wangliupu@loongson.cn>,
	Tianyang Zhang <zhangtianyang@loongson.cn>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH 00/12] irqchip: validate remaining MADT records before use
In-Reply-To: <20261028050039.121080-1-yaojiale02@163.com>
References: <20261028050039.121080-1-yaojiale02@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: yaojiale02@163.com, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, lpieralisi@kernel.org, tglx@kernel.org, radu@rendec.net, chenhuacai@kernel.org, kernel@xen0n.name, jiaxun.yang@flygoat.com, anup@brainfault.org, rafael.j.wysocki@intel.com, sunilvl@ventanamicro.com, andrew.jones@linux.dev, jic23@kernel.org, guohanjun@huawei.com, tomasz.nowicki@linaro.org, grant.likely@linaro.org, jason@lakedaemon.net, rrichter@cavium.com, catalin.marinas@arm.com, wangliupu@loongson.cn, zhangtianyang@loongson.cn, lvjianmin@loongson.cn, conor.dooley@microchip.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On Wed, 28 Oct 2026 05:00:27 +0000,
Jiale Yao <yaojiale02@163.com> wrote:
> 
> Several ACPI interrupt-controller callbacks cast generic MADT subtable
> headers to controller-specific records and access typed fields without
> first checking that the firmware supplied the complete structure. A
> truncated entry can therefore cause an out-of-bounds read during early
> interrupt-controller and CPU discovery.
> 
> Add the missing minimum-size checks at the callback boundaries. Records
> which are passed from a probe validator to an initialization callback are
> validated once in the validator, before either callback accesses them.
> 
> The issues were found by code inspection and have not been tested on real
> hardware.

How does this compare to the series posted at [1]?

No version number, no change log, and not even an attempt at a QEMU
test run. If you want people to review this stuff, you need to up your
game a tiny bit.

	M.

[1] https://lore.kernel.org/20261021144524.364143-1-yaojiale02@163.com

-- 
Without deviation from the norm, progress is not possible.
