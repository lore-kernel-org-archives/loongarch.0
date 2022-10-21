Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272507B
	for <loongarch@lists.linux.dev>; Fri, 21 Oct 2022 12:01:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC042C433C1;
	Fri, 21 Oct 2022 12:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666353691;
	bh=lFmVFFa/5/iKN/Yo2q9AW/qANwcO3UhaXshlV3Z6Umw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=kiQBMbsyBg7JyvM9JlDzqbseUWfTuCFGqmjFOrnS5Bv/B3HdA51uDLNEdVMBpg/kT
	 6l8LizZqkldUz1mlD6Y+9Pgv9sfIRTMbSFWgOZmGX6Ep2yGBsOflaog3GWqgdNzwxt
	 /nFEQcLM4KyuKH4dNMc71cXam5P/6b0ekEQInTjLZZtKg57J8PkyUxX9SnQceiqN4v
	 yg/snDhaEwK5kRPUDF0Ggg2/MfsrrqBMun+XVylanKhuJfW6Zitw+RyVQhsyhIDuTC
	 SIAQec1Vjjs46rwSe/Um12tcq/3lOVXKN4g3ZlORt717fbLaCoNxgDK7i1F8e9HSQO
	 c3M2OC7XJ1DNQ==
Date: Fri, 21 Oct 2022 07:01:29 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jianmin Lv <lvjianmin@loongson.cn>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Bjorn Helgaas <bhelgaas@google.com>, Len Brown <lenb@kernel.org>,
	rafael@kernel.org, linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH V4 1/4] ACPI / PCI: fix LPIC IRQ model default PCI IRQ
 polarity
Message-ID: <20221021120129.GA185586@bhelgaas>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8a64289-6560-7d75-461c-39b7a612e9c2@loongson.cn>

On Fri, Oct 21, 2022 at 09:58:57AM +0800, Jianmin Lv wrote:
> On 2022/10/21 上午12:47, Bjorn Helgaas wrote:
> > On Thu, Oct 20, 2022 at 04:22:02PM +0800, Jianmin Lv wrote:
> > > On LoongArch ACPI based systems, the PCI devices (e.g. sata
> > > controlers and PCI-to-to PCI bridge controlers) existed in
> > > Loongson chipsets output high-level interrupt signal to the
> > > interrupt controller they connected to,

> > The point is that one should be able to write this code from a spec,
> > without having to empirically discover the interrupt polarity.  What
> > spec tells you about using ACTIVE_HIGH here?
> > 
> Yes, no mentions for the inverter in ACPI spec, the description about
> device interrupt type can be found in Loongson chipset manual:
> 
> https://github.com/loongson/LoongArch-Documentation/blob/main/docs/Loongson-7A1000-usermanual-EN/interrupt-controller/device-interrupt-types.adoc

That's the kind of reference I was looking for.  The link to HTML is
convenient in some ways, but since specs evolve over time and URLs are
ephemeral, I think a citation like "Loongson 7A1000 Bridge User Manual
v2.00, sec 5.3" is more likely to be useful far in the future.

Bjorn
