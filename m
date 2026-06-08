Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41B72ED84A;
	Mon,  8 Jun 2026 19:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780945246; cv=none; b=sHarnPmDE9vMdsRxnfZ3m8pEqIAi4FdyVPWhZyPBIFhSB8Ar8m8DnassmEZ5r7/if/JyNp/LPk11kRI1mlZbPJD6K8KKWQKLiC0Xk5r7RMlqUJqFu1xC9Y5eiYVEua2flrEYG9/C1EAkuZ5jt329DKWEhDbhyqMXL0MJoK54z9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780945246; c=relaxed/simple;
	bh=IMl6yXurRIPChvDnklny7S5D7DBtCG4R3eBg/Oi5cks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRuo3gPrkKe8OlZXoDQDa9wAj3QR5UcbyqyoiwU22EQy6qsC/I4pPk/3/9ovgg5nDasFIYT9IHg2dn3Oh4rIF27UfbECcQiRM52xkQYnQ3gRnDQ6pxLTUo3/Mh0S64wnJDAIVBiRDb/i90PIphnNbpFxu9cQ6iN5Tgi+7KZE5Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KfHoG14j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KfHoG14j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 086C71F00893;
	Mon,  8 Jun 2026 19:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780945245;
	bh=BoJRT4fDwZJIZj1sKJWduqL1Uc3KtHVy4pz1d5Skq5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KfHoG14jTkmfniNdtVxNENuQMvpWd/NiZFxhjbAOH2qflTZKJQmKrpo5v28Wi+WAs
	 KVXrcoLV9U6kz2x6PapzUAFAESu9QX1LfppzjVC8N46Zjz4Z7sNH1yZ4d/WStaY/Db
	 /X0KZN7bD6W6UX1cOzLU6ci7UDbYfFPVdFgj4ieVJdmN5wwduOPBAUYDy3CVZ0PKTV
	 7jDWA8qALbwrzMysH63nL/ognc+jgZzyQkks66irzQLutLZp6uiVnUjco/Ovf8T61F
	 Hl+i3nfOLaRFfs63ImgogaFfuCOgrM1qeCvRY3e4N9d9jlLv5gNamEcIoZ6c2B1GDW
	 t1bYS9/awuJHw==
Date: Mon, 8 Jun 2026 22:00:22 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, corbet@lwn.net,
	skhan@linuxfoundation.org, catalin.marinas@arm.com, will@kernel.org,
	chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, robh@kernel.org,
	saravanak@kernel.org, bhe@redhat.com, pasha.tatashin@soleen.com,
	pratyush@kernel.org, ruirui.yang@linux.dev, rdunlap@infradead.org,
	peterz@infradead.org, feng.tang@linux.alibaba.com,
	dapeng1.mi@linux.intel.com, kees@kernel.org, elver@google.com,
	kuba@kernel.org, lirongqing@baidu.com, ebiggers@kernel.org,
	paulmck@kernel.org, leitao@debian.org, coxu@redhat.com,
	Liam.Howlett@oracle.com, ryan.roberts@arm.com, osandov@fb.com,
	jbohac@suse.cz, cfsworks@gmail.com, tangyouling@kylinos.cn,
	sourabhjain@linux.ibm.com, ritesh.list@gmail.com,
	adityag@linux.ibm.com, liaoyuanhong@vivo.com, seanjc@google.com,
	fuqiang.wang@easystack.cn, ardb@kernel.org, chenjiahao16@huawei.com,
	guoren@kernel.org, x86@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	kexec@lists.infradead.org
Subject: Re: [PATCH v16 00/10] arm64/riscv: Add support for crashkernel CMA
 reservation
Message-ID: <aicRRrAmuCkTI68e@kernel.org>
References: <20260608073459.3119290-1-ruanjinjie@huawei.com>
 <20260608091000.d88d7f5cc1bc4fa17f5774fe@linux-foundation.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608091000.d88d7f5cc1bc4fa17f5774fe@linux-foundation.org>

On Mon, Jun 08, 2026 at 09:10:00AM -0700, Andrew Morton wrote:
> On Mon, 8 Jun 2026 15:34:49 +0800 Jinjie Ruan <ruanjinjie@huawei.com> wrote:
> 
> > The crash memory allocation, and the exclude of crashk_res, crashk_low_res
> > and crashk_cma memory are almost identical across different architectures,
> > This patch set handle them in crash core in a general way, which eliminate
> > a lot of duplication code.
> > 
> > And add support for crashkernel CMA reservation for arm64 and riscv.
> 
> fyi, AI review might have found a bunch of issues in arch-specific
> code, all of them pre-existing.

v15 grew to 23 patches because of them and Baoquan suggested to split the
fixes into a separate series.
 
> 	https://sashiko.dev/#/patchset/20260608073459.3119290-1-ruanjinjie@huawei.com

-- 
Sincerely yours,
Mike.
