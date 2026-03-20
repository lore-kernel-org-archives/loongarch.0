Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6EC3793CC;
	Fri, 20 Mar 2026 09:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773997756; cv=none; b=GSJPxTqama1wFwt9tsSZxVnSnUaeaFWbePSgwIaVN4cSWt9GjChFaBfKOA0uixZJcCsF9jhAgUFvDQsrN8rs+jcc1v9DVLBM2i3KWbJgommD8F8XM/dua2l9rd3encKbl7M43ZagQTFuOSGBgCIR7Zli1uhXd/pIRJVuATf7/gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773997756; c=relaxed/simple;
	bh=sdgC/KkwAU//GqwnfohFe3+blWfZ1LFGtORl/qFH1DQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XVKeBTku+ZcspvKdW6axpiVxHnOFVTRUxuhaq8Y4U257xXKPLcInLsqZTtwZqZUsXdlv6PnhY+Q/b1i/GeEQK5XcG4jfXJyA/AeWI91sLD+NevTzpmtaVdUQU/y03BAaokxeaONWJPcqZ3kVYc4ZmLuRBli8l4X/HvPR7fneUHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pUbGz2rE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pUbGz2rE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A6E8C4CEF7;
	Fri, 20 Mar 2026 09:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773997756;
	bh=sdgC/KkwAU//GqwnfohFe3+blWfZ1LFGtORl/qFH1DQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pUbGz2rE90r9tKAzl3vaQGbCiLDtAjpIab+to/8m+8g3i/bQFrTpa3MFHwCQOE6p6
	 Wo7GKo+Nk+pdmDjAJ2AzmhGuncBc4hNcen48r3q6b+yqqzj6djEE/z2zuAkL+SXbzk
	 P3ta7ru0QpQpEzx30qyjA/bvI8mRkNYYivAa1K9P7Jf2jzMljHZwJ+luZSyzQ7beTk
	 WyNncxu122uqcgu52Web8W3qOFgPnSb4N5g2J96JyyLz3iomTlDOSPWfTAQ9baxoLS
	 +QX6c2r3Bdn5P374ItW58T2ac1JMNud2RZyDyNvHJczVKS2765jHwm00cl/xw0OpDB
	 S7WI0ZwvyQ7vg==
From: Thomas Gleixner <tglx@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Icenowy Zheng <uwu@icenowy.me>, Yao Zi <me@ziyao.cc>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, Icenowy Zheng
 <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v3 1/8] MIPS: Loongson64: Override
 arch_dynirq_lower_bound to reserve LPC IRQs
In-Reply-To: <20260314162828.1055188-2-zhengxingda@iscas.ac.cn>
References: <20260314162828.1055188-1-zhengxingda@iscas.ac.cn>
 <20260314162828.1055188-2-zhengxingda@iscas.ac.cn>
Date: Fri, 20 Mar 2026 10:09:10 +0100
Message-ID: <87a4w2lvex.ffs@tglx>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Mar 15 2026 at 00:28, Icenowy Zheng wrote:
> On some Loongson 3A devices, a LPC bus is present and some legacy
> devices (e.g. 8259) on it expect hardcoded low IRQ numbers. However

s/IRQ/interrupt/ all over the place

Change log are supposed to be written in proper prose and not be riddled
with acronyms unless the acronym has a technical relevance like LPC or
ACPI. IRQ[s] does not qualify for that.

Thanks,

     tglx
